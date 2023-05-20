<?php

namespace app\controller;

use support\Request;
use support\Response;
use app\model\Course;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 课程列表
 */
class CourseController extends Crud
{

    /**
     * @var Course
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Course;
    }

    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('course/index');
    }

    /**
     * 重写，添加teacher
     * @param array $where
     * @param string|null $field
     * @param string $order
     * @return \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Query\Builder|\support\Model|null
     */
    protected function doSelect(array $where, string $field = null, string $order = 'desc')
    {
        return parent::doSelect($where, $field, $order)->with('teacher');
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
        return view('course/insert');
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
        return view('course/update');
    }

}
