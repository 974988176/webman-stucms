<?php

namespace app\controller;

use app\model\Course;
use app\model\Exam;
use app\model\Score;
use app\model\Student;
use app\service\ScoreService;
use Box\Spout\Common\Exception\IOException;
use Box\Spout\Common\Exception\UnsupportedTypeException;
use Dcat\EasyExcel\Excel;
use DI\Attribute\Inject;
use Illuminate\Database\Query\Builder;
use plugin\admin\app\controller\Crud;
use support\Db;
use support\exception\BusinessException;
use support\Request;
use support\Response;

/**
 * 成绩查询
 */
class ScoreQueryController extends Crud
{
    private ScoreService $scoreService;
    /**
     * @var Score
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Score;
        $this->scoreService = new ScoreService();
    }

    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        $courses = Course::orderBy("id")->get();
        $exams = Exam::orderBy("time")->get();
        return view('score-query/index', compact('courses', 'exams'));
    }

    /**
     * 查询
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function select(Request $request): Response
    {
        $limit = (int)$request->get('limit', 10);
        $limit = $limit <= 0 ? 10 : $limit;
        $exam_id = $request->get('exam_id'); // 搜索考试
        $name = $request->get('name'); // 搜索姓名
        $uid = $request->get('uid'); // 搜索学号

        $query = $this->getQuery();
        if (!empty($name)) {
            $query->where("u.name", "like", "%$name%");
        }
        if (!empty($exam_id)) {
            $query->where("e.id", "=", $exam_id);
        }
        if (!empty($uid)) {
            $query->where("u.uid", "like", "%$uid%");
        }
        $courses = Course::orderBy("id")->get();
        $paginator = $query->paginate($limit);
        $total = $paginator->total();
        $items = $paginator->items();
        // 遍历结果，给每一行添加上各个课上的成绩，这里的结果是分页后的，不会有很大的数据
        foreach ($courses as $course) {
            foreach ($items as $item) {
                // 根据 student_id，exam_id和course_id三个条件，唯一确定课程成绩
                $score = Score::where(['student_id' => $item->sid, "exam_id" => $item->eid, "course_id" => $course->id])->value("score") ?? 0;
                $item->{$course->name} = $score;
            }
        }

        return json(['code' => 0, 'msg' => 'ok', 'count' => $total, 'data' => $items]);
    }

    /**
     * 获取查询query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    private function getQuery(): \Illuminate\Database\Eloquent\Builder
    {
        $query = Score::query()
            ->join("stu_students as u", "u.id", "=", "stu_scores.student_id")
            ->join("stu_exams as e", "e.id", "=", "stu_scores.exam_id")
            ->groupBy("u.id", "e.id")
            ->orderBy("e.id")
            ->orderBy("u.id")
            ->selectRaw("u.id as sid,	e.id as eid,
	u.`NAME` AS `name`,
	u.uid,
	e.`NAME` AS exam,
	SUM( stu_scores.score ) AS sum,
	format( AVG( stu_scores.score ), 2 ) AS avg,
	format( STD( stu_scores.score ), 2 ) AS std ");
        return $query;
    }

    /**
     * 获取课程的满分分数
     * @return Response
     */
    public function getFull()
    {
        $field = request()->input("field");
        $course_id = request()->input('course_id');

        if (empty($field) && $course_id) {
            // 添加成绩时
            $full = Course::where('id', '=', $course_id)->value('full');
        } else if ($field && empty($course_id)) {
            // 修改成绩时
            $full = Course::where('name', '=', $field)->value('full');
        }
        if (empty($full)) {
            throw new BusinessException("无分数");
        }
        return json(['full' => $full]);
    }

    /**
     * 更新
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function update(Request $request): Response
    {
        $student_id = \request()->input("sid");
        $course = \request()->input("course");
        $score = \request()->input("score");
        $exam_id = \request()->input("eid");

        if ($score < 0 or $score > 150) {
            return $this->json(1, "成绩不合法,成绩应在0-150分之间");
        }
        $course_id = Course::where('name', '=', $course)->value('id');
        if (empty($course_id)) {
            throw new BusinessException("非法课程名");
        }
        // 有可能是不存在的成绩，添加
        $exists = Score::where(compact('student_id', 'course_id', 'exam_id'))->exists();
        if ($exists) {
            $res = Score::where(compact('student_id', 'course_id', 'exam_id'))
                ->update(['score' => $score]);
        } else {
            $res = Score::insert(compact('student_id', 'course_id', 'exam_id', 'score'));
        }

        if ($res) {
            return $this->json(0, "修改成功");
        } else {
            return $this->json(1, "修改失败");
        }
    }

    /**
     * 显示Excel导入页面
     * @return Response
     */
    public function importView()
    {
        return view("score-query/import");
    }

    /**
     * 导入成绩
     * @param Request $request
     * @return Response
     * @throws IOException
     * @throws UnsupportedTypeException
     */
    public function doImportExcel(Request $request)
    {
        $uploadFiles = $request->file("excel");
        $headings = $this->scoreService->getExportHeader(false);
        $firstSheetData = Excel::xlsx($uploadFiles)
            ->headings($headings)
            ->first()->toArray(); // 上传的excel数据

        $courses = Course::query()->get();
        Db::transaction(function () use ($firstSheetData, $courses) {
            foreach ($firstSheetData as $line => $row) {
                $this->scoreService->checkExcelRow($row, $line);
                $student_id = Student::query()->where("uid", $row['uid'])->value("id");
                $exam_id = Exam::query()->where("name", $row['exam'])->value("id");

                foreach ($courses as $course) {
                    if (isset($row[$course->name])) {
                        $score = $row[$course->name];
                        $course_id = Course::query()->where("name", $course->name)->value("id");
                        Score::query()->updateOrCreate(compact('student_id', 'exam_id', 'course_id'), ['score' => $score]);
                    }
                }
            }
        });

        return $this->success("ok", ['count' => count($firstSheetData)]);
    }

    /**
     * 下载成绩导入模板
     * @return Response
     * @throws IOException
     */
    public function downloadTemplate()
    {
        $fileName = "学生成绩导入模板.xlsx";
        $headings = $this->scoreService->getExportHeader(false);
        // 导出数据，只列出学号和姓名
        $array = Student::query()->select(['name', 'uid'])->get()->toArray();
        foreach ($array as $key => &$item) {
            $item['index'] = $key + 1;
        }
        Excel::xlsx($array)->headings($headings)->store($fileName);
        return downloadExcel($fileName);
    }


    /**
     * 导出成绩为Excel
     * @return Response
     */
    public function export()
    {
        $query = $this->getQuery();
        $data = $query->get();
        $courses = Course::orderBy("id")->get();
        // 遍历结果，给每一行添加上各个课上的成绩，这里的结果是分页后的，不会有很大的数据

        foreach ($data as $idx => $item) {
            $item->index = $idx + 1;
            foreach ($courses as $course) {
                // 根据 student_id，exam_id和course_id三个条件，唯一确定课程成绩
                $score = Score::where(['student_id' => $item->sid, "exam_id" => $item->eid, "course_id" => $course->id])->value("score") ?? 0;
                $item->{$course->name} = $score;
            }
        }

        $fileName = "成绩列表.xlsx";
        $arr = $data->toArray();
        $headings = $this->scoreService->getExportHeader();

        Excel::xlsx($arr)->headings($headings)->store($fileName);
        return downloadExcel($fileName);
    }

}
