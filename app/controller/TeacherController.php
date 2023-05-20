<?php

namespace app\controller;

use support\Request;
use support\Response;
use app\model\Teacher;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 老师列表
 */
class TeacherController extends Crud
{

    /**
     * @var Teacher
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Teacher;
    }

    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('teacher/index');
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
            return parent::insert($request);
        }
        return view('teacher/insert');
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
            return parent::update($request);
        }
        return view('teacher/update');
    }

    /**
     * 查看老师
     * @param Request $request
     * @return Response
     */
    public function show(Request $request)
    {
        return view('teacher/show');
    }

}
