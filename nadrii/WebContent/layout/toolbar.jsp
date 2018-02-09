<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>나들이 툴바</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/imperfect/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie8.css" /><![endif]-->
		
		
	</head>
	<body class="single">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="#">N A D R I I</a></h1>
						<nav class="links">
							<ul>
								<li><a href="#">HOME</a></li>
								<li><a href="#">나들이 정보</a></li>
								<li><a href="#">나만의 나들이</a></li>
								<li><a href="#">나들이 플래너</a></li>
								<li><a href="#">나들이 티켓</a></li>
								<li><a href="#">나들이 모임</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="#">
											<h1><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></h1>
											<h3>나들이 정보</h3>
											<p>어디로 나들이 갈지 미리 확인해 보세요.</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h1><span class="glyphicon glyphicon-picture" aria-hidden="true"></span></h1>
											<h3>나만의 나들이</h3>
											<p>내가 다녀온 나들이 정보를 함께 공유해요.</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h1><span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span></h1>
											<h3>나들이 플래너</h3>
											<p>이번 주말 나들이 계획을 미리 세워보자.</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h1><span class="glyphicon glyphicon-qrcode" aria-hidden="true"></span></h1>
											<h3>나들이 티켓</h3>
											<p>나들이 가기 전 미리 티켓을 예매하세요.</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h1><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h1>
											<h3>나들이 모임</h3>
											<p>우리 함께 나들이 가서 친해져 볼까?</p>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions vertical">
									<li><a href="#" class="button big fit">Log In</a></li>
								</ul>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			<script src="/resources/imperfect/assets/js/jquery.min.js"></script>
			<script src="/resources/imperfect/assets/js/skel.min.js"></script>
			<script src="/resources/imperfect/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/imperfect/assets/js/main.js"></script>

	</body>
</html>