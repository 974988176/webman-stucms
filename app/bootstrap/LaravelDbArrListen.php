<?php

namespace app\bootstrap;

use Illuminate\Container\Container as IlluminateContainer;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Database\Events\StatementPrepared;
use Illuminate\Events\Dispatcher;
use Illuminate\Support\Facades\Event;
use support\Db;
use Webman\Bootstrap;

class LaravelDbArrListen implements Bootstrap
{
    public static function start($worker)
    {
        // Is it console environment ?
        $is_console = !$worker;
        if ($is_console) {
            // If you do not want to execute this in console, just return.
            return;
        }
        // monitor进程不执行定时器
        if ($worker->name == 'monitor') {
            return;
        }

        // if (!class_exists(Capsule::class)) {
        //     return;
        // }
        //
        // $config = config('database', []);
        // $connections = $config['connections'] ?? [];
        // if (!$connections) {
        //     return;
        // }

        // 监听任意sql执行
        // DB::listen(function ($query) {
        //     if (stripos($query->sql, 'select') === 0) {
        //         $sql = str_replace("?", "'%s'", $query->sql);
        //         $bindingSql = vsprintf($sql, $query->bindings);
        //     }
        // });

        // 成功修改sql
        // DB::connection()->beforeExecuting(function (&$sql) {
        //     dump($sql);
        //     // $sql .= " where id=2";
        // });

    }

}
