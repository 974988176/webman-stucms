<?php

namespace app\controller;

use support\Request;
use support\Response;
use app\model\Exam;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 考试列表 
 */
class ExamController extends Crud
{
    
    /**
     * @var Exam
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Exam;
    }
    
    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('exam/index');
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
        return view('exam/insert');
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
        return view('exam/update');
    }

}
