<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>

<html>

	<head>
		<title>Helios by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script src="/resources/js/tripLocation.js"></script>
		
		<style>
			#header{
			background-image: url(/resources/images/tripIcon/knocker-2163643_1920.jpg);
			background-color: #3a2748;
			}
			
			#nav{
			background-color: #3b2b48;
			opacity: 0.7;
			}
 
		</style>
		
	</head>
	<body class="homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					
						<jsp:include page="/layout/inner.jsp" />
				 		 	

						<jsp:include page="/layout/toolbar.jsp" />

				</div>

			<!-- Banner -->
				<section id="banner">
					<header>
						<h2>Hi. You're looking at <strong>Helios</strong>.</h2>
						<p>
							A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.
							Built on <strong>skel</strong> and released under the <a href="http://html5up.net/license">CCA</a> license.
						</p>
					</header>
				</section>

			<!-- Carousel -->
				<section class="carousel">
					<div class="reel">

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/racing-442393_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 정보</a></h3>
							</header>
							<p>어디로 갈까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/calendar-3073971_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 플래너</a></h3>
							</header>
							<p>계획을 짜볼까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/notebook-1803664_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나만의 나들이</a></h3>
							</header>
							<p>자랑해볼까?</p>
						</article>

						<article>
							<a href="/ticket/listTicket" class="image featured"><img src="/resources/images/tripIcon/admission-2974645_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 티켓</a></h3>
							</header>
							<p>입장권을 사볼까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/pinky-swear-329329_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 모임</a></h3>
							</header>
							<p>누구와 갈까?</p>
						</article>

					</div>
				</section>

			<!-- Main -->
				<div class="wrapper style2">

					<article id="main" class="container special">
						<a href="#" class="image featured"><img src="/resources/helios/images/pic06.jpg" alt="" /></a>
						<header>
							<h2><a href="#">Sed massa imperdiet magnis</a></h2>
							<p>
								Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim
								pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.
							</p>
						</header>
						<p>
							Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa
							posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus
							sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam
							mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan
							lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue
							interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia
							natoque aenean scelerisque.
						</p>
						<footer>
							<a href="#" class="button">Continue Reading</a>
						</footer>
					</article>

				</div>

			
		</div>

		<!-- Scripts -->
			<script src="/resources/helios/assets/js/jquery.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/helios/assets/js/main.js"></script>

	</body>
</html>