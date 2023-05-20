<?php

namespace app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property string $name 名称
 * @property integer $full 满分
 * @property integer $teacher_id 授课老师
 * @property mixed $created_at 创建时间
 * @property mixed $updated_at 更新时间
 */
class Course extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stu_courses';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $guarded = [];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }

}
