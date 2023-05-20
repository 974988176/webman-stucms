@extends('common.layout')
@section("content")
    <div class="layui-col-sm12  layui-col-md10 layui-col-md-offset1">
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

            showLine = function (sid) {
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

            showLine({{$student_id}});

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

        })

    </script>
@endsection
