<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
* 가족구성원 분석 화면
* 
* history :
*        최재욱, 1.0, 2017/03/26 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/26  - 초기 작성(화면 디자인만)
* see : 가족구성원 분석 화면
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
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: '가족 구성원 분석'
	    },
	    xAxis: {
	        categories: [ <c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">
	       				  '${fmyMemList.mem_nme}'
	       				  <c:if test="${!status.last}"> , </c:if>
	       				  </c:forEach>	
	                     ]
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: '3대 영양소 비율'
	        }
	    },
	    tooltip: {
	        valueSuffix: 'kcal'
	    },
	    legend: {
	        reversed: true
	    },
	    plotOptions: {
	        series: {
	            stacking: 'normal'
	        }
	    },
	    series: [{
	        name: '지방',
	        data: [
	                <c:forEach var="intkInfoFmyChart" items="${intkInfoFmyChart}" varStatus="status">
						<c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">							
							<c:set var="fat" value="fat${fmyMemList.mem_seq}" />
							${intkInfoFmyChart[fat]}
							<c:if test="${!status.last}"> , </c:if>
      					</c:forEach>			
					</c:forEach>
	               ]	    
	    }, {
	        name: '단백질',
	        data: [
	                <c:forEach var="intkInfoFmyChart" items="${intkInfoFmyChart}" varStatus="status">
						<c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">							
							<c:set var="protein" value="protein${fmyMemList.mem_seq}" />
							${intkInfoFmyChart[protein]}
							<c:if test="${!status.last}"> , </c:if>
	 					</c:forEach>			
					</c:forEach>
             	 ]
	    }, {
	        name: '탄수화물',
	        data: [
	                <c:forEach var="intkInfoFmyChart" items="${intkInfoFmyChart}" varStatus="status">
						<c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">							
							<c:set var="carbohydrate" value="carbohydrate${fmyMemList.mem_seq}" />
							${intkInfoFmyChart[carbohydrate]}
							<c:if test="${!status.last}"> , </c:if>
	 					</c:forEach>			
					</c:forEach>
	         	 ]
	    }]
	});
});

//검색
function fmyAnalSearch(){
    if($("#search_dat").val().length==10){
        alert("정확한 기간을 선택해주세요.");
        return;
    }
	var url = "/fmyAnal.do?search_dat="+$("#search_dat").val(); 
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
						<a href="/main.do" class="logo"><strong> family Analysis (가족구성원 분석) </strong></a>
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
											<a onclick="javascript:fmyAnalSearch()" class="button special">검색</a>
										</td>
									</tr>
								</table>
							</div>
						</header>
						
						
						<div class="row" id="container">
							
						</div>
						
						<br>
						
						<div class="row"> 
							<table style="text-align:center; valign:middle;" >
								<tr>
									<td><b>일자</b></td>
									<c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">
										<td><b>${fmyMemList.mem_nme}</b></td>
				       				</c:forEach>
								</tr>
								
								<c:forEach var="intkInfoFmyList" items="${intkInfoFmyList}" varStatus="status">
									<tr>										
										<td style="vertical-align: middle;">${intkInfoFmyList.search_dat}</td>
										<c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">							
											<c:set var="carbohydrate" value="carbohydrate${fmyMemList.mem_seq}" />
											<c:set var="protein" value="protein${fmyMemList.mem_seq}" />
											<c:set var="fat" value="fat${fmyMemList.mem_seq}" />
											<td>${intkInfoFmyList[carbohydrate]} / ${intkInfoFmyList[protein]} / ${intkInfoFmyList[fat]} g</td>
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