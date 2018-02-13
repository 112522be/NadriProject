<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<title>나들이 티켓 목록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ///////////////////////// imperfect templete ////////////////////////// -->
<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/imperfect/assets/css/main2.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie8.css" /><![endif]-->


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">
	function fncGetList(pageNo) {
		$("#pageNo").val(pageNo);
		$("form").attr("method", "POST").attr("action", "/ticket/listTicket")
				.submit();

	}

	//=================== "4 kind of sorting" Event 연결 =================== 
	$(function() {

		$("a[href='#']:contains('제목순')").bind("click", function(event) {
			//			alert("제목순")
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=A";
		})
	});

	$(function() {
		$("a[href='#']:contains('조회순')").bind("click", function(event) {
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=B";
		})
	});

	$(function() {
		$("a[href='#']:contains('수정일순')").bind("click", function(event) {
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=C";
		})
	});

	$(function() {

		$("a[href='#']:contains('생성일순')").bind("click", function(event) {
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=D";
		})
	});

	function fncGetTicketSort(searchCondition) {

		alert("[value check] ==> " + searchCondition)

		self.location = "/ticket/listTicket"

	}

	//=================== "상세조회" Event 연결 ===================
	$(function() {
		$("a[href='#' ]:contains('상세조회')").bind(
				"click",
				function(event) {
//					alert("상세조회")

					event.preventDefault();

					var contentId = $(
							$('input[name="contentId"]')[$(".button.small.fit").index(this)]).val();
					var contentTypeId = $(
							$('input[name="contentTypeId"]')[$(".button.small.fit").index(this)]).val();
					var title = $(
							$('input[name="title"]')[$(".button.small.fit").index(this)]).val();
					var encodeTitle = encodeURI(encodeURIComponent(title));
					
					console.log('contentId : ' + contentId)
					console.log('contentTypeId : ' + contentTypeId)
					console.log('title : ' + title)
					console.log('encodeTitle : ' + encodeTitle)

					self.location = "/ticket/getTicket?" + "contentId="
							+ contentId + "&contentTypeId=" + contentTypeId
							+ "&title=" + encodeTitle;

				});
	});

	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/getTicket")
				.submit();
	}
</script>

</head>

