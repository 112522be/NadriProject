<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>나들이 모임~</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
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

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>
<style type="text/css">

	footer a {
		color: #555 !important;
	}
	
	.post>footer {
		background: #ffff;
	}
	
	#groupName {
		display: inline-block;
		font-family: "Raleway", Helvetica, sans-serif;
		font-size: 0.6em;
		font-weight: 400;
		letter-spacing: 0.25em;
		line-height: 1;
		margin: 0 0 0 0em;
		padding: 0 2em 0 0em;
		float: left;
	}
	
	#count {
		display: inline-block;
		font-family: "Raleway", Helvetica, sans-serif;
		font-size: 0.6em;
		font-weight: 400;
		letter-spacing: 0.25em;
		line-height: 1;
		margin: 0 0 0 2em;
		padding: 10px 2em 0 2em;
		float: right;
	}
	
	#pathImg {
		text-align: center;
		word-break: keep-all;
		
	}
	
	#markerImg {
		display: inline-block;
		width: 100px;
		font-size: 17px;
		line-height: 23px;
		vertical-align: middle;
		text-align: center;
		margin: 14px;
		position: relative;	
	}
	
	#path {
		text-align: center;
		word-break: keep-all;
		position: absolute;
		width: 992px;
	}
	
	#address {
		display: inline-block;
		width: 100px;
		font-size: 17px;
		line-height: 23px;
		vertical-align: middle;
		text-align: center;
		margin: 14px;
	}
	
	
	/************************애니메이션 종료위치를 설정하기 위해 변수별로 따로 css지정***************************/
	.transport1 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove1 3s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	
	.transport1 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove1 {
		from {left: 20px;
		}
		
		to {
			left: 130px;
		}
	}
	
	.transport2 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove2 6s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	.transport2 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove2 {
		from {left: 20px;
		}
		
		to {
			left: 260px;
		}
	}
	
	.transport3 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove3 9s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	.transport3 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove3 {
		from {left: 20px;
		}
		
		to {
			left: 390px;
		}
	}
	
	.transport4 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove4 12s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	.transport4 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove4 {
		from {left: 20px;
		}
		
		to {
			left: 520px;
		}
	}
	
	.transport5 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove5 15s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	.transport5 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove5 {
		from {left: 20px;
		}
		
		to {
			left: 650px;
		}
	}
	
	.transport6 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove6 18s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	.transport6 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove6 {
		from {left: 20px;
		}
		
		to {
			left: 780px;
		}
	}
	
	.transport7 {
		display: inline-block;
		width: 75px;
		height: 57px;
		font-size: 16px;
		line-height: 20px;
		vertical-align: middle;
		text-align: center;
		position: absolute;
		animation: mymove7 21s infinite;
		margin-bottom: -20px;
		z-index:9999;
	}
	
	.transport7 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove7 {
		from {left: 20px;
		}
		
		to {
			left: 910px;
		}
	}

	/* 길 이미지 크기조절 */
	.road1 {
		width: 133%;
		height: 10px;
		position: absolute;
		text-align: center;
		margin-top: 51px;
		margin-left: -36px;
	}
	
	.road2 {
	    width: 260%;
	    height: 10px;
	    position: absolute;
	    text-align: center;
	    margin-top: 51px;
		margin-left: -36px;
	}
	
	.road3 {
		width: 390%;
		height: 10px;
		position: absolute;
		text-align: center;
		margin-top: 51px;
		margin-left: -36px;
	}
	
	.road4 {
		width: 520%;
		height: 10px;
		position: absolute;
		text-align: center;
		margin-top: 51px;
		margin-left: -36px;
	}
	
	.road5 {
		width: 650%;
	    height: 10px;
	    position: absolute;
	    text-align: center;
	    margin-top: 51px;
		margin-left: -36px;
	}
	
	.road6 {
	    width: 780%;
	    height: 10px;
	    position: absolute;
	    text-align: center;
	    margin-top: 51px;
		margin-left: -36px;
	}
	
</style>

<script>
$(function(){
	
	$("#list").bind("click", function(){
		self.location="/planner/getMyPlannerList";
	});
	
	$("#postMod").bind("click", function(){
		self.location="../planner/updatePlanner?postNo=${planner.postNo}";
	});
	
	
	$("#postDel").bind("click", function(){
		if(confirm("삭제하시겠습니까?")==true){
			self.location="/planner/deletePlanner?postNo=${planner.postNo}";
			alert("삭제되었습니다.");
		}else{
			return;	
		}		
	});
	
	$(".startImg").on("click", function(){
		var zoomMove = geoPosition;
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=0; i<2; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
	});
	
	$(".passImg1").on("click", function(){
		var zoomMove = geoPosition;
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=1; i<3; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
	});
	
	$(".passImg2").on("click", function(){
		var zoomMove = geoPosition;
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=2; i<4; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
	});
	
	$(".passImg3").on("click", function(){
		var zoomMove = geoPosition;
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=3; i<5; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
	});
	
	$(".passImg4").on("click", function(){
		var zoomMove = geoPosition;
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=4; i<6; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
	});
	
	$(".passImg5").on("click", function(){
		var zoomMove = geoPosition;
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=5; i<7; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
	});
	
	$(".endImg").on("click", function(){
		mapMove();
	});
	
	
});

/*******************toggle 사용**********************/
$(function () {
	$('[data-toggle="popover"]').popover({html: true})
})

</script>

</head>
<body class="no-sidebar">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header">
			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="index.html" id="logo">플래너</a>
					</h1>
				</header>
			</div>
			<jsp:include page="../layout/toolbar.jsp" />
		</div>

		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special">
					<header style="margin-bottom: 5em;">
						<h2>${planner.title}</h2>
						<div style="float: left;">
							<img src="../resources/assets/images/avatar.jpg" alt=""
								style="border-radius: 5em; height: 100%" /> <a href="#none"
								style="position: relative;"> <span
								style="vertical-align: top;" class="name" data-container="body"
								data-toggle="popover">&nbsp;&nbsp;${planner.plannerMakerId}</span>
							</a>
						</div>
						<div style="float: right;">
							<span style="padding-right: 30px;">view :
								&nbsp;${planner.viewCount}</span> <span
								style="border-left: 1px solid; padding-left: 30px;">${planner.regDate}</span>
						</div>
						<br />
						<div class="userMenu" style="float: right; margin-top: 10px">
							<c:if test="${planner.plannerMakerId eq userId}">
								<span class="button modify" id="postMod" style="padding: 0; font-size: 12pt; width: 60px; background: #0060ad;">modify</span>
								<span class="button delete" id="postDel" style="padding: 0; font-size: 12pt; width: 60px; background: #9b2114;">delete</span>	
							</c:if>
						</div>
					</header>
					<a href="#" class="image featured"><img src="images/pic06.jpg"
						alt="" /></a>
						
					<div id="map" style="width: 100%; height: 450px;"></div>
					<section id="pathImg">
					</section>
					
					<br>
					
					<section>
						${planner.text}
					</section>
					<input type="hidden" name="postNo" value="${planner.postNo}">
					<jsp:include page="../common/like.jsp"></jsp:include>
					<div>
						<jsp:include page="../common/comment.jsp"></jsp:include>
					</div>
				</article>
			</div>

		</div>
	<jsp:include page="../planner/plannerSub/getPlannerSub.jsp"></jsp:include>
	</div>
</body>
</html>