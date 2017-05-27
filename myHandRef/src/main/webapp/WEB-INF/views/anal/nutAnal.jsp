<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
* 영양성분 분석 화면
* 
* history :
*        최재욱, 1.0, 2017/03/13 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/13  - 초기 작성
* see : 영양성분 분석 화면
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
	
	 // Build the chart
    Highcharts.chart('pie1', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '권장 영양성분 섭취량 (${memLoginInfo.mem_gendr} / ${memLoginInfo.mem_age}세)'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
            name: '비율',
            colorByPoint: true,
            data: [
            {
                name: '탄수화물',               
                y: ${recmndInfo.carbohydrate}
            }, {
                name: '단백질',
                y: ${recmndInfo.protein},
                sliced: true,
                selected: true
            }, {
                name: '지방',
                y: ${recmndInfo.fat}
            }, {
                name: '당류',
                y: ${recmndInfo.sugars}
            }, {
                name: '나트륨',
                y: ${recmndInfo.salt}/1000
            }, {
                name: '콜레스테롤',
                y: ${recmndInfo.cholesterol}/1000
            }, {
                name: '포화지방산',
                y: ${recmndInfo.saturated_fat}
            }, {
                name: '트랜스지방산',
                y: ${recmndInfo.unsaturated_fat}
            }]
        }]
    });
	 
	
    Highcharts.chart('pie2', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '나의 영양성분 섭취량'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
            name: '비율',
            colorByPoint: true,
            data: [
            {
                name: '탄수화물',               
                y: ${intkInfoNutChart.carbohydrate}
            }, {
                name: '단백질',
                y: ${intkInfoNutChart.protein},
                sliced: true,
                selected: true
            }, {
                name: '지방',
                y: ${intkInfoNutChart.fat}
            }, {
                name: '당류',
                y: ${intkInfoNutChart.sugars}
            }, {
                name: '나트륨',
                y: ${intkInfoNutChart.salt}/1000
            }, {
                name: '콜레스테롤',
                y: ${intkInfoNutChart.cholesterol}/1000
            }, {
                name: '포화지방산',
                y: ${intkInfoNutChart.saturated_fat}
            }, {
                name: '트랜스지방산',
                y: ${intkInfoNutChart.unsaturated_fat}
            }]
        }]
    });
	
    
    '',
    '',
    '',
    '',
    ''
    
});


function nutAnalSearch(){
	var nutAnalCheckGroup=[];
    //체크박스 중 체크된 체크박스만 가져와서 Loop
    $("input:checkbox[name=nutChk]:checked").each(function(i,elements){
    	nutAnalCheckGroup.push($(this).val());
    });
    if(nutAnalCheckGroup.length==0){
        alert("1개 이상 체크해주세요.");
        return;
    }
    else if($("#search_dat").val().length==10){
        alert("정확한 기간을 선택해주세요.");
        return;
    }
    
	var formData = "nutAnalCheckGroup="+nutAnalCheckGroup + "&search_dat="+$("#search_dat").val();	
	var url = "/nutAnal.do?nutAnalCheckGroup="+nutAnalCheckGroup+"&search_dat="+$("#search_dat").val(); 
	$(location).attr('href',url);		
}


