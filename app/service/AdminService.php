<?php

namespace app\service;

use app\model\Student;
use plugin\admin\app\common\Auth;
use plugin\admin\app\common\Util;
use plugin\admin\app\controller\Crud;
use plugin\admin\app\model\Admin;
use plugin\admin\app\model\AdminRole;
use support\exception\BusinessException;

class AdminService extends Crud
{
    protected $model = null;

    public function __construct()
    {
        $this->model = new Admin;
    }

    /**
     * 添加所有的学生到账户
     * @return \support\Response
     * @throws BusinessException
     */
    public function insertAdminByAllStudent()
    {
        $students = Student::query()->get();
        foreach ($students as $student) {
            // 先判断是否已经存在
            $this->insertAdminByOneStudent($student);
        }
    }

    /**
     * 通过学生信息添加登录的用户
     * @param $student
     * @return true
     * @throws BusinessException
     */
    public function insertAdminByOneStudent($student): bool
    {
        $exists = Admin::where("username", $student->uid)->exists();
        if (!$exists) {
            $role_ids = [6]; // 学生角色
            if (!$role_ids) {
                throw new BusinessException("至少选择一个角色组");
            }
            if (!Auth::isSupperAdmin() && array_diff($role_ids, Auth::getScopeRoleIds())) {
                throw new BusinessException("角色超出权限范围");
            }

            $data = [
                'username' => $student->uid,
                'nickname' => $student->name,
                'password' => Util::passwordHash("123456"),
                'avatar' => '/app/admin/avatar.png'
            ];
            $admin_id = $this->doInsert($data);
            AdminRole::where('admin_id', $admin_id)->delete();
            foreach ($role_ids as $id) {
                $admin_role = new AdminRole;
                $admin_role->admin_id = $admin_id;
                $admin_role->role_id = $id;
                $admin_role->save();
            }
        }
        return true;
    }

    public function findAdminByStudentId($id): \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Eloquent\Builder|null
    {
        $student = Student::find($id);
        $uid = $student->uid;
        return Admin::query()->where("username", $uid)->first();
    }

    /**
     * 更新账户昵称
     * @param int $id
     * @param string $nickname
     * @return void
     */
    public function updateAdminByStudent($id, string $nickname): void
    {
        $model = $this->findAdminByStudentId($id);
        if ($model) {
            $model->nickname = $nickname;
            $model->save();
        }
    }

    /**
     * 通过学生学号删除账户
     * @param $uid
     * @return true
     */
    public function deleteAdminByStudentId($id): bool
    {
        $model = $this->findAdminByStudentId($id);
        if ($model) {
            Admin::where("username", $model->username)->delete();
            AdminRole::where('admin_id', $model->id)->delete();
        }

        return true;
    }
}
