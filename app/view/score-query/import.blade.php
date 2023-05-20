@extends('common.layout')

@section('content')
    <div class="layui-col-xs6  layui-col-xs-offset4">
        <div class="layui-btn layui-btn-sm" id="downloadTemplate">
            下载成绩导入模板
        </div>
    </div>

    <div class="layui-col-xs8   layui-col-xs-offset2" style="margin-top: 30px;">
        <div class="layui-upload-drag" id="test10">
            <i class="layui-icon"></i>
            <p>点击上传，或将文件拖拽到此处</p>
            <div class="layui-hide" id="uploadDemoView">
            </div>
        </div>
    </div>

@stop

@section('js')
    <script>
        layui.use(['upload', 'jquery', "popup"],
            function () {
                let upload = layui.upload;
                let $ = layui.$;
                $("#downloadTemplate").click(function () {
                    window.open("/score-query/downloadTemplate", "_blank")
                });

                //拖拽上传
                upload.render({
                    elem: '#test10'
                    , accept: 'file' //普通文件
                    , exts: 'xls|xlsx' //只允许上传压缩文件
                    , field: 'excel'
                    , url: '/score-query/doImportExcel'
                    , done: function (res) {
                        if (res.code) {
                            return layui.popup.failure(res.msg);
                        }
                        return layui.popup.success("成功上传" + res.data.count + "数据", function () {
                            parent.refreshTable();
                            parent.layer.close(parent.layer.getFrameIndex(window.name));
                        });
                    }
                });

            });
    </script>
@stop
