<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 
* 메인 화면 - 오른쪽 식품 상세보기 ajax
* 
* history :
*        최재욱, 1.0, 2017/03/06 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/06  - 초기 작성
* see : 메인 화면 - 오른쪽 식품 상세보기 ajax
//--> 
<html lang="ko">
<head>
<%-- <%@ include file="/WEB-INF/include/include-header.jspf" %> --%>

	<script src="/resources/flatpickr/dist/flatpickr.min.js"></script>
<!-- 	<script src="/resources/flatpickr/dist/flatpickr.js"></script> -->

	<script src="/resources/flatpickr/dist/l10n/ko.js"></script>
	<link rel="stylesheet" href="/resources/flatpickr/dist/themes/material_red.css">

	<script>
	 $(function() {
		 flatpickr("#input_datetime", {
				locale: "ko",
				utc: true,
// 				defaultDate: "2016-12-27  T04:24:22.585Z",
				enableTime: true,
				altFormat: "y-m-d h:i K",
			});
		 
		 flatpickr("#expiration_dat", {
			 	locale: "ko",
				utc: true,
// 				defaultDate: "2016-12-27 T04:24:22.585Z",
				enableTime: true,
			});
	});	
	 
	 
	 	// 수정 완료
	 	function update(){	
	 		var refFrm = $("#refFrm").serialize();
	 		$.ajax({
	            type : "POST",
	            url : "/prodctInfoUpdate.do", 
	            data : refFrm,     
	            success : function(data){                      
	           	 	$("#mainProdctSelectOne").html(data);
	           		 paging($("#currentPageNo").val());	
	            },
	            error:function(xhr,status,error){ 
	                alert("$");
	                alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
	            }
	        });
	 	}

	 	// 직접입력 완료
	 	function insert(){	
	 		var str = $("#food_nme").val();	
	 		if( str == '' || str == null ){
	 		    alert( '상품명을 입력해주세요' );
	 		    return false;
	 		}
			
	 		var blank_pattern = /^\s+|\s+$/g;
	 		if( str.replace( blank_pattern, '' ) == "" ){
	 		    alert('공백만 입력할 수 없습니다.');
	 		    return false;
	 		}
	 		
	 		var refFrm = $("#refFrm").serialize();
	 		
	 		$.ajax({
	            type : "POST",
	            url : "/directProdctInfoInsert.do", 
	            data : refFrm,     
	            success : function(data){                      
	           	 	$("#mainProdctSelectOne").html(data);
	           	 	paging(1);
	            },
	            error:function(xhr,status,error){ 
	                alert("$");
	                alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
	            }
	        });
	 	}
	 	
		// 수정 모드 변경
		function updateFrm(){
			$("#food_nme").attr('readonly', false);
			$("#expiration_dat").attr('readonly', false);
			$("#input_datetime").attr('readonly', false);
			$("#intk_rat").attr('disabled', false);
			$("#supplied_amount").attr('readonly', false);
			$("#calorie").prop('readonly', false);
			$("#carbohydrate").prop('readonly', false);
			$("#protein").prop('readonly', false);
			$("#fat").prop('readonly', false);
			$("#sugars").prop('readonly', false);
			$("#salt").prop('readonly', false);
			$("#cholesterol").prop('readonly', false);
			$("#saturated_fat").prop('readonly', false);
			$("#unsaturated_fat").prop('readonly', false);
		
			$("#updateBtn1").html("<a href='javascript:update()' class='button fit'>완료</a>");
			$("#updateBtn2").html("<a href='javascript:cancel()' class='button fit'>취소</a>");		
		}
		
		
		// 숫자만 입력받기
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 13) 
				return;
			else
				return false;
		}
		
		// 문자 입력되면 지우기
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 13) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
		
		// 직접등록 모드 변경
		function insertFrm(){		
			
			$("#barcdTr").html("");
			$("#food_nme").attr({ readonly : false, value : ""});
			$("#food_imgTr").html("");						
			$("#expiration_dat").attr({ readonly : false});
			$("#input_datetimeTr").html("");
			$("#intk_ratTr").remove();
			$("#supplied_amount").attr({ readonly : false, value : "0"});
			$("#calorie").attr({ readonly : false, value : "0"});
			$("#carbohydrate").attr({ readonly : false, value : "0"});
			$("#protein").attr({ readonly : false, value : "0"});
			$("#fat").attr({ readonly : false, value : "0"});
			$("#sugars").attr({ readonly : false, value : "0"});
			$("#salt").attr({ readonly : false, value : "0"});
			$("#cholesterol").attr({ readonly : false, value : "0"});
			$("#saturated_fat").attr({ readonly : false, value : "0"});
			$("#unsaturated_fat").attr({ readonly : false, value : "0"});
			$("#updateBtn1").html("<a href='javascript:insert()' class='button fit'>완료</a>");
			$("#updateBtn2").html("<a href='javascript:cancel()' class='button fit'>취소</a>");
		}

		
		// 취소
		function cancel(){
			var seq = $("#input_history_seq").val();
			// 섭취 처리 후 다시 화면 ajax Reload	
		 	var formData = "input_history_seq="+seq;
	 		$.ajax({
	            type : "POST",
	            url : "/mainProdctSelectOne.do", 
	            data : formData,     
	            success : function(data){                      
	           	 	$("#mainProdctSelectOne").html(data);
	            },
	            error:function(xhr,status,error){ 
	                alert("$");
	                alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
	            }
	        });
		}
		
	</script>
