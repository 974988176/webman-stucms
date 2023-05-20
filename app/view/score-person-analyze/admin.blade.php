@extends('common.layout')
@section("content")

    <div class="layui-col-sm12  layui-col-md3">
        <div class="layui-card-body">
            <blockquote class="layui-elem-quote layui-word-aux">
                1. 表中为至少有一门成绩的人,没成绩则不显示<br>
                2. 单击某个学生来具体查看成绩变化图
            </blockquote>
            <form class="layui-form layuimini-form" style="text-align: center;">
                <div class="layui-inline layui-show-xs-block">
                    <input type="text" name="name" placeholder="搜索姓名" autocomplete="off"
                           class="layui-input">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="table-query"
                            data-type="reload">
                        <i class="layui-icon">&#xe615;</i></button>
                </div>
            </form>
            <table id="data-table" lay-filter="data-table"></table>
        </div>
    </div>

    <div class="layui-col-sm12  layui-col-md9">
        <div class="layui-row  layui-col-space10">
            <div class="layui-col-sm12  layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header uname">各科分数折线图<span style="color: red;"></span></div>
                    <div class="layui-card-body" style="min-height: 200px;">
                        <div id="main1" class="layui-col-sm12" style="height: 200px;"></div>
                    </div>
                </div>
            </div>

            <div class="layui-col-sm12  layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header uname">各科排名折线图<span style="color: red;"></span></div>
                    <div class="layui-card-body" style="min-height: 200px;">
                        <div id="main2" class="layui-col-sm12" style="height: 200px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row  layui-col-space10">
            <div class="layui-col-sm12  layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header uname">总分折线图<span style="color: red;"></span></div>
                    <div class="layui-card-body" style="min-height: 200px;">
                        <div id="main3" class="layui-col-sm12" style="height: 200px;"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm12  layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header uname">总分排名折线图<span style="color: red;"></span></div>
                    <div class="layui-card-body" style="min-height: 200px;">
                        <div id="main4" class="layui-col-sm12" style="height: 200px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section("js")
    <script>
        // 相关常量
        const PRIMARY_KEY = "id";
        const SELECT_API = "/scorePersonAnalyze/select";
        const UPDATE_API = "/scorePersonAnalyze/update";
        const DELETE_API = "/scorePersonAnalyze/delete";

        // 表格渲染
        layui.use(["table", "form", "common", "popup", "util", "echarts"], function () {
            let table = layui.table;
            let form = layui.form;
            let $ = layui.$;
            let common = layui.common;
            let util = layui.util;
            let echarts = layui.echarts;

            // 表头参数
            let cols = [ //表头
                {field: 'id', hide: true}
                , {type: 'numbers', title: '序号', width: 100, align: 'center'}
                , {field: 'uid', title: '学号', sort: true, align: 'center'}
                , {field: 'name', title: '姓名', sort: true, align: 'center'}
            ];

            // 渲染表格
            table.render({
                elem: "#data-table",
                url: SELECT_API,
                page: false,
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

            //监听行单击事件（双击事件为：rowDouble）
            table.on('row(data-table)', function (obj) {
                let data = obj.data;
                // 在这里向后台请求数据,并在右边的图表显示
                showLine(data.id);
                //标注选中样式
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });


            let chart1 = echarts.init(document.getElementById('main1'));
            let chart2 = echarts.init(document.getElementById('main2'));
            let chart3 = echarts.init(document.getElementById('main3'));
            let chart4 = echarts.init(document.getElementById('main4'));

            let tpl_option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    selectedMode: 'single',
                    data: []
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    axisLabel: {
                        interval: 0
                    },
                    boundaryGap: false,
                    data: []
                },
                yAxis: {
                    type: 'value'
                },
                series: []
            };


            let tooltip1 = {
                trigger: 'axis',
                formatter: function (params) {
                    var d = params[0];
                    return params[0].name + '<br>' + d.marker + '成绩:' + d.data.value + '<br>' + d.marker + '排名:' + d.data.rank
                }
            };

            let tooltip2 = {
                trigger: 'axis',
                formatter: function (params) {
                    var d = params[0];
                    return params[0].name + '<br>' + d.marker + '成绩:' + d.data.score + '<br>' + d.marker + '排名:' + d.data.value
                }
            };

            let tooltip3 = {
                trigger: 'axis',
                formatter: function (params) {
                    var d = params[0];
                    return params[0].axisValueLabel + '<br>总分:' + d.data.value + "<br>排名:" + d.data.rank
                }
            };

            let tooltip4 = {
                trigger: 'axis',
                formatter: function (params) {
                    var d = params[0];
                    return params[0].axisValueLabel + '<br>总分:' + d.data.sum + "<br>排名:" + d.data.value
                }
            };


            window.showLine = function (sid) {
                $.post('/scorePersonAnalyze/getrank', {sid: sid}, function (res) {
                    if (res.code) {
                        return layui.popup.failure(res.msg);
                    }
                    // 在这里改变上面的uname,改变option里面的内容,渲染echarts
                    let data = res.data;
                    $('.uname span').text('(' + data.uname + ')');
                    tpl_option.legend.data = data.courses;
                    tpl_option.xAxis.data = data.exams;
                    // 这里要用到对象的深层拷贝,不然,两个对象之间会互相影响
                    let option1 = $.extend(true, {}, tpl_option);
                    option1.series = data.chart1_series;
                    option1.tooltip = tooltip1;
                    chart1.clear();
                    chart1.setOption(option1);


                    let option2 = $.extend(true, {}, tpl_option);
                    // 让图2,排名图的y轴坐标上下反转,设置y轴坐标的最小值min,刻度最小间隔数minInterval
                    option2.yAxis = {type: 'value', inverse: true, min: 1, minInterval: 1};
                    option2.series = data.chart2_series;
                    option2.tooltip = tooltip2;
                    chart2.clear();
                    chart2.setOption(option2);

                    let option3 = $.extend(true, {}, tpl_option);
                    option3.legend = false
                    option3.series = data.chart3_series;
                    option3.tooltip = tooltip3;
                    chart3.clear();
                    chart3.setOption(option3);

                    let option4 = $.extend(true, {}, tpl_option);
                    option4.legend = false
                    option4.series = data.chart4_series;
                    option4.yAxis = {type: 'value', inverse: true, min: 1, minInterval: 1};
                    option4.tooltip = tooltip4;
                    chart4.clear();
                    chart4.setOption(option4);
                });
            }

            // 刷新表格数据
            window.refreshTable = function (param) {
                table.reloadData("data-table", {
                    scrollPos: "fixed"
                });
            }
        })

    </script>
@endsection
