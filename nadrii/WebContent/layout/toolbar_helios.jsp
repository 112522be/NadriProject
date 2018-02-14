<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>나들이 툴바</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- Helios Templete -->
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	
	<script type="text/javascript">
	
	//========== '나들이 정보' 버튼 처리 Event ==========
	$( function() {
		$("a[href='#' ]:contains('나들이 정보')").on("click" , function() {
			self.location = "../trip/getTheme"
		});
	});

	$( function() {

		console.log("세션 정보 : ${session}")
		
		$("a[href='#' ]:contains('나들이 티켓')").bind("click" , function() {
			self.location = "/ticket/listTicket"
		});

	});


	$( function() {

        $(".glyphicon.glyphicon-envelope").bind("click" , function() {
        	//alert("쪽지함")
      		self.location = "/message/listMessage"
        });
    });
	

	//============= "장바구니" 화면이동 =============
    $( function() {
       $("a[href='#']:contains('Logout')").bind("click" , function() {
			alert("나갈거임");
	        self.location = "/user/logout";
       });
    });
	
	</script>
	
</head>

<body class="homepage">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<header>
				<h1>
					<a href="index.html" id="logo">Helios</a>
				</h1>
				<hr />
				<p>Another fine freebie by HTML5 UP</p>
				</header>
				<footer> <a href="#banner" class="button circled scrolly">Start</a>
				</footer>
			</div>

			<!-- Nav -->
			<nav id="nav">
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="#">Dropdown</a>
					<ul>
						<li><a href="#">Lorem ipsum dolor</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Etiam dolore nisl</a></li>
						<li><a href="#">And a submenu &hellip;</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Phasellus consequat</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
							</ul></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
				<li><a href="left-sidebar.html">Left Sidebar</a></li>
				<li><a href="right-sidebar.html">Right Sidebar</a></li>
				<li><a href="no-sidebar.html">No Sidebar</a></li>
			</ul>
			</nav>

		</div>

		<!-- Banner -->
		<section id="banner"> <header>
		<h2>
			Hi. You're looking at <strong>Helios</strong>.
		</h2>
		<p>
			A (free) responsive site template by <a href="http://html5up.net">HTML5
				UP</a>. Built on <strong>skel</strong> and released under the <a
				href="http://html5up.net/license">CCA</a> license.
		</p>
		</header> </section>

		<!-- Carousel -->
		<section class="carousel">
		<div class="reel">

			<article> <a href="#" class="image featured"><img
				src="images/pic01.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Pulvinar sagittis congue</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic02.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Fermentum sagittis proin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic03.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Sed quis rhoncus placerat</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic04.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Ultrices urna sit lobortis</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic05.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Varius magnis sollicitudin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic01.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Pulvinar sagittis congue</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic02.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Fermentum sagittis proin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic03.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Sed quis rhoncus placerat</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic04.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Ultrices urna sit lobortis</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

			<article> <a href="#" class="image featured"><img
				src="images/pic05.jpg" alt="" /></a> <header>
			<h3>
				<a href="#">Varius magnis sollicitudin</a>
			</h3>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
			</article>

		</div>
		</section>

		<!-- Main -->
		<div class="wrapper style2">

			<article id="main" class="container special"> <a href="#"
				class="image featured"><img src="images/pic06.jpg" alt="" /></a> <header>
			<h2>
				<a href="#">Sed massa imperdiet magnis</a>
			</h2>
			<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare
				penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis.
				Lectus malesuada sed fermentum dolore amet.</p>
			</header>
			<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae
				suspendisse mauris posuere accumsan massa posuere lacus convallis
				tellus interdum. Amet nullam fringilla nibh nulla convallis ut
				venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor
				cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia
				lobortis phasellus suscipit. Fermentum lobortis non tristique ante
				proin sociis accumsan lobortis. Auctor etiam porttitor phasellus
				tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat
				integer interdum integer purus sapien. Nibh eleifend nulla nascetur
				pharetra commodo mi augue interdum tellus. Ornare cursus augue
				feugiat sodales velit lorem. Semper elementum ullamcorper lacinia
				natoque aenean scelerisque.</p>
			<footer> <a href="#" class="button">Continue Reading</a> </footer> </article>

		</div>

		<!-- Features -->
		<div class="wrapper style1">

			<section id="features" class="container special"> <header>
			<h2>Morbi ullamcorper et varius leo lacus</h2>
			<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis
				integer semper magna.</p>
			</header>
			<div class="row">
				<article class="4u 12u(mobile) special"> <a href="#"
					class="image featured"><img src="images/pic07.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Gravida aliquam penatibus</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
				<article class="4u 12u(mobile) special"> <a href="#"
					class="image featured"><img src="images/pic08.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Sed quis rhoncus placerat</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
				<article class="4u 12u(mobile) special"> <a href="#"
					class="image featured"><img src="images/pic09.jpg" alt="" /></a> <header>
				<h3>
					<a href="#">Magna laoreet et aliquam</a>
				</h3>
				</header>
				<p>Amet nullam fringilla nibh nulla convallis tique ante proin
					sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
					cubilia ultrices tempor sagittis. Nisl fermentum consequat integer
					interdum.</p>
				</article>
			</div>
			</section>

		</div>

		<!-- Footer -->
		<div id="footer">
			<div class="container">
				<div class="row">

					<!-- Tweets -->
					<section class="4u 12u(mobile)"> <header>
					<h2 class="icon fa-twitter circled">
						<span class="label">Tweets</span>
					</h2>
					</header>
					<ul class="divided">
						<li><article class="tweet"> Amet nullam fringilla
							nibh nulla convallis tique ante sociis accumsan. <span
								class="timestamp">5 minutes ago</span> </article></li>
						<li><article class="tweet"> Hendrerit rutrum
							quisque. <span class="timestamp">30 minutes ago</span> </article></li>
						<li><article class="tweet"> Curabitur donec nulla
							massa laoreet nibh. Lorem praesent montes. <span
								class="timestamp">3 hours ago</span> </article></li>
						<li><article class="tweet"> Lacus natoque cras
							rhoncus curae dignissim ultricies. Convallis orci aliquet. <span
								class="timestamp">5 hours ago</span> </article></li>
					</ul>
					</section>

					<!-- Posts -->
					<section class="4u 12u(mobile)"> <header>
					<h2 class="icon fa-file circled">
						<span class="label">Posts</span>
					</h2>
					</header>
					<ul class="divided">
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Nisl fermentum integer</a>
							</h3>
							</header> <span class="timestamp">3 hours ago</span> </article></li>
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Phasellus portitor lorem</a>
							</h3>
							</header> <span class="timestamp">6 hours ago</span> </article></li>
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Magna tempus consequat</a>
							</h3>
							</header> <span class="timestamp">Yesterday</span> </article></li>
						<li><article class="post stub"> <header>
							<h3>
								<a href="#">Feugiat lorem ipsum</a>
							</h3>
							</header> <span class="timestamp">2 days ago</span> </article></li>
					</ul>
					</section>

					<!-- Photos -->
					<section class="4u 12u(mobile)"> <header>
					<h2 class="icon fa-camera circled">
						<span class="label">Photos</span>
					</h2>
					</header>
					<div class="row 25%">
						<div class="6u">
							<a href="#" class="image fit"><img src="images/pic10.jpg"
								alt="" /></a>
						</div>
						<div class="6u$">
							<a href="#" class="image fit"><img src="images/pic11.jpg"
								alt="" /></a>
						</div>
						<div class="6u">
							<a href="#" class="image fit"><img src="images/pic12.jpg"
								alt="" /></a>
						</div>
						<div class="6u$">
							<a href="#" class="image fit"><img src="images/pic13.jpg"
								alt="" /></a>
						</div>
						<div class="6u">
							<a href="#" class="image fit"><img src="images/pic14.jpg"
								alt="" /></a>
						</div>
						<div class="6u$">
							<a href="#" class="image fit"><img src="images/pic15.jpg"
								alt="" /></a>
						</div>
					</div>
					</section>

				</div>
				<hr />
				<div class="row">
					<div class="12u">

						<!-- Contact -->
						<section class="contact"> <header>
						<h3>Nisl turpis nascetur interdum?</h3>
						</header>
						<p>Urna nisl non quis interdum mus ornare ridiculus egestas
							ridiculus lobortis vivamus tempor aliquet.</p>
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span
									class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span
									class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span
									class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-pinterest"><span
									class="label">Pinterest</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span
									class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span
									class="label">Linkedin</span></a></li>
						</ul>
						</section>

						<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved.</li>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.onvisible.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>







