</head>
<body>
<%-- // 	<c:forEach var="tree" items="${listGroupTree}" varStatus="loop"> --%>
<%-- // 	<c:set var="nextVal" value="${listGroupTree[loop.count]}"/>  loop.count 는 1부터 시작되어 다음 객체에 count를 가지고 있습니다. --%>
<!-- // 	-- loop.index + 1 이런식도 가능하겠죠 ? -->
<%-- // 	${nextVal.UserId} 다음 for 문의 ID를 가지고 올 수 있습니다. --%>

		<br>
		<h4>식품 상세정보 / 섭취율 설정</h4>
		
		<div>
			<form name="refFrm" id="refFrm" method="POST">
				<input type="hidden" value="${refInfo.input_history_seq}" id="input_history_seq" name="input_history_seq">
				<table style="text-align:center; valign:middle" >
					<colgroup>
						<col class="col-md-3 col-xs-3"/>   
						<col class="col-md-3 col-xs-3"/> 
						<col class="col-md-3 col-xs-3"/> 
						<col class="col-md-3 col-xs-3"/>        
					</colgroup>
					<tr id="barcdTr" >
						<td style="vertical-align: middle;"><b>바코드</b></td>
						<td id="barcdTd" colspan="3"><input type="text" class="form-control" name="barcd" id="barcd" value="${refInfo.barcd}" readonly></td>

					</tr>
					<tr>
						<td style="vertical-align: middle;"><b>상품명</b></td>
						<td colspan="3"><input type="text" class="form-control" name="food_nme" id="food_nme" value="${refInfo.food_nme}" readonly></td>
					</tr>
					<tr id="food_imgTr">
						<td style="vertical-align:middle;"><b>이미지</b></td>
						<td colspan="3" style="word-break:break-all">
							<div class="text-center">
								<img src="${refInfo.food_img}" style="width:50%; height:150px">
							</div> 
						</td>
					</tr>
					
					<tr>
						<td style="vertical-align: middle;"><b>유통기한</b></td>
						<td colspan="3" id="expiration_datTd">
						<input type="text" class="form-control" id="expiration_dat" name="expiration_dat" value="${refInfo.expiration_dat}" readonly>
						</td>
					</tr>
					<tr id="input_datetimeTr">
						<td style="vertical-align: middle;"><b>입고일자</b></td>
						<td colspan="3">
						<input type="text" class="form-control" id="input_datetime" name="input_datetime" value="${refInfo.input_datetime}" readonly></td>
					</tr>


					<tr id="intk_ratTr">
						<td style="vertical-align: middle;"><b>섭취율(%)</b></td>
						<td id="intk_ratTd" colspan="3">
							<div class="select-wrapper">
								<select name="intk_rat" id="intk_rat" disabled>
									<c:set var="sum" value="${refInfo.intk_rat}"/>
									<c:forEach var="i" begin="${refInfo.intk_rat}" end="100" step="10">
										<option value="${sum}">${sum}</option>
										<c:set var="sum" value="${sum + 10}"/></c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle;"><b>1회제공량(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="supplied_amount" name="supplied_amount" value="${refInfo.supplied_amount}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'"></td>
						<td style="vertical-align: middle;"><b>열량(kcal)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="calorie" name="calorie" value="${refInfo.calorie}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td style="vertical-align: middle;"><b>탄수화물(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="carbohydrate" name="carbohydrate" value="${refInfo.carbohydrate}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
						<td style="vertical-align: middle;"><b>단백질(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="protein" name="protein" value="${refInfo.protein}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>	
						<td style="vertical-align: middle;"><b>지방(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="fat" name="fat" value="${refInfo.fat}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
						<td style="vertical-align: middle;"><b>당류(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="sugars" name="sugars" value="${refInfo.sugars}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>	
						<td style="vertical-align: middle;"><b>나트륨(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="salt" name="salt" value="${refInfo.salt}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
						<td style="vertical-align: middle;"><b>콜레스테롤(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="cholesterol" name="cholesterol" value="${refInfo.cholesterol}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>	
						<td style="vertical-align: middle;"><b>포화지방산(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="saturated_fat" name="saturated_fat" value="${refInfo.saturated_fat}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
						<td style="vertical-align: middle;"><b>트랜스지방산(g)</b></td>
						<td><input type="text" readonly="readonly" class="form-control" id="unsaturated_fat" name="unsaturated_fat" value="${refInfo.unsaturated_fat}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
				</table>
				
				
			</form>
		</div>	
<!-- 		<div class="text-center"> -->
			<div>
				
				<ul class="actions fit">
					<li id="updateBtn1"><a href="javascript:insertFrm()" class="button fit">직접등록</a></li>	
					<li id="updateBtn2"><a href="javascript:updateFrm()" class="button special fit">수정</a></li>
				</ul>
			</div>
<!-- 		</div> -->

	</body>
</html>