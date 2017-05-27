<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!-- 
* 바코드 관리 조회 화면
* 
* history :
*        최재욱, 1.0, 2017/03/26 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/26  - 초기 작성
* see : 바코드 관리 조회 화면 
//--> 
<html>
	<head>
		<%@ include file="/WEB-INF/include/include-header.jspf" %>
	</head>
	<style>
		/* 미리보기 스타일 셋팅 */
		#preview{
		    z-index: 9999;
		    position:absolute;
		    border:0px solid #ccc;
		    background:#333;
		    padding:1px;
		    display:none;
		    color:#fff;
		}
		/* 이미지 썸네일 */
		.thumbnail{
		   display:inline;
		   margin-bottom:0px;
		   height:50px;
		   width:50px;
		}
	</style>
	
	<script>
		//이미지 섬네일
	    var xOffset = 10;
	    var yOffset = 30;
	    $(document).ready(function() {
		    $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
		        $("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='200px' /></p>"); //보여줄 이미지를 선언                       
		        $("#preview")
		            .css("top",(e.pageY - xOffset) + "px")
		            .css("left",(e.pageX + yOffset) + "px")
		            .fadeIn("fast"); //미리보기 화면 설정 셋팅
		    });     
		    $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
		        $("#preview")
		            .css("top",(e.pageY - xOffset) + "px")
		            .css("left",(e.pageX + yOffset) + "px");
		    });     
		    $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
		        $("#preview").remove();
		    });
		    
		    // 정렬 선택시
		    $("#order_by").change(function(){
		        var barcdListFrm = $("#barcdListFrm");
				barcdListFrm.action = '/barcdList.do';
				barcdListFrm.submit();
		    });
	    });
		    
		//페이징
		function paging(page){
			$("#currentPageNo").val(page);
			var barcdListFrm = $("#barcdListFrm");
			barcdListFrm.action = '/barcdList.do';
			barcdListFrm.submit();
		} 
	    
		// 나의 냉장고 조회 검색
		function barcdListSearch(){
			$("#currentPageNo").val(1);
			var barcdListFrm = $("#barcdListFrm");
			barcdListFrm.action = '/barcdList.do';
			barcdListFrm.submit();	
		}
		
		
		// 바코드 셀렉
		function barcdSelectOne(){
			
		}
		
		
		// 바코드 등록
		function barcdInsert(){
			alert("관리자만 등록 가능합니다.")
		}
	</script>
	
	<body>
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<!-- Header -->
					<header id="header">
						<a href="/main.do" class="logo"><strong>바코드 관리</strong></a>
						<ul class="icons">
							<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							
						</ul>
					</header>			

					<!-- Section -->
					<section style="padding-top:25px">
						<form id="barcdListFrm">
							<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pageSearchInfo.currentPageNo}"> <!-- 현재 페이지 -->  
							
							<header class="main">
								<div class="row"> 
									<table style="text-align:center; valign:middle" >
										<colgroup>
											<col class="col-xs-3 col-sm-3 col-md-2 col-lg-2"/>   
											<col class="col-xs-7 col-sm-7 col-md-9 col-lg-9"/>   
											<col class="col-xs-2 col-sm-2 col-md-1 col-lg-1"/> 
										</colgroup>
										
										<tr>
											<td style="vertical-align: middle;"><b>바코드 식품명</b></td>
											<td style="vertical-align: middle;" align="left">
												<input type="text" class="form-control" id="food_nme" name="food_nme" value="${pageSearchInfo.food_nme}" >
											</td>
											<td>
												<a onclick="javascript:barcdListSearch()" class="button special">검색</a>
											</td>
										</tr>
										
									</table>
								</div>
							</header>

							<div class="row"> 
							
								<table style="text-align:center; valign:middle;">
									<colgroup>
										<col class='col-xs-3 col-sm-4 col-md-3 col-lg-2'> 
										<col class='col-xs-1 col-sm-0 col-md-1 col-lg-1'> 
										<col class='col-xs-4 col-sm-4 col-md-4 col-lg-6'> 
										
										<col class='col-xs-1 col-sm-0 col-md-1 col-lg-1'> 
										<col class='col-xs-2 col-sm-3 col-md-2 col-lg-1'>  
									</colgroup>	
									<tr>
										<td><b>바코드 번호</b></td>
										<td><b>이미지</b></td>
										<td><b>식품명</b></td>
										
										<td><b>1회 제공량</b></td>
										<td><b>열랑</b></td>
									</tr>
									<c:forEach var="barcdList" items="${barcdList}" varStatus="status">
										<tr onclick="javascript:barcdSelectOne(${barcdList.barcd})">
											<td style="vertical-align: middle;">${barcdList.barcd}</td>
											<td style="vertical-align: middle;" align="center"><img src="${barcdList.food_img}" class="thumbnail" style="margin-bottom:0px; align:center;"></td>
											<td style="vertical-align: middle;">${barcdList.food_nme}</td>
									
											<td style="vertical-align: middle;">${barcdList.supplied_amount} </td>
											<td style="vertical-align: middle;">${barcdList.calorie}kcal </td>
											
										</tr>
									</c:forEach>
								</table>
							</div>
						</form>	
						<div>
			  				<nav align="center">
							  <ul class="pagination" style="margin-top:0px; margin-left:40px;">
							  	<!-- 무조건 1페이지로 << 버튼 -->
					            <c:if test = "${pageSearchInfo.currentPageNo>10}">
					                <li>
					                    <a href="javascript:paging(1)" aria-label="Previous">
					                    <span aria-hidden="true">«</span></a>
					                </li>
					            </c:if> 
					            <!-- 한 단위 앞으로 < 버튼 -->
					            <c:if test = "${pageSearchInfo.currentPageNo>5}">
					                <li>
					                    <a href="javascript:paging(${pageSearchInfo.firstPageNoOnPageList-1})" aria-label="Previous">
					                    <span aria-hidden="true">‹</span></a>
					                </li>
					            </c:if>  
		
								<c:forEach varStatus="status" begin="${pageSearchInfo.firstPageNoOnPageList}" end="${pageSearchInfo.lastPageNoOnPageList}">
				                    <li ${pageSearchInfo.currentPageNo==status.current ? "class='active'" : ""} >
				                        <a href="javascript:paging(${status.current})">${status.current}</a>
				                    </li>                                                    
					            </c:forEach> 
						
					            <!-- 한 단위 뒤로 > 버튼 -->
					            <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 5 < pageSearchInfo.totalPageCount}">
					                <li>
					                    <a href="javascript:paging(${pageSearchInfo.lastPageNoOnPageList+1})" aria-label="Next">
					                    <span aria-hidden="true">&rsaquo;</span></a>
					                </li>
					            </c:if> 
					            <!-- 무조건 마지막페이지로 >> 버튼 -->
					            <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 10 < pageSearchInfo.totalPageCount}">
					                <li>
					                    <a href="javascript:paging(${pageSearchInfo.totalPageCount})" aria-label="Next">
					                    <span aria-hidden="true">&raquo;</span></a>
					                </li>
					            </c:if> 
							  </ul>
							</nav>			
			  			</div>
			  			<a style="float:right" onclick="javascript:barcdInsert()" class="button special">바코드 등록</a>
					</section>		
				</div>
			</div>
			
			<!-- Sidebar -->
			<c:import url="/menu.do"/>		
		</div>
	</body>
</html>