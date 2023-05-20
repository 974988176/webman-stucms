<?php

namespace app\service;

use app\model\Course;
use app\model\Exam;
use app\model\Student;
use support\exception\BusinessException;

class ScoreService
{
    /**
     * 获取导出Excel标题
     * @param bool $includeAvg 是否包含平均分等列
     * @return string[]
     */
    public function getExportHeader(bool $includeAvg = true): array
    {
        $courses = Course::orderBy("id")->get();
        $headings = [
            'index' => '序号',
            'name' => '姓名',
            'uid' => '学号',
            'exam' => '考试',
        ];
        foreach ($courses as $course) {
            $headings[$course->name] = $course->name;
        }
        if ($includeAvg) {
            // 如果不是导出模板的话，就是导出分数了，分数表头需要添加平均分等
            $headings = array_merge($headings, [
                'std' => "标准差",
                'avg' => '平均分',
                'sum' => '总分'
            ]);
        }
        return $headings;
    }


    /**
     * 检查成绩合法性，包含满分范围检查，是否数字检查，学号检查
     * @param array $row
     * @param int $line
     * @return void
     * @throws BusinessException
     */
    public function checkExcelRow(array $row, int $line)
    {
        // 学号
        $model = Student::query()->where("uid", $row['uid'])->first();
        if (is_null($model)) {
            throw new BusinessException("第{$line}行数据非法，学号{$row['uid']}不存在");
        }
        // 考试名称
        $exists = Exam::query()->where('name', $row['exam'])->exists();
        if (!$exists) {
            throw new BusinessException("第{$line}行数据非法，考试名称{$row['exam']}不存在");
        }

        // 检查是否超过满分
        $courses = Course::query()->get()->toArray();
        foreach ($courses as $course) {
            $full = $course['full'];
            $courseName = $course['name'];
            if (isset($row[$courseName])) {
                if (!is_numeric($row[$courseName])) {
                    throw new BusinessException("第{$line}行数据非法，课程:{$courseName}成绩非法，不是数字");
                }
                if ($row[$courseName] > $full || $row[$courseName] < 0) {
                    throw new BusinessException("第{$line}行数据非法，课程:{$courseName}成绩非法，不在满分范围内，当前满分成绩为:{$full}");
                }
            }
        }
    }

}
