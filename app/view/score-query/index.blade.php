@extends("common.layout")

@section("content")
    <!-- 顶部查询表单 -->
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form top-search-from">
                <div style="display: inline-block;vertical-align: text-bottom;">
                    <span class="icon pear-icon pear-icon-prompt" id="showTip"></span>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">学生姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" value="" class="layui-input" autocomplete="off">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">学生学号</label>
                    <div class="layui-input-block">
                        <input type="text" name="uid" value="" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">选择考试</label>
                    <div class="layui-input-block">
                        <select name="exam_id" lay-search="">
                            <option value="">选择考试</option>
                            @foreach($exams as $exam)
                                <option value="{{$exam->id}}">{{$exam->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label"></label>
                    <button class="pear-btn pear-btn-md pear-btn-primary" lay-submit lay-filter="table-query">
                        <i class="layui-icon layui-icon-search"></i>查询
                    </button>
                    <button type="reset" class="pear-btn pear-btn-md" lay-submit lay-filter="table-reset">
                        <i class="layui-icon layui-icon-refresh"></i>重置
                    </button>
                </div>
                <div class="toggle-btn">
                    <a class="layui-hide">展开<i class="layui-icon layui-icon-down"></i></a>
                    <a class="layui-hide">收起<i class="layui-icon layui-icon-up"></i></a>
                </div>
            </form>
        </div>
    </div>

    <!-- 数据表格 -->
    <div class="layui-card">
        <div class="layui-card-body">
            <table id="data-table" lay-filter="data-table"></table>
        </div>
    </div>

    <!-- 表格顶部工具栏 -->
    <script type="text/html" id="table-toolbar">
        <button class="pear-btn pear-btn-primary pear-btn-sm" lay-event="add" permission="scorequery.importview">
            <i class="layui-icon layui-icon-add-1"></i>EXCEL成绩导入
        </button>
        <button class="pear-btn pear-btn-primary pear-btn-sm" lay-event="export_excel" permission="scorequery.export">
            <i class="layui-icon layui-icon-export"></i>EXCEL成绩导出
        </button>
    </script>

@endsection

@section("js")
    <script>
        // 相关常量
        const PRIMARY_KEY = "id";
        const SELECT_API = "/scoreQuery/select";
        const UPDATE_API = "/scoreQuery/update";
        const DELETE_API = "/scoreQuery/delete";

        // 表格渲染
        layui.use(["table", "form", "common", "popup", "util"], function () {
            let table = layui.table;
            let form = layui.form;
            let $ = layui.$;
            let common = layui.common;
            let util = layui.util;
            let tipIndex;
            $("#showTip").mouseover(function () {
                tipIndex = layer.tips(`<blockquote class="layui-elem-quote layui-word-aux">
            1. 可按学生姓名,学号和考试模糊搜索<br>
            2. 标准差表示成绩的离散程度,标准差越小，表示成绩越集中于平均成绩
        </blockquote>`, this, {tips: [1, '#fff'], time: 0});
            })
            $("#showTip").mouseout(function () {
                layer.close(tipIndex)
            })
            // 表头参数
            let cols = [
                {type: 'numbers', title: '序号', width: 60, align: 'center'}
                , {field: 'name', title: '姓名', sort: true, align: 'center', minWidth: 80}
                , {field: 'uid', title: '学号', sort: true, align: 'center', minWidth: 96}
                , {field: 'exam', title: '考试', sort: true, align: 'center', minWidth: 120}
                // 动态获取全部课程,循环遍历
                @foreach($courses as $course)
                , {
                    field: '{{$course->name}}',
                    edit: 'text',
                    title: '{{$course->name}}',
                    sort: true,
                    align: 'center',
                    minWidth: 76
                }
                @endforeach
                , {field: 'std', title: '标准差', sort: true, align: 'center', minWidth: 95}
                , {field: 'avg', title: '平均分', sort: true, align: 'center', minWidth: 90}
                , {field: 'sum', title: '总分', sort: true, align: 'center'}
            ];

            // 渲染表格
            table.render({
                elem: "#data-table",
                url: SELECT_API,
                page: true,
                cols: [cols],
                skin: "line",
                size: "lg",
                toolbar: "#table-toolbar",
                autoSort: false,
                defaultToolbar: [{
                    title: "刷新",
                    layEvent: "refresh",
                    icon: "layui-icon-refresh",
                }, "filter", "print", {
                    title: '导出Excel' //标题
                    , layEvent: 'export_excel' //事件名，用于 toolbar 事件中使用
                    , icon: 'layui-icon-export' //图标类名
                }],
                done: function () {
                    layer.photos({photos: 'div[lay-id="data-table"]', anim: 5});
                }
            });

            // 编辑或删除行事件
            table.on("tool(data-table)", function (obj) {
                if (obj.event === "remove") {
                    remove(obj);
                } else if (obj.event === "edit") {
                    edit(obj);
                }
            });

            // 表格顶部工具栏事件
            table.on("toolbar(data-table)", function (obj) {
                if (obj.event === "add") {
                    add();
                } else if (obj.event === "refresh") {
                    refreshTable();
                } else if (obj.event === "batchRemove") {
                    batchRemove(obj);
                } else if (obj.event === "export_excel") {
                    window.open('/scoreQuery/export', '_blank');
                }
            });

            // 表格顶部搜索事件
            form.on("submit(table-query)", function (data) {
                table.reload("data-table", {
                    where: data.field
                })
                return false;
            });

            // 表格顶部搜索重置事件
            form.on("submit(table-reset)", function (data) {
                table.reload("data-table", {
                    where: []
                })
            });

            // 表格排序事件
            table.on("sort(data-table)", function (obj) {
                table.reload("data-table", {
                    initSort: obj,
                    scrollPos: "fixed",
                    where: {
                        field: obj.field,
                        order: obj.type
                    }
                });
            });

            // 表格新增数据
            let add = function () {
                layer.open({
                    type: 2,
                    title: "新增",
                    shade: 0.1,
                    shadeClose: true,
                    area: [common.isModile() ? "100%" : "500px", common.isModile() ? "100%" : "450px"],
                    content: "/scoreQuery/importView"
                });
            }

            // 表格编辑数据
            let edit = function (obj) {
                let value = obj.data[PRIMARY_KEY];
                layer.open({
                    type: 2,
                    title: "修改",
                    shade: 0.1,
                    shadeClose: true,
                    area: [common.isModile() ? "100%" : "500px", common.isModile() ? "100%" : "450px"],
                    content: UPDATE_URL + "?" + PRIMARY_KEY + "=" + value
                });
            }

            // 删除一行
            let remove = function (obj) {
                return doRemove(obj.data[PRIMARY_KEY]);
            }

            // 删除多行
            let batchRemove = function (obj) {
                let checkIds = common.checkField(obj, PRIMARY_KEY);
                if (checkIds === "") {
                    layui.popup.warning("未选中数据");
                    return false;
                }
                doRemove(checkIds.split(","));
            }

            // 执行删除
            let doRemove = function (ids) {
                let data = {};
                data[PRIMARY_KEY] = ids;
                layer.confirm("确定删除?", {
                    icon: 3,
                    title: "提示"
                }, function (index) {
                    layer.close(index);
                    let loading = layer.load();
                    $.ajax({
                        url: DELETE_API,
                        data: data,
                        dataType: "json",
                        type: "post",
                        success: function (res) {
                            layer.close(loading);
                            if (res.code) {
                                return layui.popup.failure(res.msg);
                            }
                            return layui.popup.success("操作成功", refreshTable);
                        }
                    })
                });
            }

            // 刷新表格数据
            window.refreshTable = function (param) {
                table.reloadData("data-table", {
                    scrollPos: "fixed"
                });
            }

            //监听单元格编辑
            table.on('edit(data-table)', function (obj) {
                let value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field //得到字段  化学
                ;
                // 在这里去后台获取课程的满分值
                $.post("/scoreQuery/getFull", {field: field}, function (res) {
                    let full = res.full;
                    if (value < 0 || value > full) {
                        layer.msg('成绩应在0-' + full + '分之间');
                        obj.update({
                            [field]: obj.oldValue
                        })
                        return false;
                    }
                    layer.confirm('真的要修改' + data.name + '的' + field + '成绩为' + value + '吗?', function (index) {
                        $.ajax({
                            type: 'post',
                            url: UPDATE_API,
                            data: {sid: data.sid, course: field, score: value, eid: data.eid},
                            success: function (res) {
                                if (res.code) {
                                    return layui.popup.failure(res.msg);
                                }
                                return layui.popup.success("操作成功", function () {
                                    refreshTable();
                                    layer.close(index)
                                });
                            }
                        });
                    }, function (index) {
                        obj.update({
                            [field]: obj.oldValue
                        })
                        layer.close(index);
                    });
                });
                return false;
            });

        })

    </script>
@endsection
