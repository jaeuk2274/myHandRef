<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
</head>
<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
							<header id="header">
								<a href="/main.do" class="logo"><strong>메인 화면 / 냉장고 부착 태블릿 초기화면  </strong></a>
								<ul class="icons">
									<li><a href="https://www.instagram.com/jaeuk2274/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
								</ul>
							</header>

							<!-- Section -->
								<div class="row">	
									<div class="12u 12u$(small)">
										<br>
										<b>내 손안의 냉장고 소개 동영상(첨부 예정) </b>
										<br>
										<iframe width="854" height="480" src="https://www.youtube.com/embed/hcastu2IIJk" frameborder="0" allowfullscreen></iframe>
<!-- 										<video width="640" height="360" controls="controls" class="video-js vjs-default-skin" data-setup="{}"> -->
<!-- 										    <source src="https://youtu.be/bOFVtgF99o8" type="video/mp4" /> -->
<!-- 										    <source src="Wildlife.ogv" type="video/ogv" /> -->
<!-- 										</video> -->
										<iframe width="854" height="480" src="https://www.youtube.com/embed/_j298rhgTIE" frameborder="0" allowfullscreen></iframe>
<!-- 										<video poster="http://placehold.it/640x360" width="640" height="360" controls="controls"> -->
<!-- 										    <source src="Kalimba.mp4" type="video/mp4" /> -->
<!-- 										    <source src="Kalimba.webm" type="video/webm" /> -->
<!-- 										</video> -->
									</div>
								</div>

						</div>
					</div>

					

					

				<!-- Sidebar -->
					<c:import url="/menu.do"/>
					
					
					
			</div>
	</body>
</html>