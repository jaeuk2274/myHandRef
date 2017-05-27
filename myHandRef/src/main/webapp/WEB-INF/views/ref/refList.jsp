<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!-- 
* 나의 냉장고 조회 화면
* 
* history :
*        최재욱, 1.0, 2017/03/26 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/26  - 초기 작성
* see : 나의 냉장고 조회 화면 (보유 식품 리스트)
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
		        var refListFrm = $("#refListFrm");
				refListFrm.action = '/refList.do';
				refListFrm.submit();
		    });
	    });
	
	    
		//페이징
		function paging(page){
			$("#currentPageNo").val(page);
			var refListFrm = $("#refListFrm");
			refListFrm.action = '/refList.do';
			refListFrm.submit();
		} 
	    
		// 나의 냉장고 조회 검색
		function refListSearch(){
			$("#currentPageNo").val(1);
			var refListFrm = $("#refListFrm");
			refListFrm.action = '/refList.do';
			refListFrm.submit();
			
			
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
						<a href="/main.do" class="logo"><strong>나의 냉장고 조회</strong></a>
						<ul class="icons">
							<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						</ul>
					</header>			

					

					<!-- Section -->
					<section style="padding-top:25px">
						<form id="refListFrm">
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
											<td style="vertical-align: middle;"><b>식품명</b></td>
											<td style="vertical-align: middle;" align="left">
												<input type="text" class="form-control" id="food_nme" name="food_nme" value="${pageSearchInfo.food_nme}" >
											</td>
											<td>
												<a onclick="javascript:refListSearch()" class="button special">검색</a>
											</td>
										</tr>
										
									</table>
								</div>
							</header>

							<div class="row"> 
								<div class="select-wrapper" style="padding-left:0px; padding-bottom:5px;">
									<select name="order_by" id="order_by" style="width:130px">
										<option value="expiration_dat" ${pageSearchInfo.order_by eq "expiration_dat" ? "selected" : ""}>유통기한 순</option>
										<option value="input_history_seq" ${pageSearchInfo.order_by eq "input_history_seq" ? "selected" : ""}>입고일자 순</option>
									</select>
								</div>
							
								<table style="text-align:center; valign:middle;">
									<colgroup>
										<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
										<col class='col-xs-1 col-sm-0 col-md-1 col-lg-1'> 
										<col class='col-xs-4 col-sm-4 col-md-4 col-lg-6'> 
										<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
										<col class='col-xs-1 col-sm-0 col-md-1 col-lg-1'> 
										<col class='col-xs-2 col-sm-3 col-md-2 col-lg-1'> 
										<col class='col-xs-2 col-sm-3 col-md-2 col-lg-1'>  
									</colgroup>	
									<tr>
										<td><b>번호</b></td>
										<td><b>이미지</b></td>
										<td><b>식품명</b></td>
										<td><b>섭취율</b></td>
										<td><b>열량</b></td>
										<td><b>유통기한</b></td>
										<td><b>입고일자</b></td>
									</tr>
									<c:forEach var="refList" items="${refList}" varStatus="status">
										<tr onclick="javascript:prodctSelectOne(${refList.input_history_seq})">
											<td style="vertical-align: middle;">${pageSearchInfo.totalRecordCount-((pageSearchInfo.currentPageNo-1)*10) - status.index}</td>
											<td style="vertical-align: middle; "><img src="${refList.food_img}" class="thumbnail" style="margin-bottom:0px; align:center;"></td>
											<td style="vertical-align: middle;">${refList.food_nme}</td>
											<td style="vertical-align: middle;">${refList.intk_rat}%</td>
											<td style="vertical-align: middle;">${refList.calorie}kcal</td>
											<td style="vertical-align: middle;">
												<c:choose>
												    <c:when test="${refList.deadLine eq 'Y'}">
												    	<font color='red'> ${refList.expiration_dat} </font>
												    </c:when>
												    <c:when test="${refList.deadLine eq 'N'}">
												    	${refList.expiration_dat}
												    </c:when>									
												    <c:otherwise>
												   		${refList.expiration_dat}
												    </c:otherwise>
												</c:choose>
											</td>
											<td style="vertical-align: middle;">${refList.input_datetime}<br>(${refList.input_cont}회)</td>
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
					</section>		
				</div>
			</div>
			
			<!-- Sidebar -->
			<c:import url="/menu.do"/>		
		</div>
	</body>
</html>