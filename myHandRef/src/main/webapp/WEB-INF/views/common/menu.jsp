<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!-- 
* 사이드 메뉴
* 
* history :
*        최재욱, 1.0, 2017/03/06 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/06  - 초기 작성
* see : 사이드 메뉴
//--> 
<html>
	<head>
		<%@ include file="/WEB-INF/include/include-header.jspf" %>
	
		
		<script>
			// 로그인
			function login(){
				var loginFrm = $("#loginFrm").serialize();
				$.ajax({
					type:"POST",
					url: "/memLogin.do", // 회원 로그인
					data: loginFrm,
					success:function(memLoginInfo){
						if(memLoginInfo == 0){
							alert("ID와 pw를 다시 확인해주세요.");
						}
						else{
							$("#loginFrm").html(""
								+ 	"<form method='post' action='#' style='padding-bottom:20px; margin-bottom:22px'>"
								+ 		"<div class='row uniform'>"
								+ 			"<div class='12u 12u$(xsmall)' align='center'>"
								+ 				"<h3><strong>"+memLoginInfo.mem_nme+"</strong>님 환영합니다.<br><font style='font-size:15px; color:gray;'>("+memLoginInfo.refrigerator_nme+")<font></h3>"
								+ 			"</div>"
								+ 			"<div>"
								+ 				"<ul class='actions fit'>"
								+ 					"<li><a onclick='logout()' class='button special fit'>LogOut</a></li>"
								+ 				"</ul>"
								+ 			"</div>"
								+ 		"</div>"
								+ 	"</form>"
								+	"").create();					
						}
					},
				    error:function(xhr,status,error)
				    { //ajax 오류인경우  
				    	alert("잘못된 입력입니다.");
			            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
			   		}
				});
			}
			
			// 로그아웃
			function logout(){
				location.href="/memLogout.do";
				alert("로그아웃 하였습니다.");
			}
			
			// 메뉴바 검색
			function refList(){
				alert("1");
				location.href="/refList.do?food_nme="+$("#nme").val();

			}
		</script>



	</head>
	<body>

		<!-- Sidebar -->
			<div id="sidebar">
				<div class="inner">
					<c:if test="${memLoginInfo == null}">
						<!-- 로그인 form -->
						<form id="loginFrm" method="post" action="#" style="padding-bottom:20px; margin-bottom:22px">
							<div class="row uniform">
								<div class="6u 12u$(xsmall)">
									<input type="text" name="mem_id" id="mem_id" placeholder="Id" />
								</div>
								<div class="6u$ 12u$(xsmall)">
									<input type="password" name="mem_pw" id="mem_pw" placeholder="Password" />
								</div>
								<div>
									<ul class="actions fit">
										<li><a onclick="login()" class="button special fit">Login</a></li>	
									</ul>
								</div>
							</div>
						</form>
					</c:if>
					<c:if test="${memLoginInfo != null}">
						<form id="logoutFrm" method="post" action="#" style="padding-bottom:20px; margin-bottom:22px">
							<div class="row uniform">
								<div class="12u 12u$(xsmall)" align="center">
									<h3><strong>${memLoginInfo.mem_nme}</strong>님 환영합니다.<br><font style="font-size:15px; color:gray; ">(${memLoginInfo.refrigerator_nme})</font></h3>
								</div>
								<div>
									<ul class="actions fit">
										<li><a onclick="logout()" class="button special fit">LogOut</a></li>	
									</ul>
								</div>
							</div>
						</form>
				
					</c:if>
						<section id="search" class="alt">
							<form id="search" name="search" method="post" action="javascript:refList()">
								<input type="text" name="nme" id="nme" placeholder="Search" />
							</form>
						</section>

					<!-- Menu -->
						<nav id="menu">
							<header class="major">
								<h2>Menu</h2>
							</header>
							<ul>
								<li><a href="/main.do">메인화면</a></li>
								<li><a href="/refList.do">나의 냉장고 조회</a></li>
								<li><a href="/barcdList.do">바코드 관리</a></li>
<!-- 								<li><a href="/recipeList.do">레시피 조회</a></li> -->
								<li>
									<span class="opener">분석 조회</span>
									<ul>
										<li><a href="/todayAnal.do">투데이 분석</a></li>
										<li><a href="/nutAnal.do">영양성분 분석</a></li>
										<li><a href="/patternAnal.do">생활패턴 분석</a></li>
										<li><a href="/fmyAnal.do">가족구성원 분석</a></li>
									</ul>
								</li>
<!-- 								<li><a href="/elements.do">입고 내역 조회</a></li>										 -->
							</ul>
						</nav>

				
					<!-- Section -->
						<section>
							<header class="major">
								<h2>Get in touch</h2>
							</header>
							<p>최 재 욱 (Jaeuk Choi) <br>4학년 컴퓨터공학, 경영정보 복수전공 학생 <br>2학년부터 S/W 개발 동아리 활동.</p>
							<ul class="contact">
								<li class="fa-envelope-o">
								<a href="mailto:jaeuk2274@gmail.com?cc=jw2274@naver.com&bcc=jeawook2274@gmail.com&subject=[homepage 유입]&body=[homepage 유입]">
								jaeuk2274@gmail.com</a></li>
								<li class="fa-phone">(Hp) 010-6800-2274 <br>(Home) 054-221-2274</li>
								<li class="fa-home">(Home) 경북 포항시 남구 지곡동 그린아파트 239동 701호 
											<br/> (Office) 대구 달서구 신당동 1804-9 5층
								</li>
							</ul>
						</section>

					<!-- Footer -->
						<footer id="footer">
							<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
						</footer>
				</div>
			</div>

		<!-- Scripts -->
			<script src="/resources/editorial/assets/js/skel.min.js"></script>
			<script src="/resources/editorial/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/editorial/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/editorial/assets/js/main.js"></script>

			

	</body>
</html>