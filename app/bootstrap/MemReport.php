<?php

namespace app\bootstrap;

use Webman\Bootstrap;

/*
 * 在config/bootstrap.php下添加这个类
 * 在程序启动的时候，执行，可以通过条件判断是否执行
 *
 * */
class MemReport implements Bootstrap
{
    public static function start($worker)
    {
        // 是否是命令行环境 ?
        $is_console = !$worker;
        if ($is_console) {
            // 如果你不想命令行环境执行这个初始化，则在这里直接返回
            return;
        }

        // monitor进程不执行定时器
        if ($worker->name == 'monitor') {
            return;
        }


        // 每隔10秒执行一次
        \Workerman\Timer::add(10, function () {
            // 为了方便演示，这里使用输出代替上报过程
            echo memory_get_usage() . "\n";
        });
    }
}
