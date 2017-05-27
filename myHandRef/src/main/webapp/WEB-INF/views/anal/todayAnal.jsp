<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
* 투데이 분석 화면
* 
* history :
*        최재욱, 1.0, 2017/03/13 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/13  - 초기 작성
* see : 투데이 분석 화면
//--> 
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- <script src="https://code.highcharts.com/highcharts.js"></script> -->
<!-- <script src="https://code.highcharts.com/modules/exporting.js"></script> -->
<script src="/resources/highcharts/highcharts.js"></script>
<script src="/resources/highcharts/exporting.js"></script>
<script>


function nutPercentChk(recIntk, todayIntk, sign){
	var intkPercent = (todayIntk / (recIntk / 100)).toFixed(1);
	var html;
	if(intkPercent < 70 || intkPercent > 130){
		html = "<font color='red'>" + recIntk +" / "+ todayIntk + sign + " ("+intkPercent+"%)</font>";	
	}
	else{
		html = "<font color='blue'>" + recIntk +" / "+ todayIntk + sign + " ("+intkPercent+"%)</font>";
	}
	return html;
} 


function nutIntkChk(recIntk, todayIntk, sign){
	var intkChk = (todayIntk / (recIntk / 100)).toFixed(1);
	var html;
	
	if(intkChk < 0){
		html = "<font color='red'> <" + recIntk +" ("+ todayIntk + sign + ")</font>";	
	}
	else{
		html = "<font color='blue'> <" + recIntk +" ("+ todayIntk + sign + ")</font>";	
	}	
	return html;
}



function div1Show(){
	var calorie = nutPercentChk(${recmndInfo.calorie}, ${intkInfo.calorie}, 'kcal');
	var carbohydrate = nutPercentChk(${recmndInfo.carbohydrate}, ${intkInfo.carbohydrate}, 'g');
	var protein = nutPercentChk(${recmndInfo.protein},${intkInfo.protein}, 'g');
	var fat = nutPercentChk(${recmndInfo.fat},${intkInfo.fat}, 'g');
	var sugars = nutPercentChk(${recmndInfo.sugars},${intkInfo.sugars}, 'g');
	var salt = nutPercentChk(${recmndInfo.salt},${intkInfo.salt}, 'mg');
	var cholesterol = nutIntkChk(${recmndInfo.cholesterol},${intkInfo.cholesterol}, 'mg');
	var saturated_fat = nutIntkChk(${recmndInfo.saturated_fat},${intkInfo.saturated_fat}, 'g');
	var unsaturated_fat = nutIntkChk(${recmndInfo.unsaturated_fat},${intkInfo.unsaturated_fat}, 'g');			
	
	$("#div1").html(""
			+"		<table style='text-align:center; valign:middle' >"
			+"			<colgroup>"
			+"				<col class='col-xs-3 col-sm-3 col-md-3'> "
			+"				<col class='col-xs-3 col-sm-3 col-md-3'> "
			+"				<col class='col-xs-3 col-sm-3 col-md-3'> "
			+"				<col class='col-xs-3 col-sm-3 col-md-3'> "
			+"			</colgroup>"
			+"			<tr>"
			+"				<td colspan='4' style='word-break:break-all'> "
			+"					<div class='text-center'>"
			+"						<strong>Today 분석</strong>"
			+"					</div>"
			+"				</td>"
			+"			</tr>"
			+"			<tr>"
			+"				<td colspan='4' style='word-break:break-all'> "
			+"				<font size='6'>"+calorie+" </font>"
			+"				</td>"
			+"			</tr>"
			+"			<tr>"
			+"				<td colspan='4' style='word-break:break-all'> "
			+"					<div class='text-center'>"
			+"						<strong>권장 / 부족 영양성분</strong>"
			+"					</div>"
			+"				</td>"
			+"			</tr>"
			+"			<tr>"
			+"				<td style='vertical-align: middle;'><b>탄수화물</b></td>"
			+"				<td style='vertical-align: middle;'>"+carbohydrate+"</td>"
			+"				<td style='vertical-align: middle;'><b>단백질</b></td>"
			+"				<td style='vertical-align: middle;'>"+protein+"</td>"
			+"			</tr>"
			+"			<tr>"
			+"				<td style='vertical-align: middle;'><b>지방</b></td>"
			+"				<td style='vertical-align: middle;'>"+fat+"</td>"
			+"				<td style='vertical-align: middle;'><b>당류</b></td>"
			+"				<td style='vertical-align: middle;'>"+sugars+"</td>"
			+"			</tr>"
			+"			<tr>"
			+"				<td style='vertical-align: middle;'><b>나트륨</b></td>"
			+"				<td style='vertical-align: middle;'>"+salt+"</td>"
			+"				<td style='vertical-align: middle;'><b>콜레스테롤</b></td>"
			+"				<td style='vertical-align: middle;'>"+cholesterol+"</td>"
			+"			</tr>"
			+"			<tr>"
			+"				<td style='vertical-align: middle;'><b>포화지방산</b></td>"
			+"				<td style='vertical-align: middle;'>"+saturated_fat+"</td>"
			+"				<td style='vertical-align: middle;'><b>트랜스지방산</b></td>"
			+"				<td style='vertical-align: middle;'>"+unsaturated_fat+"</td>"
			+"			</tr>"
			+"		</table>			"

			+"");
}
function div2Show(){
	// 3대 영양소 비교 div1
	Highcharts.chart('div2', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: '3대 영양소 비교'
	    },
	    subtitle: {
	        text: '출처: <a href="http://www.kns.or.kr/FileRoom/FileRoom_view.asp?mode=mod&restring=%252FFileRoom%252FFileRoom.asp%253Fxsearch%253D0%253D%253Dxrow%253D10%253D%253DBoardID%253DKdr%253D%253Dpage%253D1&idx=79&page=1&BoardID=Kdr&xsearch=1&cn_search=">한국영양학회-2015 한국인 영양소 섭취기준</a>'
	    },
	    xAxis: {
	        categories: [ '탄수화물', '단백질', '지방' ],
	        title: {
	            text: null
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'kcal / g (일)',
	            align: 'high'
	        },
	        labels: {
	            overflow: 'justify'
	        }
	    },
	    tooltip: {
	        valueSuffix: 'g'
	    },
	    plotOptions: {
	        bar: {
	            dataLabels: {
	                enabled: true
	            }
	        }
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'top',
	        x: -40,
	        y: 80,
	        floating: true,
	        borderWidth: 1,
	        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
	        shadow: true
	    },
	    credits: {
	        enabled: false
	    },
	    series: [{
	        name: '권장 3대 영양소',
	        data: [ ${recmndInfo.carbohydrate}, ${recmndInfo.protein}, ${recmndInfo.fat}]
	    }, {         
	        name: '섭취 3대 영양소',
	        data: [ ${intkInfo.carbohydrate}, ${intkInfo.protein}, ${intkInfo.fat}]
	    }
	   
	    ]
	});	
}


