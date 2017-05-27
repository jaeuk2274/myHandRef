<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!-- 
* 메인 화면 - 식품 섭취 시 팝업화면
* 
* history :
*        최재욱, 1.0, 2017/03/06 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/06  - 초기 작성
* see : 메인 화면 - 식품 섭취 시 팝업화면
//--> 
<!DOCTYPE HTML>
<html>
	<head>
		<%@ include file="/WEB-INF/include/include-header.jspf" %>
		
		
	<script>
		// 취소
		function cancel(){
			window.close();
		}
		
		// 섭취
		function intake(){
			var refChkGroup=[];
			refChkGroup = ${refValueObject.refChkGroup};
			var fmyCheckGroup=[];
	        //체크박스 중 체크된 체크박스만 가져와서 Loop
	        $("input:checkbox[name=fmyChk]:checked").each(function(i,elements){
	        	fmyCheckGroup.push($(this).val());
	        });
	        if(fmyCheckGroup.length==0){
	            alert("섭취자를 체크해주세요.");
	            return;
	        }    
// 	        alert("가족구성원 : "+fmyCheckGroup);
	       	var intk_rat = $("#intk_rat").val();
// 	       	alert("섭취율 : " + intk_rat);
	       	var formData = "refChkGroup="+refChkGroup + "&fmyCheckGroup="+fmyCheckGroup + "&intk_rat="+intk_rat;

			$.ajax({
	            type : "POST",
	            url : "/prodctIntk.do", 
	            data : formData,     
	            success : function(){      
	            	window.close();
	            	$(opener.location).attr("href","javascript:fun();"); //jQuery 이용
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
		<div style="padding-top:20px">
			<table style="text-align:center; valign:middle" >
				<tr>
					<td style="vertical-align: middle;"><b>섭취율(%)</b></td>
					<td colspan="3">
						<div class="select-wrapper">
							<select name="intk_rat" id="intk_rat">
								<option value="100">100</option>
								<option value="90">90</option>
								<option value="80">80</option>
								<option value="70">70</option>
								<option value="60">60</option>
								<option value="50">50</option>
								<option value="40">40</option>
								<option value="30">30</option>
								<option value="20">20</option>
								<option value="10">10</option>
							</select>
						</div>
					</td>
				</tr>
				<tr style="vertical-align: middle; height:50px">
					<td style="vertical-align: middle;"><b>섭취자</b></td>
					<td colspan="3" style="padding-bottom:0px; padding-top:15px; padding-left:0px">
						<c:forEach var="fmyMemList" items="${fmyMemList}" varStatus="status">
							<input type="checkbox" id="fmyMem${fmyMemList.mem_seq}" name="fmyChk" value="${fmyMemList.mem_seq}" ${refValueObject.mem_seq == fmyMemList.mem_seq ? "checked" : ""}>
							<label for="fmyMem${fmyMemList.mem_seq}">${fmyMemList.mem_nme}</label>
						</c:forEach>
					</td>
				</tr>
			</table>
			
			<div style="padding-bottom:0px" class="container">
				<ul class="actions fit">
					<li><a href="javascript:intake()" class="button fit">섭취</a></li>	
					<li><a href="javascript:cancel()" class="button special fit">취소</a></li>
				</ul>
			</div>		
		</div>		
	</body>
</html>