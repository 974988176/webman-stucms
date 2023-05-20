<?php

namespace app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property string $uid 学号
 * @property string $name 姓名
 * @property string $sex 性别
 * @property string $phone 电话
 * @property string $sysid 身份证号
 * @property string $birth 出生年月
 * @property string $minzu 民族
 * @property string $jingguan 籍贯
 * @property string $hukou 户籍
 * @property string $huji 户籍地址
 * @property string $xianzz 现住址
 * @property integer $liushou 是否留守儿童
 * @property string $biye 毕业学校
 * @property string $huojiang 获奖情况
 * @property mixed $created_at 创建时间
 * @property mixed $updated_at 更新时间
 */
class Student extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stu_students';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';


    protected $guarded = [];


}