function div3Show(){
	// 기타 영양소 비교 div3
	Highcharts.chart('div3', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '기타 영양소 비교'
	    },
	    subtitle: {
	        text: '출처 - 한국영양학회-2015 한국인 영양소 섭취기준'
	    },
	    xAxis: {
	        categories: [
	            '당류',
	            '나트륨',
	            '콜레스테롤',
	            '포화지방산',
	            '트랜스지방산'

	        ],
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'g (일)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f} g</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [{
	        name: '권장 섭취량',
	        data: [${recmndInfo.sugars}, ${recmndInfo.salt}, ${recmndInfo.cholesterol}, ${recmndInfo.saturated_fat}, ${recmndInfo.unsaturated_fat}]
	
	    }, {
	        name: '현재 섭취량',
	        data: [${intkInfo.sugars}, ${intkInfo.salt}, ${intkInfo.cholesterol}, ${intkInfo.saturated_fat}, ${intkInfo.unsaturated_fat}]
	
	    }]
	});
}


function div4Show(){
// 	가족구성원별 생활패턴 분석
	Highcharts.chart('div4', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: '가족구성원별 생활패턴 분석'
	    },
	    xAxis: {
	        categories: [
						<c:forEach var="item" items="${fmyMemList}" varStatus="loopStatus">
						'<c:out value="${item.mem_nme}"/>'
						<c:if test="${!loopStatus.last}"> , </c:if>
						</c:forEach>      
	                     ]
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: '재욱이네 냉장고 가족'
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
	        name: '18~24시',
	        data: [
					<c:forEach var="item" items="${fmy18to24List}" varStatus="loopStatus">
						<c:out value="${item.calorie}"/>
						<c:if test="${!loopStatus.last}"> , </c:if>
					</c:forEach> 
				   ]
	    }, {
	        name: '12~18시',
	        data: [
					<c:forEach var="item" items="${fmy12to18List}" varStatus="loopStatus">
						<c:out value="${item.calorie}"/>
						<c:if test="${!loopStatus.last}"> , </c:if>
					</c:forEach> 
	               ]
	    }, {
	        name: '6~12시',
	        data: [
					<c:forEach var="item" items="${fmy6to12List}" varStatus="loopStatus">
						<c:out value="${item.calorie}"/>
						<c:if test="${!loopStatus.last}"> , </c:if>
					</c:forEach> 
	               ]
	    }, {
	        name: '0~6시',
	        data: [
					<c:forEach var="item" items="${fmy1to6List}" varStatus="loopStatus">
						<c:out value="${item.calorie}"/>
						<c:if test="${!loopStatus.last}"> , </c:if>
					</c:forEach>  
	               ]
	    }]
	});
}