<body>

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
											<h3>Lorem ipsum</h3>
											<p>Feugiat tempus veroeros dolor</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Dolor sit amet</h3>
											<p>Sed vitae justo condimentum</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Feugiat veroeros</h3>
											<p>Phasellus sed ultricies mi congue</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Etiam sed consequat</h3>
											<p>Porta lectus amet ultricies</p>
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

				<!-- Main -->
					<div id="main">
						<!-- Post -->
						<p>현재 ${ resultPage.pageNo } 페이지 / 전체 ${ resultPage.totalCount } 건</p>
						
							<c:forEach var="tt" items="${tourTicket}" begin="0" end="2" varStatus="num">
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">${ tt.title }</a></h2>
										<p>기&nbsp;간 : ${ tt.eventstartdate } ~ ${ tt.eventenddate }</p>
									</div>
									<div class="meta">
										<time class="published" datetime="">
											조회수 : ${ tt.readcount }</time>
										<a href="#" class="author">
											<span class="name">NO. ${ num.count }</span>
											<img src="/resources/imperfect/images/avatar.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="${ tt.firstimage }" alt="" /></a>
								<p>간략 소개 정보.</p>
								<footer>
									<ul class="actions">
										<li><a href="#" class="button big">상세조회</a></li>
									</ul>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">28</a></li>
										<li><a href="#" class="icon fa-comment">128</a></li>
									</ul>
								</footer>
							</article>
							</c:forEach>
							
						<!-- Pagination -->
							<ul class="actions pagination">
								<li><a href="" class="disabled button big previous">Previous Page</a></li>
								<li><a href="#" class="button big next">Next Page</a></li>
							</ul>

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a href="#" class="logo">
									<img src="/resources/imperfect/images/logo.jpg" alt="" /></a>
								<header>
									<h2>나들이 티켓</h2>
									<p>조회하실 <strong>티켓 정보</strong>를 선택해 주세요.</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<div class="mini-posts">

									<!-- Mini Post -->
									
										<c:forEach var="tt" items="${tourTicket}" begin="3" end="6" varStatus="num">
										<article class="mini-post">
											<header>
												<h3><a href="#">
													${ tt.title }
												</a></h3>
												<time class="published" datetime="">조회수 : ${ tt.readcount }</time>
												<a href="#" class="author">
													<span class="name">NO. ${ num.count + 3 }</span>
													<img src="/resources/imperfect/images/avatar.jpg" alt="" />
												</a>
											</header>
											<a href="#" class="image">
												<img src="${ tt.firstimage }" alt="" />
											</a>
										</article>
										</c:forEach>


								</div>
							</section>

						<!-- Posts List -->
							<section>
								<ul class="posts">
										<c:forEach var="tt" items="${tourTicket}" begin="7" end="12" varStatus="num">
									<li>
										<article>
											<header>
												<h3><a href="#">${ tt.title }</a></h3>
												<time class="published" datetime="">조회수 : ${ tt.readcount }</time>
											</header>
											<a href="#" class="image"><img src="${ tt.firstimage }" alt="" /></a>
										</article>
									</li>
										</c:forEach>
								</ul>
							</section>

						<!-- About -->
							<section class="blurb">
								<h2>About</h2>
								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</section>

						<!-- Footer -->
							<section id="footer">
								<ul class="icons">
									<li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
								</ul>
								<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
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

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div id="main">

				<div class="page-header text-right">
					<h3>나들이 티켓</h3>
					<h5 class="text-muted">
						조회하실 티켓 정보를 <strong class="text-danger">선택</strong>해 주세요.
					</h5>
				</div>

				<!-- form Start /////////////////////////////////////-->
				<form class="form-horizontal">

				<ul class="actions fit">
					<li><a href="#" class="button fit">제목순</a></li>
					<li><a href="#" class="button fit">조회순</a></li>
					<li><a href="#" class="button fit">수정일순</a></li>
					<li><a href="#" class="button fit">생성일순</a></li>
				</ul>



				<div class="col-md-12 text-right">
						<p class="text-primary">&lt; 현재 ${ resultPage.pageNo } 페이지 /
							전체 ${ resultPage.totalCount } 건수 &gt;</p>
					</div>

					<hr />
					<section>
						<div class="row uniform">
							<c:forEach var="tt" items="${tourTicket}" varStatus="num">
								<div class="col-sm-3">
									<!-- Mini Posts -->
									<section>
										<div class="mini-posts">

											<!-- Mini Post -->
											<article class="mini-post">
												<header>
													<h4>${ num.count }.</h4>

													<time class="published" datetime=""> 기&nbsp;간 : ${ tt.eventstartdate }
														~ ${ tt.eventenddate } </time>
													<a href="#" class="author">
														<img src="/resources/imperfect/images/pic08.jpg" alt="" /></a>
													<ul class="actions vertical small">
														<li><a href="#" class="button small fit">상세조회</a></li>
													</ul>

												</header>
												<p class="text-right">조회수 : ${ tt.readcount }&nbsp;&nbsp;</p>
												<a href="#" class="image"> 
													<img src="${ tt.firstimage }" alt="" />
												</a>

											</article>
										</div>
									</section>
								</div>

								<!-- PageNavigation을 위한 값을 보내는 부분  -->
								<input type="hidden" name="contentId" value="${ tt.contentid }">
								<input type="hidden" name="contentTypeId" value="${ tt.contenttypeid }">
								<input type="hidden" name="title" value="${ tt.title }">
								<input type="hidden" name="eventstartdate" value="${ tt.eventstartdate }">
								<input type="hidden" name="eventenddate" value="${ tt.eventenddate }">

							</c:forEach>
						</div>
					</section>

					<hr />
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="pageNo" name="pageNo" value="" /> 
					<input type="hidden" name="searchCondition" id="searchCondition" value="">

				</form>
				<!-- form End /////////////////////////////////////-->

			</div>
			<!--  화면구성 div End /////////////////////////////////////-->
	</div>



	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_openApi.jsp" />
	<!-- PageNavigation End... -->

	
</body>

</html>