<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 
* 메인 화면 - 왼쪽 식품 리스트 ajax
* 
* history :
*        최재욱, 1.0, 2017/03/06 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/06  - 초기 작성
* see : 메인 화면 - 왼쪽 식품 리스트 ajax
//--> 
<html lang="ko">
<head>
<%-- 	<%@ include file="/WEB-INF/include/include-header.jspf" %> --%>
	<script>
	var popWin;
	// 바코드 인식으로 상품 등록
	function prodctInsert(){
		var barcdFrm = $("#barcdFrm").serialize();
		$.ajax({
			type: "POST",
			url : "/barcdInfoSelect.do", // 이 바코드 데이터가 존재하는지 확인
			data: barcdFrm,
			success:function(barcdInfo){
				if(barcdInfo == 0){
					alert("등록되지 않은 바코드 번호입니다.");
				}
				else{
					var wheather = confirm(barcdInfo.food_nme + " 상품을 등록하시겠습니까?");
					if(wheather == true){
						barcdFrm = barcdFrm + "&avg_expiration_dat="+barcdInfo.avg_expiration_dat;
						$.ajax({
							type: "POST",
							url : "/prodctInsert.do", // 조회된 바코드 데이터 insert
							data: barcdFrm,
							success:function(data){
								$("#mainProdctSelectList").html(data);
								$('#barcd').focus();
							},
						    error:function(xhr,status,error)
						    { //ajax 오류인경우  
						    	alert("잘못된 입력입니다.");
					            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
					   		}
						});
					}
				}
			},
		    error:function(xhr,status,error)
		    { //ajax 오류인경우  
		    	alert("잘못된 입력입니다.");
	            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
	   		}
		});
	}
	// 식품 상세조회
	function prodctSelectOne(seq){
// 		var formData = "refChkGroup="+refChkGroup + "&currentPageNo="+$("#currentPageNo").val();
		var formData = "input_history_seq="+seq;
		$.ajax({
			type: "POST",
			url : "/mainProdctSelectOne.do", 
			data: formData,
			success:function(data){
				$("#mainProdctSelectOne").html(data);
			},
		    error:function(xhr,status,error)
		    { //ajax 오류인경우  
		    	alert("잘못된 입력입니다.");
	            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
	   		}
		});
	}
	
	 // 메인 체크박스 전체선택, 해제
	 $(function(){
         $("#mainChk_all").click(function(){
             var chk = $(this).is(":checked");//.attr('checked');
             if(chk) $("input:checkbox[name='mainChk']").prop("checked", true);
             else  $("input:checkbox[name='mainChk']").prop("checked", false);
         });
     });

	 // 버림 
     function reject() {
    	 var refChkGroup=[];
         //체크박스 중 체크된 체크박스만 가져와서 Loop
         $("input:checkbox[name=mainChk]:checked").each(function(i,elements){
        	 refChkGroup.push($(this).val());
         });
         if(refChkGroup.length==0){
             alert("1개 이상 체크해주세요.");
             return;
         }
 		 var formData = "refChkGroup="+refChkGroup + "&currentPageNo="+$("#currentPageNo").val();
         var wheather = confirm(refChkGroup.length+"개 식품을 버리셨습니까?");
		 if(wheather == true){
			 $.ajax({
	             type : "POST",
	             url : "/prodctDelete.do", 
	             data : formData,     
	             success : function(data){                      
	            	 $("#mainProdctSelectList").html(data);
	             },
	             error:function(xhr,status,error){ 
	                 alert("$");
	                 alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
	             }
	         });
		 }
		 else {
			 return;
		 }		 
     }
	 
 	 // 섭취
     function intake() {
         var refChkGroup=[];
         //체크박스 중 체크된 체크박스만 가져와서 Loop
         $("input:checkbox[name=mainChk]:checked").each(function(i,elements){
        	 refChkGroup.push($(this).val());
         });
         if(refChkGroup.length==0){
             alert("1개 이상 체크해주세요.");
             return;
         }
         intkPopup(refChkGroup);		 
     }
	
 	 
 	 // 섭취량, 구성원 선택 팝업
     function intkPopup(refChkGroup) {
			var defH, defW, sTop, sLeft, url;
			defW = 500;
			defH = 220;
			sTop = (screen.height - defH)/2;
			sLeft= (screen.width  - defW)/2;
			url = "/intkPopup.do?refChkGroup="+refChkGroup;
			popWin = window.open(url, "섭취량, 가족 구성원 선택", "width="+defW+", height="+defH+", top="+sTop+",left="+sLeft+", scrollbars=yes, marginwidth=0, marginheight=0");
			popWin.focus();
		};
		
		
	 // 섭취 처리 후 다시 화면 ajax Reload	
 	 function fun(){
 		var barcdFrm = $("#barcdFrm").serialize();
 		$.ajax({
            type : "POST",
            url : "/mainProdctSelectList.do", 
            data : barcdFrm,     
            success : function(data){                      
           	 	$("#mainProdctSelectList").html(data);
            },
            error:function(xhr,status,error){ 
                alert("$");
                alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
            }
        });
 	 }
 	 
	 
	//페이징
	function paging(page){
		$("#currentPageNo").val(page);
		var barcdFrm = $("#barcdFrm").serialize();	
		$.ajax({
			type:"POST",
			url: "/mainProdctSelectList.do", // 테이블 조회
			data: barcdFrm ,
			success:function(msg){
				$("#mainProdctSelectList").html(msg);	
				
			},
		    error:function(xhr,status,error)
		    { //ajax 오류인경우  
		    	alert("$");
	            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
	   		}
		});
	}
 	 
	</script>
