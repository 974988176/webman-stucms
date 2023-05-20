<?php

namespace app\controller;

use app\model\Course;
use app\model\Exam;
use app\model\Score;
use plugin\admin\app\controller\Crud;
use support\Db;
use support\exception\BusinessException;
use support\Request;
use support\Response;

/**
 * 总体分析
 */
class ScoreAllAnalyzeController extends Crud
{

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
    }

    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        $exams = Exam::orderBy('time')->get();
        $exam_first = Exam::first();
        if ($exam_first) {
            $first_id = $exam_first->id;
        } else {
            $first_id = 0;
        }

        return view('score-all-analyze/index', compact('exams', 'first_id'));
    }

    /**
     * 获取设置中优秀率等的比率
     * @return array|float[]|int[]
     */
    private function getRate()
    {
        $rate = config('stucms.score.rate');
        return array_map(
            function ($item) {
                return $item / 100;
            },
            $rate
        );
    }

    /**
     * 查询总体成绩
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function select(Request $request): Response
    {
        $eid = request()->input('exam_id');

        // 某一次考试的总体成绩，按课程分组，获取这次考试课程的参考人数，最高分，最低分，平均分，方差，标准差等
        $oneExamAllScores = Db::table("stu_scores", "sc")
            ->join("stu_courses as c", "c.id", "=", "sc.course_id")
            ->join("stu_exams as e", "e.id", "=", "sc.exam_id")
            ->where("e.id", $eid)
            ->groupBy("c.id", "e.id")
            ->orderBy("c.id")
            ->selectRaw("c.name course,
	c.id cid,
	e.id eid,
	e.name exam,
	c.full AS full,
	count(*) join_num,
	format( STD( sc.score ), 2 ) std,
	format( AVG( sc.score ), 2 ) avg,
	MAX( sc.score ) max,
	min( sc.score ) min ")
            ->get();

        // $oneExamAllScores 中没有不及格，及格，良好，优秀的人数，根据设置的比例再进行查找
        foreach ($oneExamAllScores as $oneExamAllScore) {
            $oneExamAllScore->youxiu = $this->getYouXiuCountByCeid($oneExamAllScore->eid, $oneExamAllScore->cid);
            $oneExamAllScore->lianghao = $this->getLiangHaoCount($oneExamAllScore->eid, $oneExamAllScore->cid);
            $oneExamAllScore->jige = $this->getJiGeCount($oneExamAllScore->eid, $oneExamAllScore->cid);
            $oneExamAllScore->bujige = $this->getBuJiGeCount($oneExamAllScore->eid, $oneExamAllScore->cid);
        }

        return $this->formatNormal($oneExamAllScores, count($oneExamAllScores));
    }

    /**
     * 查看课程成绩饼图
     * @return Response
     */
    public function showCoursePie(): Response
    {
        $cid = request()->input("cid");
        $eid = request()->input("eid");
        $courseName = Course::where("id", $cid)->value("name");
        $examName = Exam::where("id", $eid)->value("name");
        $json_str = '{"name": "","type": "pie","radius": "55%","center": ["45%", "50%"],
                        "data": [],
                        "emphasis": {
                            "itemStyle": {
                                "shadowBlur": 10,
                                "shadowOffsetX": 0,
                                "shadowColor": "rgba(0, 0, 0, 0.5)"
                            }
                        }}';
        $data = json_decode($json_str, true);
        $data['name'] = $courseName;
        $data['data'][] = ['name' => '优秀', 'value' => $this->getYouXiuCountByCeid($eid, $cid)];
        $data['data'][] = ['name' => '良好', 'value' => $this->getLiangHaoCount($eid, $cid)];
        $data['data'][] = ['name' => '及格', 'value' => $this->getJiGeCount($eid, $cid)];
        $data['data'][] = ['name' => '不及格', 'value' => $this->getBuJiGeCount($eid, $cid)];

        return view('score-all-analyze/showPie', ['data' => $data, 'course' => $courseName, 'exam' => $examName]);
    }

    /**
     * 显示学生气泡提示
     * @return Response
     */
    public function tips()
    {
        $cid = request()->input('cid');
        $eid = request()->input('eid');
        $field = request()->input('field');
        $youXiuRate = $this->getRate()['youxiu'];
        $lianghaoRate = $this->getRate()['lianghao'];
        $jigeRate = $this->getRate()['jige'];
        $full = Course::where("id", $cid)->value("full");

        if ($field == 'max') {
            /*SELECT
	stu_scores.score,
	stu_students.`name`
FROM
	stu_scores
	INNER JOIN stu_students ON stu_scores.student_id = stu_students.id
	WHERE exam_id = 1
	AND course_id = 1 AND score=136*/
            $max = Score::where(['exam_id' => $eid, 'course_id' => $cid])->max("score"); // 最高分数
            $data = Score::query()
                ->join("stu_students", 'stu_scores.student_id', "=", "stu_students.id")
                ->where(['exam_id' => $eid, 'course_id' => $cid, 'score' => $max])
                ->selectRaw("stu_scores.score,stu_students.`name`")
                ->get()->toArray(); // 最高分数的学生姓名和分数
            //
            //
            // $sql = "SELECT u.name,s.score FROM (select exam_id,course_id,max(score) max from scores sc where exam_id={$eid} and course_id={$cid}) t,scores s,students u WHERE t.max=s.score and t.exam_id=s.exam_id and t.course_id=s.course_id and u.id=s.student_id";
        } elseif ($field == 'min') {
            $min = Score::where(['exam_id' => $eid, 'course_id' => $cid])->min("score"); // 最低分数
            $data = Score::query()
                ->join("stu_students", 'stu_scores.student_id', "=", "stu_students.id")
                ->where(['exam_id' => $eid, 'course_id' => $cid, 'score' => $min])
                ->selectRaw("stu_scores.score,stu_students.`name`")
                ->get()->toArray(); // 最低分数的学生姓名和分数
            // $sql = "SELECT u.name,s.score FROM (select exam_id,course_id,min(score) min from scores sc where exam_id={$eid} and course_id={$cid}) t,scores s,students u WHERE t.min=s.score and t.exam_id=s.exam_id and t.course_id=s.course_id and u.id=s.student_id";
        } elseif ($field == 'youxiu') {
            $data = Score::query()
                ->join("stu_students", 'stu_scores.student_id', "=", "stu_students.id")
                ->where(['exam_id' => $eid, 'course_id' => $cid])
                ->where("score", ">=", $full * $youXiuRate)
                ->selectRaw("stu_scores.score,stu_students.`name`")
                ->get()->toArray();
            // $sql = "SELECT u.name,sc.score FROM scores sc,students u,(select full/100 rate from courses where id={$cid}) t WHERE sc.exam_id={$eid} and sc.course_id={$cid} and u.id=sc.student_id and sc.score>={$rate['youxiu']}*t.rate";
        } elseif ($field == 'lianghao') {
            $data = Score::query()
                ->join("stu_students", 'stu_scores.student_id', "=", "stu_students.id")
                ->where(['exam_id' => $eid, 'course_id' => $cid])
                ->where("score", "<", $full * $youXiuRate)
                ->where("score", ">=", $full * $lianghaoRate)
                ->selectRaw("stu_scores.score,stu_students.`name`")
                ->get()->toArray();

            // $sql = "SELECT u.name,sc.score FROM scores sc,students u,(select full/100 rate from courses where id={$cid}) t WHERE sc.exam_id={$eid} and sc.course_id={$cid} and u.id=sc.student_id and sc.score<{$rate['youxiu']}*t.rate and sc.score>={$rate['lianghao']}*t.rate";
        } elseif ($field == 'jige') {
            $data = Score::query()
                ->join("stu_students", 'stu_scores.student_id', "=", "stu_students.id")
                ->where(['exam_id' => $eid, 'course_id' => $cid])
                ->where("score", "<", $full * $lianghaoRate)
                ->where("score", ">=", $full * $jigeRate)
                ->selectRaw("stu_scores.score,stu_students.`name`")
                ->get()->toArray();

            // $sql = "SELECT u.name,sc.score FROM scores sc,students u,(select full/100 rate from courses where id={$cid}) t WHERE sc.exam_id={$eid} and sc.course_id={$cid} and u.id=sc.student_id and sc.score<{$rate['lianghao']}*t.rate and sc.score>={$rate['jige']}*t.rate";
        } elseif ($field == 'bujige') {
            $data = Score::query()
                ->join("stu_students", 'stu_scores.student_id', "=", "stu_students.id")
                ->where(['exam_id' => $eid, 'course_id' => $cid])
                ->where("score", "<", $full * $jigeRate)
                ->selectRaw("stu_scores.score,stu_students.`name`")
                ->get()->toArray();
            // $sql = "SELECT u.name,sc.score FROM scores sc,students u,(select full/100 rate from courses where id={$cid}) t WHERE sc.exam_id={$eid} and sc.course_id={$cid} and u.id=sc.student_id and sc.score<{$rate['jige']}*t.rate";
        }
        // $data = DB::table(DB::raw("($sql) as res"))->get()->toArray();
        if ($data) {
            return $this->success('ok', $data);
        } else {
            return $this->fail();
        }
    }

    /**
     * 获取某次考试，某个课程的优秀个数
     * @param int $eid 考试id
     * @param int $cid 课程id
     * @return int
     */
    private function getYouXiuCountByCeid($eid, $cid): int
    {
        $youXiuRate = $this->getRate()['youxiu'];
        $full = Course::where("id", $cid)->value("full");
        return Score::where([
            'exam_id' => $eid,
            'course_id' => $cid,
        ])
            ->where("score", ">=", $full * $youXiuRate)
            ->count();
    }

    /**
     * 获取某次考试，某个课程的良好个数
     * @param int $eid 考试id
     * @param int $cid 课程id
     * @return int
     */
    private function getLiangHaoCount($eid, $cid): int
    {
        $full = Course::where("id", $cid)->value("full");
        $youXiuRate = $this->getRate()['youxiu'];
        $liangHaoRate = $this->getRate()['lianghao'];
        return Score::where([
            'exam_id' => $eid,
            'course_id' => $cid,
        ])
            ->where("score", "<", $full * $youXiuRate)
            ->where("score", ">=", $full * $liangHaoRate)
            ->count();
    }

    /**
     * 获取某次考试，某个课程的及格个数
     * @param int $eid 考试id
     * @param int $cid 课程id
     * @return int
     */
    private function getJiGeCount($eid, $cid): int
    {
        $full = Course::where("id", $cid)->value("full");
        $liangHaoRate = $this->getRate()['lianghao'];
        $jiGeRate = $this->getRate()['jige'];
        return Score::where([
            'exam_id' => $eid,
            'course_id' => $cid,
        ])
            ->where("score", "<", $full * $liangHaoRate)
            ->where("score", ">=", $full * $jiGeRate)
            ->count();
    }

    /**
     * 获取某次考试，某个课程的不及格个数
     * @param int $eid 考试id
     * @param int $cid 课程id
     * @return int
     */
    private function getBuJiGeCount($eid, $cid): int
    {
        $full = Course::where("id", $cid)->value("full");
        $jiGeRate = $this->getRate()['jige'];
        return Score::where([
            'exam_id' => $eid,
            'course_id' => $cid,
        ])
            ->where("score", "<", $full * $jiGeRate)
            ->count();
    }

}
