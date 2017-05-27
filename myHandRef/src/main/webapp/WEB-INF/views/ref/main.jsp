<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
* 메인 화면
* 
* history :
*        최재욱, 1.0, 2017/03/06 – 초기 작성
* author : 최재욱
* version : 1.0, 2017/03/06  - 초기 작성
* see : 메인 화면
//--> 
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

	<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<div id="main">
				<div class="inner">

					<!-- Header -->
					<header id="header">
						<a href="/main.do" class="logo"><strong>메인 화면 </strong></a>
						<ul class="icons">
							<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						</ul>
					</header>

					<!-- Section -->
					<section style="padding-top:0px">
						<div class="row">
							<div id="mainProdctSelectList" class="6u 12u$(small)">
								<c:import url="/mainProdctSelectList.do"/>
							</div>
							
							<div id="mainProdctSelectOne" class="6u$ 12u$(small)">
								<c:import url="/mainProdctSelectOne.do"/>

							</div>
						</div>
					</section>
				</div>
			</div>

			<!-- Sidebar -->
			<c:import url="/menu.do"/>

		</div>
</body>
</html>