</head>
<body>

				<br>
				<section id="" class="alt">
					<form id="barcdFrm" method="post" action="javascript:prodctInsert();">
						<input type="text" name="barcd" id="barcd" placeholder="바코드 인식" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pageSearchInfo.currentPageNo}"> <!-- 현재 페이지 -->  
					</form>
				</section>
			
				
				<!-- Table -->
				<h4>보유 식품 리스트</h4>
				<div>
					<form name="" method="POST" id="">
						<table style="text-align:center">
							<colgroup>
								<col class='col-xs-1 col-sm-1 col-md-1 col-lg-1'> 
								<col class='col-xs-5 col-sm-6 col-md-6 col-lg-5' > 
								<col class='col-xs-3 col-sm-5 col-md-5 col-lg-3'> 
<%-- 								<col class='col-lg-3'>  --%>
							</colgroup>
							<tr>
								<td style="padding-right:0px;" class='col-xs-1 col-sm-1 col-md-1 col-lg-1'>
									<input type="checkbox" id="mainChk_all" name="mainChk_all">
									<label for="mainChk_all"></label>
								</td>
								<td class='col-xs-5 col-sm-6 col-md-6 col-lg-5'><strong>식품명</strong></td>
								<td class='col-xs-3 col-sm-5 col-md-5 col-lg-3'><strong>유통기한</strong></td>
<!-- 								<td class='       		   			   col-lg-3'><strong>입고일</strong></td> -->
							</tr>
							<c:forEach var="refList" items="${refList}" varStatus="status">
								<tr>
									<td style="padding-right:0px;">
										<input type="checkbox" id="mainChk[${status.index}]" name="mainChk" value="${refList.input_history_seq}">
										<label for="mainChk[${status.index}]"></label>
									</td>
									<td onclick="javascript:prodctSelectOne(${refList.input_history_seq})">${refList.food_nme}</td>
									<td onclick="javascript:prodctSelectOne(${refList.input_history_seq})">
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
<%-- 									<td onclick="javascript:prodctSelectOne(${refList.input_history_seq})">${refList.input_datetime}</td>						 --%>
								</tr>
							</c:forEach>
							
						</table>
					</form>

				</div>	
					<!-- 페이지 -->
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
			<div>
				<ul class="actions fit">
					<li><a href="javascript:reject()" class="button fit">버림</a></li>	
					<li><a href="javascript:intake()" class="button special fit">섭취</a></li>
				</ul>

			</div>	
	</body>
</html>