function div5Show(){
	$("#div5").html(""	
	+"<table style='text-align:center; valign:middle' >"
	+"	<colgroup>"
	+"		<col class='col-xs-1 col-sm-1 col-md-1'> "
	+"		<col class='col-xs-5 col-sm-5 col-md-5'> "
	+"		<col class='col-xs-3 col-sm-3 col-md-3'> "
	+"		<col class='col-xs-2 col-sm-2 col-md-2'> "
	+"	</colgroup>"
	+"	<tr>"
	+"		<td colspan='4' style='word-break:break-all'> "
	+"			<div class='text-center'>"
	+"				<strong>Today 섭취 식품</strong>"
	+"			</div>"
	+"		</td>"
	+"	</tr>"
	+"	<tr>"
	+"		<td style='vertical-align: middle;'><b>No.</b></td>"
	+"		<td style='vertical-align: middle;'><b>상품명</b></td>"
	+"		<td style='vertical-align: middle;'><b>kcal</b></td>"
	+"		<td style='vertical-align: middle;'><b>비고</b></td>"
	+"	</tr>"
	<c:forEach var="todayIntkList" items="${todayIntkList}" varStatus="status">	
	+"	<tr>"
	+"		<td style='vertical-align: middle;'>${status.count}</td>"
	+"		<td style='vertical-align: middle;'>${todayIntkList.food_nme}</td>"
	+"		<td style='vertical-align: middle;'>${todayIntkList.calorie}kcal</td>"
	+"		<td style='vertical-align: middle;'>${todayIntkList.count}</td>"
	+"	</tr>"
	</c:forEach>
	+"</table>"
	+"");	
}

