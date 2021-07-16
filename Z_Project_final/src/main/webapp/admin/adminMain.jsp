<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	
	<style type="text/css">
		#main-css {
			position: relative;
			margin:0 5% 0 5%;
		}
		
		#container {
			width: 700px;
	    	height: 500px;
		}
		
		#container2 {
			width: 600px;
	    	height: 400px;
		}
		
		.grid {
			text-align: center;
		}
		
		.one-content {
			text-align: center;
			display: inline-block;
		}
		
		.highcharts-figure, .highcharts-data-table table {
		    min-width: 320px; 
		    max-width: 800px;
		    margin: 1em auto;
		}
		
		.highcharts-data-table table {
		    font-family: Verdana, sans-serif;
		    border-collapse: collapse;
		    border: 1px solid #EBEBEB;
		    margin: 10px auto;
		    text-align: center;
		    width: 100%;
		    max-width: 500px;
		}
		.highcharts-data-table caption {
		    padding: 1em 0;
		    font-size: 1.2em;
		    color: #555;
		}
		.highcharts-data-table th {
			font-weight: 600;
		    padding: 0.5em;
		}
		.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
		    padding: 0.5em;
		}
		.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
		    background: #f8f8f8;
		}
		.highcharts-data-table tr:hover {
		    background: #f1f7ff;
		}
		
	</style>

</head>
<body>

	<header>
		<%@include file = "adminHeader.jsp" %>
	</header>
	<br><br><br>
	
	<main>
	
		<div id="main-css">
			<h3 align="center">통계</h3>
			<hr>
			<br><br><br>
			<div class="grid">
				<div class="one-content">
					<figure class="highcharts-figure">
					    <div id="container"></div>
						
					    <button id="plain">Plain</button>
					    <button id="inverted">Inverted</button>
					    <button id="polar">Polar</button>
					</figure>
				</div>
				<div class="one-content">
					<figure class="highcharts-figure">
					    <div id="container2"></div>
					    
					</figure>
				</div>
			</div>
		</div>
		
	</main>
	
	<footer>
	
	</footer>
	
	<script>
		<%-- 지역별 매출 --%>
		const chart = Highcharts.chart('container', {
		    title: {
		        text: '지역별 매출'
		    },
		    subtitle: {
		        text: 'Chart'
		    },
		    xAxis: {
		        categories: ['서울', '부산', '경기도', '강원도', '충청도', '전라도', '경상도', '제주도']
		    },
		    series: [{
		    	name: '매출',
		        type: 'column',
		        colorByPoint: true,
		        data: [${seoul }, ${busan }, ${gyeonggi }, ${gangwon }, ${chungcheong }, ${jeolla }, ${gyeongsang }, ${jeju }],
		        showInLegend: false
		    }]
		});
		
		document.getElementById('plain').addEventListener('click', () => {
		    chart.update({
		        chart: {
		            inverted: false,
		            polar: false
		        },
		        subtitle: {
		            text: 'Chart'
		        }
		    });
		});
	
		document.getElementById('inverted').addEventListener('click', () => {
		    chart.update({
		        chart: {
		            inverted: true,
		            polar: false
		        },
		        subtitle: {
		            text: 'Chart'
		        }
		    });
		});
	
		document.getElementById('polar').addEventListener('click', () => {
		    chart.update({
		        chart: {
		            inverted: false,
		            polar: true
		        },
		        subtitle: {
		            text: 'Chart'
		        }
		    });
		});
		<%-- 지역별 매출 --%>
		
		<%-- 카테고리별 매출 --%>
		Highcharts.chart('container2', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '카테고리별 판매율'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    accessibility: {
		        point: {
		            valueSuffix: '%'
		        }
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: false
		            },
		            showInLegend: true
		        }
		    },
		    series: [{
		        name: '판매율',
		        colorByPoint: true,
		        data: [{
		            name: '수상레저',
		            y: ${water }
		        }, {
		            name: '티켓/투어',
		            y: ${outdoor }
		        }, {
		            name: '아웃도어/스포츠',
		            y: ${ticket }
		        }]
		    }]
		});
	</script>
	
</body>
</html>