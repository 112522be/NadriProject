<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>No Sidebar - Helios by HTML5 UP</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
		
		<!-- Latest compiled and minified CSS 
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		
		<!-- Optional theme 
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
				
		<!-- Latest compiled and minified JavaScript
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
		 -->
		
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

	<!-- Optional theme -->
	<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> -->

	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->

	<!-- Scripts -->
	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
		
		
		
		
		
		
		<script type="text/javascript">
		$(function(){
			$("a#modify").bind("click", function(){
				self.location="/comm/updateCommView?postNo=${community.postNo}";
			});
			
			$("a#delete").bind("click", function(){
				if(confirm("삭제하시겠습니까?")==true){
					self.location="/comm/deleteComm?postNo=${community.postNo}";
					alert("삭제되었습니다.");
				}else{
					return;	
				}		
			});
			
			$( function() {
			    $( "#accordion" ).accordion({
			      collapsible: true
			    });
			} );
		});

		function clickProfile(){
			alert('${group.join.userId}');
		}

		function clickMessage(){	
			window.open("/message/addMessage?recevierId="+'${group.join.userId}',"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
		}

		function addLike(){
			
			$.ajax({
				url: "../like/json/addLike/"+groupNo,
				method: "POST",
				dataType: "json",
				success:function(returnData){
					getCountLike();
				}
			});	
			
		}

		var likeCount;

		function getCountLike(){
			
			$.ajax({
				url: "../like/json/getCountLike/"+groupNo,
				method: "POST",
				dataType: "json",
				success:function(returnData){
					
					likeCount = returnData.totalCount;

				}
			});	
		}

		$(function(){
			$(".like").bind("click", function(){
				alert(1);
			});
		});
		</script>
		
		<!-- <style type="text/css">
			.btn.btn-default{
				background-color: lightgray;
				width: auto;
				height: auto;
				padding: 10px;
			}
			img{
				max-width: 700;
				height: auto;
			}
			hr{
				top: 2em;
				margin-bottom: 4em;
			}
			input.form-control{
				margin: 1px;
			}
		</style> -->
		
	</head>
	
	<body class="no-sidebar">
		<div id="page-wrapper">
			<input type="hidden" name="postNo" value="${community.postNo}">
			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
							</header>
						</div>
					
							<jsp:include page="/layout/toolbar.jsp" />

					</div>

			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<article id="main" class="special">
							<header>
								<h2><a href="#">${community.title}</a></h2>
							</header>
							
							<div class="row 25% no-collapse">
								<div class="4u">
									<h3 class="icon fa-user text-left">&nbsp;&nbsp;${community.userId}</h3>
								</div>
								<div class="4u">
									<h3 class="icon fa-mouse-pointer text-right">&nbsp;&nbsp;${community.viewCount}</h3>
								</div>
								<div class="4u">
									<h3 class="icon fa-history text-right">&nbsp;&nbsp;${community.regDate}</h3>
								</div>
							</div>
							
							<p>
								${community.text} 
							</p>
							<c:if test="${community.userId == loginUser.userId}">
							<div class="row 25% no-collapse">
								<div class="5u">
									<h3 id="modify" class="text-right"><span class="glyphicon glyphicon-wrench"></span>&nbsp;&nbsp;수 정</h3>
								</div>
								<div class="2u">
								</div>
								<div class="5u">
									<h3 id="delete" class="text-left"><span class="glyphicon glyphicon-erase"></span>&nbsp;&nbsp;삭 제</h3>
								</div>
							</div>
							</c:if>
							
						   <div class="row 25% no-collapse">
								<div class="6u">
									<h3 class="text-left">
										<img alt="" src="/resources/images/hashtag.png" width="30" height="30">&nbsp;&nbsp;<span style="font-size: 11pt;">${community.hashtag}</span>
									</h3>
								</div>
								<div class="3u">
									<h3><input type="hidden" name="postNo" value="${community.postNo}"></h3>
								</div>
								<div class="3u">
									<h3><jsp:include page="../common/like.jsp"></jsp:include></h3>
								</div>
							</div>
							
							<jsp:include page="../common/comment.jsp"></jsp:include>
							
							<section>
								<header>
									<h3>Ultrices tempor sagittis nisl</h3>
								</header>
								<p class="text-left">
									<img alt="" src="/resources/images/hashtag.png" width="30" height="30">&nbsp;&nbsp;<span style="font-size: 11pt;">${community.hashtag}</span>
								</p>
								<p>
									Eleifend auctor turpis magnis sed porta nisl pretium. Aenean suspendisse nulla eget sed etiam parturient
									orci cursus nibh. Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim cras rutrum consectetur
									ut penatibus fermentum nibh erat malesuada varius.
								</p>
							</section>
							<section>
								<header>
									<h3>Augue euismod feugiat tempus</h3>
								</header>
								<p>
									Pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis
									feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit
									ut nunc urna volutpat donec cubilia commodo risus morbi. Lobortis vestibulum velit malesuada ante
									egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.
								</p>
							</section>
						</article>
						<hr />
						<div class="row">
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="images/pic07.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Gravida aliquam penatibus</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="images/pic08.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Sed quis rhoncus placerat</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="images/pic09.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Magna laoreet et aliquam</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
						</div>
					</div>

				</div>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">

							<!-- Tweets -->
								<section class="4u 12u(mobile)">
									<header>
										<h2 class="icon fa-twitter circled"><span class="label">Tweets</span></h2>
									</header>
									<ul class="divided">
										<li>
											<article class="tweet">
												Amet nullam fringilla nibh nulla convallis tique ante sociis accumsan.
												<span class="timestamp">5 minutes ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Hendrerit rutrum quisque.
												<span class="timestamp">30 minutes ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Curabitur donec nulla massa laoreet nibh. Lorem praesent montes.
												<span class="timestamp">3 hours ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Lacus natoque cras rhoncus curae dignissim ultricies. Convallis orci aliquet.
												<span class="timestamp">5 hours ago</span>
											</article>
										</li>
									</ul>
								</section>

							<!-- Posts -->
								<section class="4u 12u(mobile)">
									<header>
										<h2 class="icon fa-file circled"><span class="label">Posts</span></h2>
									</header>
									<ul class="divided">
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Nisl fermentum integer</a></h3>
												</header>
												<span class="timestamp">3 hours ago</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Phasellus portitor lorem</a></h3>
												</header>
												<span class="timestamp">6 hours ago</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Magna tempus consequat</a></h3>
												</header>
												<span class="timestamp">Yesterday</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Feugiat lorem ipsum</a></h3>
												</header>
												<span class="timestamp">2 days ago</span>
											</article>
										</li>
									</ul>
								</section>

							<!-- Photos -->
								<section class="4u 12u(mobile)">
									<header>
										<h2 class="icon fa-camera circled"><span class="label">Photos</span></h2>
									</header>
									<div class="row 25% no-collapse">
										<div class="6u">
											<a href="#" class="image fit"><img src="images/pic10.jpg" alt="" /></a>
										</div>
										<div class="6u">
											<a href="#" class="image fit"><img src="images/pic11.jpg" alt="" /></a>
										</div>
									</div>
									<div class="row 25% no-collapse">
										<div class="6u">
											<a href="#" class="image fit"><img src="images/pic12.jpg" alt="" /></a>
										</div>
										<div class="6u">
											<a href="#" class="image fit"><img src="images/pic13.jpg" alt="" /></a>
										</div>
									</div>
									<div class="row 25% no-collapse">
										<div class="6u">
											<a href="#" class="image fit"><img src="images/pic14.jpg" alt="" /></a>
										</div>
										<div class="6u">
											<a href="#" class="image fit"><img src="images/pic15.jpg" alt="" /></a>
										</div>
									</div>
								</section>

						</div>
						<hr />
						<div class="row">
							<div class="12u">

								<!-- Contact -->
									<section class="contact">
										<header>
											<h3>Nisl turpis nascetur interdum?</h3>
										</header>
										<p>Urna nisl non quis interdum mus ornare ridiculus egestas ridiculus lobortis vivamus tempor aliquet.</p>
										<ul class="icons">
											<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
											<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
											<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
											<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
											<li><a href="#" class="icon fa-linkedin"><span class="label">Linkedin</span></a></li>
										</ul>
									</section>

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
										</ul>
									</div>

							</div>

						</div>
					</div>
				</div>

		</div>


	</body>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<body class="no-sidebar">
		<div id="page-wrapper">
			<input type="hidden" name="postNo" value="${community.postNo}">
			<!-- Header -->
				<div id="header">
					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="../index.jsp" id="logo">N A D R I I</a></h1>
							</header>
						</div>
						
						<jsp:include page="/layout/toolbar.jsp" />
				</div>

			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<!-- <article id="main" class="special" align="center" style="position: relative; height:auto;"> -->
						<article id="main" class="special" align="center" style="position: relative; height:auto;">
							<header>
								<h2><a href="#">${community.title}</a></h2>
								<br/>
								<div style="float: left;"> 
									<img src="../resources/assets/images/avatar.jpg" alt="" style="border-radius: 5em; height: 100%"/>
									<a href="#none" style="position: relative;">
										<span style="vertical-align: top;" class="name" data-container="body" data-toggle="popover">&nbsp;&nbsp;${community.userId}</span>
									</a>
								</div>
								<div style="float: right;">
									<span style="padding-right: 30px;"><span class="glyphicon glyphicon-eye-open"></span> &nbsp;&nbsp;${community.viewCount}</span>
									<span style="border-left: 1px solid; padding-left: 30px;">${community.regDate}</span>
								</div>
							</header>
							<br/>
							<div>
							<c:if test="${community.userId == loginUser.userId}">
								<div align="right">
									<a id="modify"><span class="glyphicon glyphicon-wrench"></span></a>
									&nbsp;
									<a id="delete"><span class="glyphicon glyphicon-erase"></span></a>
								</div>
							</c:if>
								${community.text}						
							</div>
							<br/><br/>
							<div>
								<div align= "left" class="col-xs-9" style="padding: 30px;">
									<img alt="" src="/resources/images/hashtag.png" width="30" height="30">&nbsp;&nbsp;<span style="font-size: 11pt;">${community.hashtag}</span>
								</div>
								<div align="right" class="col-xs-3">
									<input type="hidden" name="postNo" value="${community.postNo}">
									<jsp:include page="../common/like.jsp"></jsp:include>
								</div>
							</div>
						</article>
						<br/><br/><br/>
						<div>
						<jsp:include page="../common/comment.jsp"></jsp:include>
						</div>
						<hr />
						<div class="row">
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="/resources/helios/images/pic07.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Gravida aliquam penatibus</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="/resources/helios/images/pic08.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Sed quis rhoncus placerat</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="/resources/helios/images/pic09.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Magna laoreet et aliquam</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
						</div>
					</div>
				</div>
		</div>

	</body>
</html>