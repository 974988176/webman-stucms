<?php

use support\Response;

/**
 * Here is your custom functions.
 */
function downloadExcel(string $fileName): Response
{
    //将文件转字符串
    $content = file_get_contents($fileName);
    //删除临时文件
    unlink($fileName);
    $response = new Response();
    //xls='application/vnd.ms-excel'
    //xlsx='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    $contentType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';

    return $response->withHeader('content-description', 'File Transfer')
        ->withHeader('content-type', $contentType)
        ->withHeader('content-disposition', "attachment; filename={$fileName}")
        ->withHeader('content-transfer-encoding', 'binary')
        ->withHeader('pragma', 'public')
        ->withBody((string)$content);
}

// function obj2Arr($object): array
// {
//     if ($object instanceof \Illuminate\Support\Collection){
//         $object = $object->toArray();
//     }
//     return array_map('get_object_vars', $object);
//     // return json_decode(json_encode($object), true);
// }
