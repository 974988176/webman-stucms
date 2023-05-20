@extends('common.layout')

@section('content')
    <div class="layui-card-body">
        <blockquote class="layui-elem-quote layui-word-aux">
            1. 可按考试搜索,默认为第一次考试<br>
            2. 标准差表示成绩的离散程度,标准差越小，表示成绩越集中于平均成绩
        </blockquote>
        <form class="layui-form layui-col-space5">
            <div class="layui-inline layui-show-xs-block">
                <div class="layui-input-inline">
                    <select name="exam_id" lay-search="">
                        @foreach($exams as $exam)
                            <option value="{{$exam->id}}">{{$exam->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </form>
        <!-- 数据表格 -->
        <div class="layui-card">
            <div class="layui-card-body">
                <table id="data-table" lay-filter="data-table"></table>
            </div>
        </div>
    </div>
@endsection


@section("js")
    <script>
        // 相关常量
        const PRIMARY_KEY = "id";
        const BASE_API = "/score-all-analyze";
        const SELECT_API = "/score-all-analyze/select";
        const TIPS_API = "/score-all-analyze/tips";
        // 表格渲染
        layui.use(["table", "form", "common", "popup", "util"], function () {
            let table = layui.table;
            let form = layui.form;
            let $ = layui.$;
            let common = layui.common;
            let util = layui.util;

            // 表头参数
            let cols = [
                {field: 'cid', hide: true}
                , {field: 'eid', hide: true}
                , {type: 'numbers', title: '序号', width: 60, align: 'center'}
                , {field: 'exam', title: '考试', width: 120, sort: true, align: 'center'}
                , {
                    field: 'course',
                    title: '课程',
                    event: 'show_course_pie',
                    sort: true,
                    align: 'center',
                    templet: function (d) {
                        return '<span style="cursor: pointer;" class="layui-badge layui-bg-blue">' + d.course + '</span>';
                    }
                }
                , {field: 'full', title: '满分', sort: true, align: 'center'}
                , {field: 'join_num', title: '参考人数', sort: true, align: 'center'}
                , {
                    field: 'youxiu',
                    title: '优秀',
                    sort: true,
                    align: 'center',
                    event: 'show_detail',
                    templet: function (d) {
                        if (d.youxiu * 1) {
                            return '<span style="cursor: pointer;" class="layui-badge layui-bg-blue">' + d.youxiu + '</span>';

                        } else {
                            return d.youxiu;
                        }
                    }
                }
                , {
                    field: 'lianghao',
                    title: '良好',
                    sort: true,
                    align: 'center',
                    event: 'show_detail',
                    templet: function (d) {
                        if (d.lianghao * 1) {
                            return '<span style="cursor: pointer;" class="layui-badge layui-bg-blue">' + d.lianghao + '</span>';

                        } else {
                            return d.lianghao;
                        }
                    }
                }
                , {
                    field: 'jige',
                    title: '及格',
                    sort: true,
                    align: 'center',
                    event: 'show_detail',
                    templet: function (d) {
                        if (d.jige * 1) {
                            return '<span style="cursor: pointer;" class="layui-badge layui-bg-blue">' + d.jige + '</span>';

                        } else {
                            return d.jige;
                        }
                    }
                }
                , {
                    field: 'bujige',
                    title: '不及格',
                    sort: true,
                    align: 'center',
                    event: 'show_detail',
                    templet: function (d) {
                        if (d.bujige * 1) {
                            return '<span style="cursor: pointer;" class="layui-badge layui-bg-blue">' + d.bujige + '</span>';

                        } else {
                            return d.bujige;
                        }
                    }
                }
                , {
                    field: 'max',
                    title: '最高分',
                    sort: true,
                    align: 'center',
                    event: 'show_detail',
                    templet: function (d) {
                        if (d.max * 1) {
                            return '<span style="cursor: pointer;" class="layui-badge">' + d.max + '</span>';

                        } else {
                            return d.max;
                        }
                    }
                }
                , {
                    field: 'min',
                    title: '最低分',
                    sort: true,
                    align: 'center',
                    event: 'show_detail',
                    templet: function (d) {
                        if (d.min * 1) {
                            return '<span style="cursor: pointer;" class="layui-badge layui-bg-green">' + d.min + '</span>';

                        } else {
                            return d.min;
                        }
                    }
                }
                , {field: 'avg', title: '平均分', sort: true, align: 'center'}
                , {field: 'std', title: '标准差', sort: true, align: 'center'}
            ];

            // 渲染表格
            let render_table = table.render({
                elem: "#data-table",
                url: SELECT_API,
                where: {'exam_id': "{{$first_id}}"},
                page: true,
                cols: [cols],
                skin: "line",
                size: "lg",
                autoSort: false,
                defaultToolbar: [{
                    title: "刷新",
                    layEvent: "refresh",
                    icon: "layui-icon-refresh",
                }, "filter", "print", "exports"],
                done: function () {
                    layer.photos({photos: 'div[lay-id="data-table"]', anim: 5});
                }
            });


            //监听行工具事件
            table.on('tool(data-table)', function (obj) {
                let data = obj.data;
                switch (obj.event) {
                    case 'show_course_pie':
                        let url = BASE_API + "/showCoursePie/" + "?cid=" + data.cid + "&eid=" + data.eid;
                        layer.open({
                            type: 2,
                            title: "",
                            shade: 0.1,
                            shadeClose: true,
                            area: [common.isModile() ? "100%" : "500px", common.isModile() ? "100%" : "450px"],
                            content: url
                        });
                        break;
                    case 'show_detail':
                        let that = this;
                        let field = $(this).data('field');
                        if (data[field] * 1 > 0) {
                            // 如果大于0才执行
                            let post_data = {cid: data.cid, 'eid': data.eid, 'field': field};
                            $.post(TIPS_API, post_data, function (res) {
                                if (res.code) {
                                    return layui.popup.failure(res.msg);
                                }
                                let tipStr = '';
                                res.data.forEach(function (item) {
                                    tipStr += item.name + ':' + item.score + '<br>';
                                });
                                layer.tips(tipStr, that, {
                                    // tips: [2, '#1E9FFF'],
                                    tips: [2, '#5FB878'],
                                    time: 30000,
                                    // tipsMore: true
                                });
                            });
                        }
                        break;
                }
            });


            // 监听select选择
            form.on('select', function (data) {
                render_table.reload({
                    where: {exam_id: data.value}
                });
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

            // 刷新表格数据
            window.refreshTable = function (param) {
                table.reloadData("data-table", {
                    scrollPos: "fixed"
                });
            }
        })

    </script>
@endsection