<body>
		<nav class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
							data-target="#bs-example-navbar-collapse-1" >
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                   	</button>
					<a class="navbar-brand" href="/index.jsp"><span>Na</span>drii</a>
				</div>
				<!-- navbar-header End -->

				
				
				<div class="navbar-collapse collapse ">

					<ul class="nav navbar-nav navbar-right">
					<c:if test="${ ! empty loginUser }">
							<li>
								<a href="/user/getUser?userId=${loginUser.userId}">
								<img src="/resources/images/00742106_105752.jpg" alt="..." class="img-circle" width="30px" height="30px">
								<span>
									<c:if test="${ loginUser.userName eq null }">
										${ loginUser.userId }
									</c:if>
										${ loginUser.userName }
										님
								</span>
								</a>
							</li>
							<li>
								<a href="/purchase/listBasket">
									<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" 
										data-toggle="tooltip" data-placement="bottom" title="장바구니"></span>
								</a>
							</li>
							<li>
								<a href="/purchase/listPurchase">
									<span class="glyphicon glyphicon-qrcode" aria-hidden="true" 
										data-toggle="tooltip" data-placement="bottom" title="구매한티켓"></span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"
										data-toggle="tooltip" data-placement="bottom" title="쪽지"></span>
								</a>
							</li>
							<li><a href=""><span class="glyphicon glyphicon-bell"></span></a></li>
							<li><a href="/user/logoutProc">Logout</a></li>
						</c:if>
						<c:if test="${  empty loginUser }">
							<li><a href="/user/loginView.jsp" >Login</a></li>
							<li><a href="/user/addUserView.jsp">Join</a></li>
						</c:if>
					</ul>
				</div>
			
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li><a href="#">나들이 정보</a></li>
						<li><a href="/comm/listComm">나만의 나들이</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">나들이 플래너 
								<b class=" icon-angle-down"></b>
							</a>
							<ul class="dropdown-menu">

								<li><a href="/planner/getUserPlannerList">플래너 게시판</a></li>
								<li><a href="/planner/addPlannerView">플래너 작성</a></li>
								<li><a href="/planner/getMyPlannerList">나의 플래너</a></li>
							</ul>
						</li>
						<li><a href="/ticket/listTicket">나들이 티켓</a></li>
						<li><a href="/group/listGroup">나들이모임</a></li>
					</ul>
				</div>
			<!-- Container End -->
		</nav>
		<!-- navbar End -->
</body>

</html>