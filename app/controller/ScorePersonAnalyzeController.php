<?php

namespace app\controller;

use app\model\Score;
use app\model\Student;
use plugin\admin\app\common\Auth;
use plugin\admin\app\controller\Crud;
use support\Db;
use support\exception\BusinessException;
use support\Request;
use support\Response;

/**
 * 成绩个人分析
 */
class ScorePersonAnalyzeController extends Crud
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
        // 判断是不是管理员，如果不是，则渲染学生的页面
        if (!Auth::isSupperAdmin()) {
            $uid = admin('username');
            $student_id = Student::where('uid', $uid)->value('id');
            if (!$student_id) {
                throw new BusinessException("非法用户22");
            }

            return view('score-person-analyze/student', compact("student_id"));
        }
        return view('score-person-analyze/admin');
    }

    /**
     * 查询
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function select(Request $request): Response
    {
        $name = request()->input('name'); // 搜索姓名

        // 要列出至少有一门考试的学生的列表，形成表格
        $uid = Score::distinct()->pluck('student_id')->toArray();
        // 根据这个uid,从学生表里面找
        $query = Student::whereIn('id', $uid)->select('id', 'uid', 'name');
        // 搜索名
        if ($name) {
            $query->where('name', 'like', "%$name%");
        }

        // 权限判断,如果不是管理员,只允许看自己的
        // if (Gate::denies('isAdmin')) {
        //     $query->where('uid', '=', auth()->user()->uid);
        // }

        $data = $query->get()->toArray();
        return $this->formatNormal($data, count($data));
    }


    /**
     * 获取拆线图数据
     */
    public function getRank()
    {
        $sid = request()->input("sid"); // 学生表id
        if (!Auth::isSupperAdmin()) {
            // 学生登录时，进行权限判断,判断当前登录的用户id和想要查看的用户是不是一个
            $uid = admin('username');
            $student_id = Student::where('uid', $uid)->value('id');
            if (!$student_id) {
                throw new BusinessException("非法用户");
            }
            if ($sid!=$student_id){
                throw new BusinessException("无权限查看不是自己的成绩");
            }
        }
        $uname = Student::where('id', '=', $sid)->value('name');
        // 获取学号为x的学生参加的考试
        $exams = Db::table("stu_scores as sc")
            ->leftJoin("stu_exams as e", "sc.exam_id", '=', 'e.id')
            ->where("sc.student_id", $sid)
            ->distinct()
            ->select(['e.id', 'e.name as name'])
            ->orderBy("e.id")->pluck("e.name");

        // 获取学号为x的学生的所有课程
        $courses = Db::table("stu_scores as sc")
            ->leftJoin("stu_courses as c", "sc.course_id", '=', 'c.id')
            ->where("sc.student_id", $sid)
            ->distinct()
            ->select(['c.id', 'c.name'])
            ->orderBy("c.id")->pluck("c.name");

        // 个人分析----各科分数变化折线图1
        // 带课程名称的成绩，按考试，课程，分数从高到低排序
        $orderedScores = Db::table("stu_scores AS sc")
            ->join("stu_courses AS c", "sc.course_id", "=", "c.id")
            ->selectRaw("sc.student_id AS sid,c.`name` AS `name`,sc.course_id cid,sc.exam_id eid,sc.score")
            ->orderBy("sc.exam_id")
            ->orderBy("sc.course_id")
            ->orderBy("score", "desc")
            ->get();

        // 开始排名，如果分数相同，则排名一致，如2个第1名，后面第2名
        // 因为已经按分数倒序了，只要比较上一个的成绩是否和下一个成绩是否相同即可，如果不同，则排名+1，相同则和上一次排名一致
        $lastCid = 0; // 保存上一次的课程ID
        $lastEid = 0; // 保存上一次的考试ID
        $lastScore = 0; // 保存上一次的成绩
        $lastRank = 0; // 保存上一次的排名

        foreach ($orderedScores as $orderedScore) {
            if ($orderedScore->cid == $lastCid && $orderedScore->eid == $lastEid) {
                // 和上一次是相同的课程和考试
                if ($lastScore == $orderedScore->score) {
                    // 和上一个的成绩相同，排名相同
                    $orderedScore->rank = $lastRank;
                } else {
                    // 和上一个成绩不同，排名+1
                    $orderedScore->rank = $lastRank + 1;
                }
            } else {
                // 新的
                $orderedScore->rank = 1;
            }
            $lastCid = $orderedScore->cid;
            $lastEid = $orderedScore->eid;
            $lastScore = $orderedScore->score;
            $lastRank = $orderedScore->rank;
        }
        // 排名结束

        // 排名后，选出当前点击的学生，并且进行分组
        $groupedScores = $orderedScores
            ->where("sid", "=", $sid)
            ->groupBy("cid")
            ->sortBy("cid")
            ->sortBy("eid")
            ->all();

        $chart1_series = []; // 保存第1个图的数据
        foreach ($groupedScores as $groupedScore) {
            $scoreRankArr = $groupedScore->map(function ($item, $key) {
                return [
                    'value' => $item->score, // y轴的数据为成绩
                    'rank' => $item->rank, // 用于显示tooltip
                ];
            });
            $chart1_series[] = [
                'name' => $groupedScore->first()->name,
                'type' => 'line',
                'smooth' => true,
                'data' => $scoreRankArr,
            ];
        }

        // 个人分析----各科排名变化折线图2,和图1的区别在于，这里的value是排名，额外的数据是score成绩
        $chart2_series = [];
        foreach ($groupedScores as $groupedScore) {
            $scoreRankArr = $groupedScore->map(function ($item, $key) {
                return [
                    'value' => $item->rank, // y轴的数据为排名
                    'score' => $item->score, // 用于显示tooltip
                ];
            });
            $chart2_series[] = [
                'name' => $groupedScore->first()->name,
                'type' => 'line',
                'smooth' => true,
                'data' => $scoreRankArr,
            ];
        }

        // 个人分析----总分折线图3
        // 区分考试，按每次考试的总数倒序
        $orderedSumScores = Db::table("stu_scores AS sc")
            ->join("stu_exams AS e", "sc.exam_id", "=", "e.id")
            ->join("stu_students AS u", "sc.student_id", "=", "u.id")
            ->groupBy("u.id", "e.id")
            ->orderBy("e.id")
            ->orderByDesc("sum")
            ->selectRaw("u.id AS sid,
	u.`name` AS `name`,
	sc.exam_id AS eid,
	e.`name` AS exam,
	SUM( sc.score ) AS sum")->get();
        // 开始排名
        $lastEid = 0; // 保存上一次的考试ID
        $lastSumScore = 0; // 保存上一次的总成绩
        $lastRank = 0; // 保存上一次的排名
        foreach ($orderedSumScores as $orderedSumScore) {
            if ($orderedSumScore->eid == $lastEid) {
                // 和上一次相同考试
                if ($lastSumScore == $orderedSumScore->sum) {
                    // 和上一个的总成绩相同，排名相同
                    $orderedSumScore->rank = $lastRank;
                } else {
                    // 和上一个总成绩不同，排名+1
                    $orderedSumScore->rank = $lastRank + 1;
                }
            } else {
                // 新的
                $orderedSumScore->rank = 1;
            }
            $lastEid = $orderedSumScore->eid;
            $lastSumScore = $orderedSumScore->sum;
            $lastRank = $orderedSumScore->rank;
        }
        // 结束排名

        // 选出当前点击的学生
        $currentStudentSumScores = $orderedSumScores
            ->where("sid", "=", $sid)
            ->sortBy("eid")
            ->all();

        $chart3_series_data = [];
        foreach ($currentStudentSumScores as $orderedSumScore) {
            $chart3_series_data[] = [
                'value' => $orderedSumScore->sum,
                'rank' => $orderedSumScore->rank
            ];
        }
        $chart3_series = [
            'type' => 'line',
            'smooth' => true,
            'data' => $chart3_series_data,
        ];


        // 个人分析----总分排名折线图4
        $chart4_series_data = [];
        foreach ($currentStudentSumScores as $orderedSumScore) {
            $chart4_series_data[] = [
                'value' => $orderedSumScore->rank,
                'sum' => $orderedSumScore->sum
            ];
        }
        $chart4_series = [
            'type' => 'line',
            'smooth' => true,
            'data' => $chart4_series_data,
        ];

        $data = compact('exams', 'uname', 'courses', 'chart1_series', 'chart2_series', 'chart3_series', 'chart4_series');

        return $this->json(0, 'ok', $data);
    }

}
