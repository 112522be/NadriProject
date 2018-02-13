<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<title>나들이 티켓 목록</title>


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../layout/toolbar3.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


	<!-- Actions -->
	<section>
		<ul class="actions vertical">
			<li><a href="#" class="button big fit">Log In</a></li>
		</ul>
	</section>

	</section>

	<!-- Main -->
	<div id="main">

		<!-- Post -->
		<article class="post">
			<header>
				<div class="title">
					<h2>
						<a href="#">Magna sed adipiscing</a>
					</h2>
					<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
				</div>
				<div class="meta">
					<time class="published" datetime="2015-11-01">November 1,
						2015</time>
					<a href="#" class="author"><span class="name">Jane Doe</span><img
						src="/resources/imperfect/images/avatar.jpg" alt="" /></a>
				</div>
			</header>
			<a href="#" class="image featured"><img src="/resources/imperfect/images/pic01.jpg"
				alt="" /></a>
			<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
				nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor
				magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi
				non congue ullam corper. Praesent tincidunt sed tellus ut rutrum.
				Sed vitae justo condimentum, porta lectus vitae, ultricies congue
				gravida diam non fringilla.</p>
			<footer>
				<ul class="actions">
					<li><a href="#" class="button big">Continue Reading</a></li>
				</ul>
				<ul class="stats">
					<li><a href="#">General</a></li>
					<li><a href="#" class="icon fa-heart">28</a></li>
					<li><a href="#" class="icon fa-comment">128</a></li>
				</ul>
			</footer>
		</article>

		
		<!-- Scripts -->
			<script src="/resources/imperfect/assets/js/jquery.min.js"></script>
			<script src="/resources/imperfect/assets/js/skel.min.js"></script>
			<script src="/resources/imperfect/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/imperfect/assets/js/main.js"></script>
		
		
</body>

</html>