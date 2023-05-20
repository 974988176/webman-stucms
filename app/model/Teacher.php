<?php

namespace app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id ID(主键)
 * @property string $name 姓名
 * @property string $sex 性别
 * @property string $phone 电话
 * @property string $qq QQ
 * @property mixed $created_at 创建时间
 * @property mixed $updated_at 更新时间
 */
class Teacher extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stu_teachers';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $guarded = [];



}
