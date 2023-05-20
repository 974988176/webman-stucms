<?php

namespace app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property float $score 成绩
 * @property integer $student_id 学生ID
 * @property integer $exam_id 考试ID
 * @property integer $course_id 课程ID
 * @property mixed $created_at 创建时间
 * @property mixed $updated_at 更新时间
 */
class Score extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stu_scores';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $guarded = [];
}
