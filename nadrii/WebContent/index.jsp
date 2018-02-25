<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>나들이 메인화면</title>
		<meta charset="utf-8" />
		
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3	66.7/css/bootstrap.min.css"
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
	<script src="/resources/js/tripLocation.js"></script>
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style>
body{
	background-color: #e1dae266;
}
.reel article{
	border: 1px solid;
	border-color: #878787;
}

</style>
<script type="text/javascript">


//========== Login Part ==========


	
	///*
	// ========== TOP button ==========
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});

		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		})
	});
	///*
	//=========alert 대신 toast
	function makeToast(title) {
		$('#toastMessage').text(title).fadeIn(400).delay(3000).fadeOut(400);
	}
	
	
	
	//=============== img 클릭=======================
		$(function(){
			
			$($(".reel img")[0]).on("click",function(){
			
				self.location = "../trip/getTheme"
		
				
			})
		});
		
		$(function(){	
			$($(".reel img")[1]).on("click",function(){
				//alert("어디로 갈까?");
				self.location ="/planner/getUserPlannerList";
			})
		});
			
		$(function(){	
			$($(".reel img")[2]).on("click",function(){
				self.location ="/comm/listComm";
			})
		});
			
		$(function(){	
			$($(".reel img")[3]).on("click",function(){
				
				self.location ="/ticket/listTicket";
				
			})
		});
		
			
		$(function(){	
			
		
			$($(".reel img")[4]).on("click",function(){
				self.location ="/group/listGroup";
			})
			
		});
		
		//*/ 	
		
		
		
		
</script>
	
<style>
#header {
	background-image:
		url(/resources/images/tripIcon/knocker-2163643_1920.jpg);
	background-color: #3a2748;
}

.buttonyagn {
	background-color: #df7366;
	display: inline-block;
	border-radius: 100%;
	width: 4.5em;
	height: 4.5em;
	line-height: 4.5em;
	text-align: center;
	font-size: 1.25em;
	color: #fff;
	padding: 0;
}

#topBtn{
				position:fixed;
				right:2%;
				bottom:50px;
				z-index:999;
				background:#6cc;
				font-weight: bolder
}


.toastMessage {
    width:400px;
    height:auto;
    position:fixed;
    left:50%;
    margin-left:-200px;
    bottom:15px;
    background-color: #000000;
    color: #F0F0F0;
    font-size: 18px;
    padding:12px;
    text-align:center;
    border-radius: 2px;
    -webkit-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
    -moz-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
    box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
    z-index: 100;
}



</style>

</head>




<body class="homepage">

<form>

	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<jsp:include page="/layout/inner.jsp" />


			<jsp:include page="/layout/toolbar.jsp" />

		</div>

		<!-- /////////////////////////////////////////////////////////// -->
		<c:if test="${  empty loginUser }">
			<div class="wrapper-style1">
				<section id="banner">
					<div class="container">
						<div class="row">
							<article class="3u 12u(mobile) special">
								<header>
									<h3>
										<strong>아 이 디</strong>
									</h3>
								</header>
									<input type="text" class="12u" name="userId" id="userId"
										placeholder="  ID">
							</article>
							<article class="3u 12u(mobile) special">
								<header>
									<h3>
										<strong>비밀번호</strong>
									</h3>
								</header>
									<input type="password" class="12u" name="password"
										id="password" placeholder="  Password">
							</article>
							<article class="2u 12u(mobile) special">
								<header>

									<input type="button" name="loginID" 
										value="로그인">
								</header>
							</article>
							<article class="2u 12u(mobile) special">
								<header>

									<input type="button" name="loginPW" 
										data-toggle="modal" data-target="#myModal" value="회원가입">

								</header>
							</article>
							<article class="2u 12u(mobile) special">
								<header>
									<input type="button" name="kakaver" value="카카버">

								</header>
							</article>
						</div>
					</div>
				</section><!-- banner END -->
			</div>
		</c:if>
		<!-- /////////////////////////////////////////////////////////// -->
											
											<!-- Carousel -->
											<section class="carousel" id="carousel">
												<div class="reel">
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/racing-442393_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 정보</a>
															</h3>
														</header>
														<p>어디로 갈까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/calendar-3073971_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 플래너</a>
															</h3>
														</header>
														<p>계획을 세워볼까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/notebook-1803664_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나만의 나들이</a>
															</h3>
														</header>
														<p>자랑해볼까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/admission-2974645_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 티켓</a>
															</h3>
														</header>
														<p>입장권을 사볼까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/pinky-swear-329329_1920.jpg"
															alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 모임</a>
															</h3>
														</header>
														<p>누구를 만날까?</p>
													</article>
											
												</div>
											</section><!-- Carousel END -->

										<!-- Modal -->
											<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
												role="dialog" aria-labelledby="mySmallModalLabel">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title" id="myModalLabel">
																<span class="glyphicon glyphicon glyphicon-user"
																	aria-hidden="true"> </span> 나들이 회원가입
															</h4>
														</div>
										
														<div class="modal-body">
																<h5>
																	<strong>아이디</strong><span class="timestamp" id="duplicateId"></span>
																</h5>
										
																<input type="text" name="modalUserId" placeholder="  ID" oninput="checkId();"> <br>
																<br>
																<h5>
																	<strong>비밀번호</strong><span class="timestamp" id="validatePw"></span>
																</h5>
																<input type="password" name="modalUserPw" placeholder="  Password">
																<br>
																<br>
																<h5>
																	<strong>비밀번호 확인</strong>
																</h5>
																<input type="password" name="modalUserRePw" placeholder="  Password" oninput="checkPwd();"> <br>
																<br>
																<h5>
																	<strong>이메일</strong>&nbsp;&nbsp;<a href="#"
																		class="btn btn-default">인증번호요청</a> <span class="timestamp" id="serialNum"></span>
																</h5>
																<input type="text" name="modalUserEmail" placeholder="  E-mail" oninput="emailValid();"> <br>
																<br>
																<h5>
																	<strong>인증번호입력</strong>&nbsp;&nbsp;<a href="#"
																		class="btn btn-default">이메일 인증</a> <span class="timestamp" id="authorNum"></span>
																</h5>
										
																<input type="text" name="modalUserEmailAuth" placeholder="  6자리 인증번호 입력"> <br>
																<br>
														</div>
										
														<div class="modal-footer">
															<button type="button" class="button signupbtn" data-dismiss="modal"
																style="background-color: #aaaaaa;">가 입</button>
															&nbsp;
															<button type="button" class="button" name="modalCancel"
																data-dismiss="modal" onclick="delchk();">취 소</button>
														</div>
													</div>
												</div>
											</div>
											<!-- modal End -->
											
											<jsp:include page="/layout/footer.jsp" />
	</div>
	<!-- page-wrapper -->


	<!-- top button -->
	<a id="topBtn" href="#" class="icon fa-arrow-up circled"></a>

</form>
<div id="toastMessage" class='toastMessage' style='display:none'>Toast</div>

</body>




</html>