function div6Show(){
	$("#div6").html(""	
		+"<table style='text-align:center; valign:middle' >"
		+"	<colgroup>"
		+"		<col class='col-xs-1 col-sm-1 col-md-1'> "
		+"		<col class='col-xs-5 col-sm-5 col-md-5'> "
		+"		<col class='col-xs-3 col-sm-3 col-md-3'> "
		+"		<col class='col-xs-2 col-sm-2 col-md-2'> "
		+"	</colgroup>"
		+"	<tr>"
		+"		<td colspan='4' style='word-break:break-all'> "
		+"			<div class='text-center'>"
		+"				<strong>권장 섭취 식품</strong>"
		+"			</div>"
		+"		</td>"
		+"	</tr>"
		+"	<tr>"
		+"		<td style='vertical-align: middle;'><b>No.</b></td>"
		+"		<td style='vertical-align: middle;'><b>상품명</b></td>"
		+"		<td style='vertical-align: middle;'><b>유통기한</b></td>"
		+"		<td style='vertical-align: middle;'><b>비고</b></td>"
		+"	</tr>"
		<c:forEach var="recmndIntkList" items="${recmndIntkList}" varStatus="status">
		+"	<tr style='color:${recmndIntkList.state};'>"
		+"		<td style='vertical-align: middle;'>${status.count}</td>"
		+"		<td style='vertical-align: middle;'>${recmndIntkList.food_nme}</td>"
		+"		<td style='vertical-align: middle;'>${recmndIntkList.expiration_dat}</td>"
		+"		<td style='vertical-align: middle;'>${recmndIntkList.nut_nme}</td>"
		+"	</tr>"
		</c:forEach>
		+"</table>	"	
	+"");	
}


	 $(function(){ 
        $('#chkFrm :checkbox').click(function(){
        	var html;
        	var todayChkGroup=[];
        	
            //체크박스 중 체크된 체크박스만 가져와서 Loop
            $("input:checkbox[name=todayChk]:checked").each(function(i,elements){
            	var chkValue = $(this).val();
            	todayChkGroup.push(chkValue);
            	if(i==0){
        			$("#chgDiv").html(""
        		 		+"<div id='rowDiv"+i+"' class='row'>"
            			+"	<div id='div"+chkValue+"' class='6u 12u$(small)'> </div>"
            			+"</div>"
            			);	
            	}
            	else if(i%2==0){
        			$("#chgDiv").append(""
       		 			+"<div id='rowDiv"+i+"' class='row'>"
           				+"	<div id='div"+chkValue+"' class='6u 12u$(small)'> </div>"
           				+"</div>"
           				);
            	}
            	else{
        			$("#rowDiv"+(i-1)).append(""
           		 		+"<div id='div"+chkValue+"' class='6u 12u$(small)'> </div>"
               			);            		
            	}
            });
        
           	if(todayChkGroup==""){
        	   $("#chgDiv").html("");
           	}
           	
            for(var i=0; i<todayChkGroup.length; i++){
              switch (todayChkGroup[i]) {
          	  case '1'     : div1Show();
          	               break;
          	  case '2'     : div2Show();
          	               break;
          	  case '3'     : div3Show();
          	               break;
          	  case '4'     : div4Show();
				           break;
			  case '5'     : div5Show();
				           break;
			  case '6'     : div6Show();
				           break;
          	  default    : 
          	               break; 
            	}
            }
        });
              
		 $("#chk1").click();
		 $("#chk2").click();
// 		 $("#chk3").click();
// 		 $("#chk4").click();
		 $("#chk5").click();
		 $("#chk6").click();
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
						<a href="/main.do" class="logo"><strong> Today Analysis (투데이 분석) </strong></a>
						<ul class="icons">
							<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					
						</ul>
					</header>

					<!-- Section -->
					<section style="padding-top:25px">
						<header class="main">
							<div class="row"> 
								<div class="col-xs-1 col-sm-3 col-md-3 ">  </div>
								<div class="col-xs-10 col-sm-6 col-md-6 "> 
									<table style="text-align:center; valign:middle" >
										<colgroup>
											<col class="col-md-6 col-xs-6"/>   
											<col class="col-md-6 col-xs-6"/> 
										</colgroup>
										<tr>
											<td colspan="2" style="word-break:break-all"> 
												<div class="text-center">
													<img src="/resources/editorial/images/profile.jpg" style="width:50%; height:250px">
<!-- 												<img src="/resources/img/common/no_image.gif" style="width:50%; height:180px"> -->
												</div>
											</td>
											
										</tr>
										<tr>
											<td style="vertical-align: middle;"><b>이름</b></td>
											<td style="vertical-align: middle;">${memLoginInfo.mem_nme}</td>
										</tr>
										<tr>
											<td style="vertical-align: middle;"><b>성별 / 나이</b></td>
											<td style="vertical-align: middle;">${memLoginInfo.mem_gendr} / ${memLoginInfo.mem_age}</td>
										</tr>
									</table>
								</div>
								<div class="col-xs-1 col-sm-3 col-md-3 ">  </div>
							</div>
						</header>
						<form id="chkFrm">
							<div class="row" style=" margin:10px; margin-top:20px; margin-bottom:30px;">
								<input type="checkbox" id="chk1" name="todayChk" value="1">
								<label for="chk1">Today 분석</label>
								<input type="checkbox" id="chk2" name="todayChk" value="2">
								<label for="chk2">3대 영양소 비교</label>
								<input type="checkbox" id="chk3" name="todayChk" value="3" >
								<label for="chk3">기타 영양소 비교</label>
								<input type="checkbox" id="chk4" name="todayChk" value="4">
								<label for="chk4">가족구성원별 생활패턴 분석</label>
								<input type="checkbox" id="chk5" name="todayChk" value="5">
								<label for="chk5">Today 섭취 식품</label>
								<input type="checkbox" id="chk6" name="todayChk" value="6">
								<label for="chk6">권장 섭취 식품</label>
							</div>
						</form>
						<div id="chgDiv"></div>
		
					</section>
				</div>
			</div>

			<!-- Sidebar -->
			<c:import url="/menu.do"/>

		</div>
</body>
</html>