$(function(){ 
	<c:forEach var="item" items="${refValueObject.nutAnalCheckGroup}" varStatus="status">
		<c:if test="${item == 1}">
			$("#chk1").click();
		</c:if>
		<c:if test="${item == 2}">
			$("#chk2").click();
		</c:if>
		<c:if test="${item == 3}">
			$("#chk3").click();
		</c:if>
		<c:if test="${item == 4}">
		 	$("#chk4").click();
		</c:if>
	</c:forEach>      
});



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
						<a href="/main.do" class="logo"><strong> Nut Analysis (영양성분 분석) </strong></a>
						<ul class="icons">
							<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						</ul>
					</header>

					<!-- Section -->
					<section style="padding-top:25px">
						<form>
							<header class="main">
								<div class="row"> 
									<table style="text-align:center; valign:middle" >
										<colgroup>
											<col class="col-xs-3 col-sm-3 col-md-2 col-lg-2"/>   
											<col class="col-xs-7 col-sm-7 col-md-9 col-lg-9"/>   
											<col class="col-xs-2 col-sm-2 col-md-1 col-lg-1"/> 
										</colgroup>
										<tr>
											<td style="vertical-align: middle;"><b>기간</b></td>
											<td style="vertical-align: middle;" align="left" colspan="2">
												<input type="text" class="form-control"  id="search_dat" name="search_dat" value="${refValueObject.search_dat}" readonly>
											</td>
										</tr>
										<tr>
											<td style="vertical-align: middle;"><b>영양성분</b></td>
											<td style="vertical-align: middle; padding-bottom:0px" align="left">
												<div class="row" style="margin:0px;">
													<input type="checkbox" id="chk1" name="nutChk" value="1">
													<label for="chk1">칼로리</label>
													<input type="checkbox" id="chk2" name="nutChk" value="2">
													<label for="chk2">3대 영양소</label>
													<input type="checkbox" id="chk3" name="nutChk" value="3" >
													<label for="chk3">기타 영양소</label>
													<input type="checkbox" id="chk4" name="nutChk" value="4">
													<label for="chk4">나쁜 영양소</label>
												</div>
											</td>
											<td>
												<a onclick="javascript:nutAnalSearch()" class="button special">검색</a>
											</td>
										</tr>
									</table>
								</div>
							</header>
						</form>
						
						<div class="row">
							<div id="pie1" class="6u 12u$(small)" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
							<div id="pie2" class="6u 12u$(small)" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
						</div>
						
						<br>
						
			
						<div class="row"> 
							<table style="text-align:center; valign:middle;" >
								<colgroup>
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
									<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'>  
								</colgroup>
								
								<tr>
									<td><b>권장 영양성분</b></td>
									<c:forEach var="item" items="${refValueObject.nutAnalCheckGroup}" varStatus="status">
										<c:if test="${item == 1}">
											<td><b>${recmndInfo.calorie} kcal</b></td>
										</c:if>
										<c:if test="${item == 2}">
											<td><b>${recmndInfo.carbohydrate} g</b></td>
											<td><b>${recmndInfo.protein} g</b></td>
											<td><b>${recmndInfo.fat} g</b></td>
										</c:if>
										<c:if test="${item == 3}">
											<td><b>${recmndInfo.sugars} g</b></td>
											<td><b>${recmndInfo.salt} mg</b></td>
										</c:if>
										<c:if test="${item == 4}">
											<td><b> &lt; ${recmndInfo.cholesterol} mg</b></td>
											<td><b> &lt; ${recmndInfo.saturated_fat} g</b></td>
											<td><b> &lt; ${recmndInfo.unsaturated_fat} g</b></td>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<td><b>일자</b></td>
									<c:forEach var="item" items="${refValueObject.nutAnalCheckGroup}" varStatus="status">
										<c:if test="${item == 1}">
											<td><b>칼로리</b></td>
										</c:if>
										<c:if test="${item == 2}">
											<td><b>탄수화물</b></td>
											<td><b>단백질</b></td>
											<td><b>지방</b></td>
										</c:if>
										<c:if test="${item == 3}">
											<td><b>당류</b></td>
											<td><b>나트륨</b></td>
										</c:if>
										<c:if test="${item == 4}">
											<td><b>콜레스테롤</b></td>
											<td><b>포화지방산</b></td>
											<td><b>트랜스지방산</b></td>
										</c:if>
									</c:forEach>
								</tr>
								
								<c:forEach var="intkInfoNutList" items="${intkInfoNutList}" varStatus="status">
									<tr>
										<td>${intkInfoNutList.search_dat}</td>
										<c:forEach var="item" items="${refValueObject.nutAnalCheckGroup}" varStatus="status">
											<c:if test="${item == 1}">
												<td>${intkInfoNutList.calorie} kcal</td>
											</c:if>
											<c:if test="${item == 2}">
												<td>${intkInfoNutList.carbohydrate} g</td>
												<td>${intkInfoNutList.protein} g</td>
												<td>${intkInfoNutList.fat} g</td>
											</c:if>
											<c:if test="${item == 3}">
												<td>${intkInfoNutList.sugars} g</td>
												<td>${intkInfoNutList.salt} mg</td>
											</c:if>
											<c:if test="${item == 4}">
												<td>${intkInfoNutList.cholesterol} mg</td>
												<td>${intkInfoNutList.saturated_fat} g</td>
												<td>${intkInfoNutList.unsaturated_fat} g</td>
											</c:if>
										</c:forEach>
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