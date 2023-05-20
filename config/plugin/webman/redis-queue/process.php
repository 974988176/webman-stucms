<?php
return [
    'consumer'  => [
        'handler'     => Webman\RedisQueue\Process\Consumer::class,
        'count'       => 8, // 可以设置多进程同时消费
        'constructor' => [
            // 消费者类目录
            'consumer_dir' => app_path() . '/queue/redis'
        ]
    ],
    // 下面是启动另外的2个进程，来分别处理不同目录下的快业务和慢业务
    // 'redis_consumer_fast'  => [
    //     'handler'     => Webman\RedisQueue\Process\Consumer::class,
    //     'count'       => 8,
    //     'constructor' => [
    //         // 消费者类目录
    //         'consumer_dir' => app_path() . '/queue/redis/fast'
    //     ]
    // ],
    // 'redis_consumer_slow'  => [
    //     'handler'     => Webman\RedisQueue\Process\Consumer::class,
    //     'count'       => 8,
    //     'constructor' => [
    //         // 消费者类目录
    //         'consumer_dir' => app_path() . '/queue/redis/slow'
    //     ]
    // ]
];
