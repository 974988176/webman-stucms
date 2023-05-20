<?php

namespace app\controller;

use app\model\Score;
use app\model\Student;
use app\service\AdminService;
use plugin\admin\app\common\Auth;
use plugin\admin\app\controller\Crud;
use support\Db;
use support\exception\BusinessException;
use support\Request;
use support\Response;

/**
 * 学生列表
 */
class StudentController extends Crud
{

    /**
     * @var Student
     */
    protected $model = null;
    private AdminService $adminService;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Student;
        $this->adminService = new AdminService();
    }

    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('student/index');
    }

    /**
     * 查询
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function select(Request $request): Response
    {
        [$where, $format, $limit, $field, $order] = $this->selectInput($request);
        $query = $this->doSelect($where, $field, $order);
        if (!Auth::isSupperAdmin()) {
            // 不是超管,学生只显示学生自己的
            $uid = admin('username');
            $query = $query->where("uid", $uid);
        }
        return $this->doFormat($query, $format, $limit);
    }

    /**
     * 插入
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function insert(Request $request): Response
    {
        if ($request->method() === 'POST') {
            try {
                Db::beginTransaction();
                $data = $this->insertInput($request);
                // 判断学号是否存在
                if (isset($data['uid'])) {
                    $exists = Student::where("uid", $data['uid'])->exists();
                    if ($exists) {
                        return $this->fail("学号{$data['uid']}已存在");
                    }
                }
                $id = $this->doInsert($data);
                // 添加学生，同步添加账户
                $student = Student::find($id);
                $this->adminService->insertAdminByOneStudent($student);
                Db::commit();
                return $this->success('ok', ['id' => $id]);
            } catch (\Throwable $throwable) {
                Db::rollBack();
                return $this->fail($throwable->getMessage());
            }
        }
        return view('student/insert');
    }

    /**
     * 更新
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function update(Request $request): Response
    {
        if ($request->method() === 'POST') {
            [$id, $data] = $this->updateInput($request);
            // 判断是否更改学号，学号不让修改的
            $model = $this->model->find($id);
            if (isset($data['uid']) && $model->uid != $data['uid']) {
                throw new BusinessException("学号不允许修改");
            }
            $this->doUpdate($id, $data);
            // 如果修改了昵称，则同步修改账户中的昵称
            if (isset($data['name']) && $model->name != $data['name']) {
                $this->adminService->updateAdminByStudent($id, $data['name']);
            }
            return $this->json(0);
        }
        return view('student/update');
    }

    /**
     * 删除
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function delete(Request $request): Response
    {
        $ids = $this->deleteInput($request);

        Db::transaction(function () use ($ids) {
            // 同时删除账户中的学生
            foreach ($ids as $id) {
                $this->adminService->deleteAdminByStudentId($id);
            }
            // 同时删除成绩
            Score::whereIn("student_id", $ids)->delete();
            $this->doDelete($ids);
        });

        return $this->success();
    }

    /**
     * 同步账户
     * @return Response
     * @throws BusinessException
     */
    public function syncAccount()
    {
        $this->adminService->insertAdminByAllStudent();
        return $this->json(0, 'ok');

    }
}
