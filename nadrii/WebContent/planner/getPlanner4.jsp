<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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

<div id="header">

		<div class="inner">
			<header>
			<h1>
				<a href="/index.jsp" id="logo">N A D R I I</a>
			</h1>
			</header>
		</div>

		<jsp:include page="/layout/toolbar.jsp" />

	</div>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 
<script src="../resources/assets/js/jquery.min.js"></script>
<script src="../resources/assets/js/skel.min.js"></script>
<script src="../resources/assets/js/util.js"></script>
<script src="../resources/assets/js/main.js"></script>
 -->
<!-- ----------------------  Map관련부분 -----------------------------  -->

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="../resources/css/keywordSearch.css?version=1" rel="stylesheet">
<!-- ----------------------  Map관련부분 -----------------------------  -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
 
 
 <!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/imperfect/assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie8.css" /><![endif]-->
 
 
 
 <link rel="stylesheet"
	href="../resources/assets/css/main.css?version=0206455" />
 
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
		position: relative;
		animation: mymove1 3s infinite;
		margin-bottom: -20px;
	}
	
	
	.transport1 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove1 {
		from {left: -45px;
		}
		
		to {
			left: 60px;
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
		position: relative;
		animation: mymove2 6s infinite;
		margin-bottom: -20px;
	}
	
	.transport2 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove2 {
		from {left: -40px;
		}
		
		to {
			left: 200px;
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
		position: relative;
		animation: mymove3 9s infinite;
		margin-bottom: -20px;
	}
	
	.transport3 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove3 {
		from {left: -40px;
		}
		
		to {
			left: 327px;
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
		position: relative;
		animation: mymove4 12s infinite;
		margin-bottom: -20px;
	}
	
	.transport4 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove4 {
		from {left: -40px;
		}
		
		to {
			left: 466px;
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
		position: relative;
		animation: mymove5 15s infinite;
		margin-bottom: -20px;
	}
	
	.transport5 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove5 {
		from {left: -40px;
		}
		
		to {
			left: 594px;
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
		position: relative;
		animation: mymove6 18s infinite;
		margin-bottom: -20px;
	}
	
	.transport6 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove6 {
		from {left: -40px;
		}
		
		to {
			left: 720px;
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
		position: relative;
		animation: mymove7 21s infinite;
		margin-bottom: -20px;
	}
	
	.transport7 {
		animation-timing-function: linear;
	}
	
	@keyframes mymove7 {
		from {left: -40px;
		}
		
		to {
			left: 840px;
		}
	}

	/* 길 이미지 크기조절 */
	.road1 {
		width: 268%;
		position: relative;
		text-align: center;
		margin-bottom: -60px;
		margin-left: -113px;
	}
	
	.road2 {
	    width: 526%;
	    height: 10px;
	    position: relative;
	    text-align: center;
	    margin-bottom: -60px;
	    margin-left: -113px;
	}
	
	.road3 {
		width: 780%;
		height: 10px;
		position: relative;
		text-align: center;
		margin-bottom: -60px;
		margin-left: -113px;
	}
	
	.road4 {
		width: 1033%;
		height: 10px;
		position: relative;
		text-align: center;
		margin-bottom: -60px;
		margin-left: -113px;
	}
	
	.road5 {
		width: 1293%;
	    height: 10px;
	    position: relative;
	    text-align: center;
	    margin-bottom: -60px;
	    margin-left: -113px;
	}
	
	.road6 {
	    width: 1550%;
	    height: 10px;
	    position: relative;
	    text-align: center;
	    margin-bottom: -60px;
	    margin-left: -113px;
	}
	
</style>
<script>
$(function(){
	
	$("#list").bind("click", function(){
		self.location="/planner/getMyPlannerList";
	});
	
	$("#modify").bind("click", function(){
		self.location="../planner/updatePlanner?postNo=${planner.postNo}";
	});
	
	
	$("#delete").bind("click", function(){
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
<body>
	<div id="main">
		<section class="two">
		<div class="container">
			<a href="#" id="list" class="button small"
				style="position: relative; float: right; margin-top: -40px;">list</a>
			<article class="post"> <header>
				<div class="title" style="overflow: hidden">
					<h2>${planner.title}</h2>
					<div>
						<ul id="groupName" style="overflow: hidden">
							<li>${planner.plannerMakerId}</li>
						</ul>
						<ul id="count">
							<li>view : ${planner.viewCount}</li>
						</ul>
					</div>
				</div>
	
				<div class="meta">
					<time class="published" datetime="${planner.regDate}">${planner.regDate}</time>
					<a href="#" class="author"><span class="name">${planner.plannerMakerId}</span>
						<img src="../resources/assets/images/avatar.jpg" alt="" /></a>
				</div>
				</header>
				<div id="map" style="width: 100%; height: 350px;"></div>
				
				<div id=pathImg></div><br>
				<div id="path"></div><br><br>
				
				<div>${planner.text}</div>

				<footer>
				<ul class="stats">
					<li><a href="#" class="icon fa-heart">28</a></li>
					<li><a href="#" class="icon fa-comment">128</a></li>
				</ul>
				</footer>
				<div style="float: right; margin-top: -3em;">
					<c:if test="${planner.plannerMakerId eq userId}">
						<a href="#" id="modify" class="button small modify">modify</a> 
						<a href="#" id="delete" class="button small delete">delete</a>	
					</c:if>
				</div>
			</article>
		</div>
		</section>
	</div>
	<jsp:include page="../planner/plannerSub/getPlannerSub.jsp"></jsp:include>

</body>

</html>