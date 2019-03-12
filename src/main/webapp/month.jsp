<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path }/js/jquery.min.js"></script>

<script src="${path }/js/echarts.min.js"></script>
<script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>

</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="monthMain" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('monthMain'));

		var goEasy1 = new GoEasy({
			appkey: 'BC-d45c50afd6d9466c98c0fd12a985d432'
		});


		goEasy1.subscribe({
			channel:'months',
			onMessage: function(message){


				console.log(JSON.parse(message.content));


				var months=JSON.parse(message.content);

				var option = {
					title: {
						text: '按月份分布信息'
					},
					tooltip: {},
					legend: {
						data:['男','女']
					},
					xAxis: {
						data:months.monthlist
					},
					yAxis: {},
					series: [{
						name: '男',
						type: 'bar',
						data: months.manlist
					},
						{
							name: '女',
							type: 'bar',
							data: months.wmanlist
						}]

				};

				// 使用刚指定的配置项和数据显示图表。
				myChart1.setOption(option);
			}
		});

		$.post("${pageContext.request.contextPath}/user/findmonth.do",function(data){
			// 指定图表的配置项和数据
			 var option = {
			            title: {
			                text: '按月份分布信息'
			            },
			            tooltip: {},
			            legend: {
			                data:['男','女']
			            },
			            xAxis: {
			                data:data.monthlist
			            },
			            yAxis: {},
			            series: [{
			                name: '男',
			                type: 'bar',
			                data: data.manlist
			            },
			            {
			                name: '女',
			                type: 'bar',
			                data: data.wmanlist
			            }]
			            
			        };

			        // 使用刚指定的配置项和数据显示图表。
			        myChart1.setOption(option);
			        },"json");
				</script>
</body>
</html>