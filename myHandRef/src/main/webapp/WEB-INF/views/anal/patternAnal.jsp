<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
* 생활패턴 분석 화면
* 
* history :
*        최재욱, 1.0, 2017/03/13 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/13  - 초기 작성
* see : 생활패턴 분석 화면
//--> 
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script src="/resources/flatpickr/dist/flatpickr.min.js"></script>

<script src="/resources/flatpickr/dist/l10n/ko.js"></script>
<link rel="stylesheet" href="/resources/flatpickr/dist/themes/material_red.css">

<script>
	 $(function() {
		 flatpickr("#search_dat", {
			    mode: "range",
			    disable: [
			        function(date) {
			            // disable every multiple of 8
// 			            return !(date.getDate() % 8);
			        }
			    ]
			});

	});	

$(function(){
	
	
	Highcharts.chart('container', {
	    title: {
	        text: '생활패턴 분석'
	    },
	    xAxis: {
	        categories: ['0~4시', '4~8시', '8~12시', '12~16시', '16~20시', '20~24시']
	    },
	    labels: {
	        items: [{
	            html: '3대 영양소 비율',
	            style: {
	                left: '75px',
	                top: '18px',
	                color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
	            }
	        }]
	    },
	    series: [{
	        type: 'column',
	        name: '탄수화물',
	        data: [${intkInfoPatternChart.carbohydrate0to4}
	        	 , ${intkInfoPatternChart.carbohydrate4to8}
	        	 , ${intkInfoPatternChart.carbohydrate8to12}
	        	 , ${intkInfoPatternChart.carbohydrate12to16}
	        	 , ${intkInfoPatternChart.carbohydrate16to20}
	        	 , ${intkInfoPatternChart.carbohydrate20to24}] 
	    }, {
	        type: 'column',
	        name: '단백질',
	        data: [${intkInfoPatternChart.protein0to4}
		       	 , ${intkInfoPatternChart.protein4to8}
		    	 , ${intkInfoPatternChart.protein8to12}
		    	 , ${intkInfoPatternChart.protein12to16}
		    	 , ${intkInfoPatternChart.protein16to20}
		    	 , ${intkInfoPatternChart.protein20to24}] 
	    }, {
	        type: 'column',
	        name: '지방',
	        data: [${intkInfoPatternChart.fat0to4}
		       	 , ${intkInfoPatternChart.fat4to8}
		    	 , ${intkInfoPatternChart.fat8to12}
		    	 , ${intkInfoPatternChart.fat12to16}
		    	 , ${intkInfoPatternChart.fat16to20}
		    	 , ${intkInfoPatternChart.fat20to24}] 
	    }, {
	        type: 'spline',
	        name: '칼로리',
	        data: [${intkInfoPatternChart.calorie0to4}
		       	 , ${intkInfoPatternChart.calorie4to8}
		    	 , ${intkInfoPatternChart.calorie8to12}
		    	 , ${intkInfoPatternChart.calorie12to16}
		    	 , ${intkInfoPatternChart.calorie16to20}
		    	 , ${intkInfoPatternChart.calorie20to24}] ,
	        marker: {
	            lineWidth: 2,
	            lineColor: Highcharts.getOptions().colors[3],
	            fillColor: 'white'
	        }
	    }, {
	        type: 'pie',
	        name: '총 합계',
	        data: [{
	            name: '탄수화물',
	            y: ${intkInfoPatternChart.carbohydrate},    
	            color: Highcharts.getOptions().colors[0] // Jane's color
	        }, {
	            name: '단백질',
	            y: ${intkInfoPatternChart.protein},
	            color: Highcharts.getOptions().colors[1] // John's color
	        }, {
	            name: '지방',
	            y: ${intkInfoPatternChart.fat},
	            color: Highcharts.getOptions().colors[2] // Joe's color
	        }],
	        center: [100, 70],
	        size: 100,
	        showInLegend: false,
	        dataLabels: {
	            enabled: false
	        }
	    }]
	});
});

