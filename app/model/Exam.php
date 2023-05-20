<?php

namespace app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property string $name 考试名称
 * @property string $time 考试时间
 * @property mixed $created_at 创建时间
 * @property mixed $updated_at 更新时间
 */
class Exam extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stu_exams';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $guarded = [];



}
