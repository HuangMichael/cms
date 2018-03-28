<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<%@include file="../common/common-head.jsp" %>
<body>
<!-- HEADER -->
<%@include file="../common/common-navbar.jsp" %>
<!--/HEADER -->
<!-- PAGE -->
<section id="page">
    <!-- SIDEBAR -->
    <%@include file="../common/common-siderbar.jsp" %>
    <!-- /SIDEBAR -->
    <div id="main-content">
        <div class="container">
            <div class="row">
                <div id="content" class="col-lg-12">
                    <!-- PAGE HEADER-->
                    <%@include file="../common/common-breadcrumb.jsp" %>

                    <div class="row">

                        <div class="col-md-6">
                            <div id="chart1" style="height:350px;width: 100%"></div>
                        </div>
                        <div class="col-md-6">
                            <div id="chart3" style="height:350px;width: 100%"></div>
                        </div>
                        <div class="col-md-12">
                            <div id="chart2" style="height:350px;width: 100%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="../common/common-foot.jsp" %>

<script src="/js/app/portal/portal.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script type="text/javascript">
    // 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart1 = ec.init(document.getElementById('chart1'));
            var myChart2 = ec.init(document.getElementById('chart2'));
            var myChart3 = ec.init(document.getElementById('chart3'));


            var weatherIcons = {
                'Sunny': './data/asset/img/weather/sunny_128.png',
                'Cloudy': './data/asset/img/weather/cloudy_128.png',
                'Showers': './data/asset/img/weather/showers_128.png'
            };

            var option1 = {
                title: {
                    text: '报修按设备类型统计',
                    subtext: '2018-03',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    show: false,
                    bottom: 10,
                    left: 'center',
                    data: ['标识灯箱', '门禁', '热水器', '门锁', '空调']
                },
                series: [
                    {
                        type: 'pie',
                        radius: '65%',
                        center: ['50%', '50%'],
                        selectedMode: 'single',
                        data: [
                            {
                                value: 1548,
                                name: '空调',
                                label: {
                                    normal: {
                                        formatter: [
                                            '{title|{b}}{abg|}',
                                            '  {weatherHead|天气}{valueHead|天数}{rateHead|占比}',
                                            '{hr|}',
                                            '  {Sunny|}{value|202}{rate|55.3%}',
                                            '  {Cloudy|}{value|142}{rate|38.9%}',
                                            '  {Showers|}{value|21}{rate|5.8%}'
                                        ].join('\n'),
                                        backgroundColor: '#eee',
                                        borderColor: '#777',
                                        borderWidth: 1,
                                        borderRadius: 4,
                                        rich: {
                                            title: {
                                                color: '#eee',
                                                align: 'center'
                                            },
                                            abg: {
                                                backgroundColor: '#333',
                                                width: '100%',
                                                align: 'right',
                                                height: 25,
                                                borderRadius: [4, 4, 0, 0]
                                            },
                                            Sunny: {
                                                height: 30,
                                                align: 'left',
                                                backgroundColor: {
                                                    image: weatherIcons.Sunny
                                                }
                                            },
                                            Cloudy: {
                                                height: 30,
                                                align: 'left',
                                                backgroundColor: {
                                                    image: weatherIcons.Cloudy
                                                }
                                            },
                                            Showers: {
                                                height: 30,
                                                align: 'left',
                                                backgroundColor: {
                                                    image: weatherIcons.Showers
                                                }
                                            },
                                            weatherHead: {
                                                color: '#333',
                                                height: 24,
                                                align: 'left'
                                            },
                                            hr: {
                                                borderColor: '#777',
                                                width: '100%',
                                                borderWidth: 0.5,
                                                height: 0
                                            },
                                            value: {
                                                width: 20,
                                                padding: [0, 20, 0, 30],
                                                align: 'left'
                                            },
                                            valueHead: {
                                                color: '#333',
                                                width: 20,
                                                padding: [0, 20, 0, 30],
                                                align: 'center'
                                            },
                                            rate: {
                                                width: 40,
                                                align: 'right',
                                                padding: [0, 10, 0, 0]
                                            },
                                            rateHead: {
                                                color: '#333',
                                                width: 40,
                                                align: 'center',
                                                padding: [0, 10, 0, 0]
                                            }
                                        }
                                    }
                                }
                            },
                            {value: 535, name: '门锁'},
                            {value: 510, name: '热水器'},
                            {value: 634, name: '门禁'},
                            {value: 735, name: '标识灯箱'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };


            var option2 = {
                title: {
                    text: '维修单状态按线别统计',
                    subtext: '2018-03'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    show: false,
                    data: ['已报修', '维修中', "已完工", "已暂停", "已取消"]
                },
                toolbox: {
                    show: false,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: ['2号线', '8号线', '10号线', '13号线']
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '已报修',
                        type: 'bar',
                        data: [232, 256, 767, 44]
                    },
                    {
                        name: '维修中',
                        type: 'bar',
                        data: [264, 222, 223, 707]

                    },
                    {
                        name: '已完工',
                        type: 'bar',
                        data: [232, 256, 112, 321]
                    },
                    {
                        name: '已暂停',
                        type: 'bar',
                        data: [64, 22, 11, 42]

                    }, {
                        name: '已取消',
                        type: 'bar',
                        data: [132, 67, 18, 22]
                    }
                ]
            };


            var option3 = {
                title: {
                    text: '最近三个月报修完成情况统计',
                    subtext: '2018-03'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    show: false,
                    data: ['已报修', '已完成']
                },
                toolbox: {
                    show: false,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: ['1月', '2月', '3月']
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '已报修',
                        type: 'bar',
                        data: [232, 256, 767]
                    },
                    {
                        name: '已完成',
                        type: 'bar',
                        data: [264, 222, 707]

                    }
                ]
            };


            // 为echarts对象加载数据
            myChart1.setOption(option1);
            myChart2.setOption(option2);
            myChart3.setOption(option3);
        }
    );
</script>

</body>
</html>