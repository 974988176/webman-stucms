<?php

namespace app\exceptions;

use support\exception\BusinessException;
use Webman\Exception\ExceptionHandler;
use Webman\Http\Request;
use Webman\Http\Response;

/**
 * 重写错误处理
 * 添加演示模式友好提示
 */
class Handler extends ExceptionHandler
{
    public $dontReport = [
        BusinessException::class,
    ];

    public function report(\Throwable $exception)
    {
        parent::report($exception);
    }

    public function render(Request $request, \Throwable $exception): Response
    {
        if (($exception instanceof BusinessException) && ($response = $exception->render($request))) {
            return $response;
        }
        $code = $exception->getCode();
        if ($code == 42000) {
            $error = '演示模式，不允许修改数据库';
            $json = ['code' => $code, 'msg' => $error];
            if ($request->expectsJson()) {
                return new Response(200, ['Content-Type' => 'application/json'],
                    json_encode($json, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
            } else {
                return new Response(500, [], $error);
            }
        }
        return parent::render($request, $exception);
    }

}