// 검색
function patternAnalSearch(){
    if($("#search_dat").val().length==10){
        alert("정확한 기간을 선택해주세요.");
        return;
    }
	var url = "/patternAnal.do?search_dat="+$("#search_dat").val(); 
	$(location).attr('href',url);		
}

</script>
</head>
<body>

	<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<div id="main">
				<div class="inner">

					<!-- Header -->
					<header id="header">
						<a href="/main.do" class="logo"><strong> Pattern Analysis (생활패턴 분석) </strong></a>
						<ul class="icons">
							<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						</ul>
					</header>

					<!-- Section -->
					<section style="padding-top:25px">
						<header class="main">
							<div class="row"> 
								<table style="text-align:center; valign:middle" >
									<colgroup>
										<col class="col-xs-3 col-sm-3 col-md-2 col-lg-2"/>   
										<col class="col-xs-7 col-sm-6 col-md-8 col-lg-8"/>   
										<col class="col-xs-3 col-sm-3 col-md-2 col-lg-2"/> 
									</colgroup>
									<tr>
										<td style="vertical-align: middle;"><b>기간</b></td>
										<td style="vertical-align: middle;" align="left" colspan="1">
											<input type="text" class="form-control"  id="search_dat" name="search_dat" value="${refInfo.expiration_dat}" readonly>
										</td>
										<td>
											<a onclick="javascript:patternAnalSearch()" class="button special">검색</a>
										</td>
									</tr>
								</table>
							</div>
						</header>
						
						
						<div class="row" id="container">
<!-- 							<div  style="min-width: 310px; height: 400px; margin: 0 auto"></div> -->
						</div>
						
						<br>
						
						<div class="row"> 
							<table style="text-align:center; valign:middle;" >
								<tr>
									<td><b>일자</b></td>
									<td><b>0~4시</b></td>
									<td><b>4~8시</b></td>
									<td><b>8~12시</b></td>
									<td><b>12~16시</b></td>
									<td><b>16~20시</b></td>
									<td><b>20~24시</b></td>
								</tr>
								
								<c:forEach var="intkInfoPatternList" items="${intkInfoPatternList}" varStatus="status">
									<tr>
										<td style="vertical-align: middle;">${intkInfoPatternList.search_dat}</td> 
										<td>${intkInfoPatternList.calorie0to4}kcal <br> (${intkInfoPatternList.carbohydrate0to4}/${intkInfoPatternList.protein0to4}/${intkInfoPatternList.fat0to4})g</td>
										<td>${intkInfoPatternList.calorie4to8}kcal <br> (${intkInfoPatternList.carbohydrate4to8}/${intkInfoPatternList.protein4to8}/${intkInfoPatternList.fat4to8})g</td>
										<td>${intkInfoPatternList.calorie8to12}kcal <br> (${intkInfoPatternList.carbohydrate8to12}/${intkInfoPatternList.protein8to12}/${intkInfoPatternList.fat8to12})g</td>
										<td>${intkInfoPatternList.calorie12to16}kcal <br> (${intkInfoPatternList.carbohydrate12to16}/${intkInfoPatternList.protein12to16}/${intkInfoPatternList.fat12to16})g</td>
										<td>${intkInfoPatternList.calorie16to20}kcal <br> (${intkInfoPatternList.carbohydrate16to20}/${intkInfoPatternList.protein16to20}/${intkInfoPatternList.fat16to20})g</td>
										<td>${intkInfoPatternList.calorie20to24}kcal <br> (${intkInfoPatternList.carbohydrate20to24}/${intkInfoPatternList.protein20to24}/${intkInfoPatternList.fat20to24})g</td>
									</tr>
								</c:forEach>								
							</table>
						</div>
					</section>
				</div>
			</div>

			<!-- Sidebar -->
			<c:import url="/menu.do"/>

		</div>
</body>
</html>