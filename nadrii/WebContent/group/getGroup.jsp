<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>나들이 모임~</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="../resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../resources/helios/assets/css/bootstrap.min.css" />	
		<link rel="stylesheet" href="../resources/helios/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="../resources/helios/assets/css/ie8.css" /><![endif]-->
				
		<!-- Scripts -->
		<script src="../resources/helios/assets/js/jquery.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
		<script src="../resources/helios/assets/js/skel.min.js"></script>
		<script src="../resources/helios/assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="../resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../resources/helios/assets/js/main.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3"></script>
	
		<!-- Latest compiled and minified JavaScript -->
		
		<style>
		.wrapper{
			margin: 0 !important;
		}	
		
		h2 {
		    font-size: 2em;
		    padding-bottom: 30px;
		}	
		
		#map{
			border: 1px solid;
			width:100%;
			height:350px;
			position: relative; 
			display: block;			
		}						
		</style>
		
		<script>
		
			function addLoadEvent(func){
			    var oldonload = window.onload;
			    if(typeof window.onload != 'function'){
			        window.onload = func;
			    }else{
			        window.onload = function(){
			            oldonload();
			            func();
			        };
			    }
			}
			
			$(function(){
				
				if('${group.lat}' == ''){
					$("#map").css("display","none");
					
				}
				
				if("${loginUser.userId}" == "${group.join.userId}"){
					$(".userMenu").css("display","block");
				}
	
				$(".button.list").bind("click", function(){
					self.location="../group/listGroup";
				});
				
				$(".button.modify").bind("click", function(){
					self.location="../group/updateGroup?groupNo=${group.join.groupNo}";
				});
				
				$(".button.delete").bind("click", function(){
					if(confirm("삭제하시겠습니까?")==true){
						self.location="../group/deleteGroup?groupNo=${group.join.groupNo}";
						alert("삭제되었습니다.");
					}else{
						return;	
					}		
				});
				
				$('[data-toggle="popover"]').popover({ 
					html: true,
					container: 'body',
					content: '<a href="#none" class="profile" onclick="javascript:clickProfile()">프로필 조회 <span class="glyphicon glyphicon-user"></span></a> <br/><a href="#none" class="message" onclick="javascript:clickMessage()"> 쪽지 보내기 <span class="glyphicon glyphicon-envelope"></span></a>',
					placement: 'bottom'
				});	
			
			});
			
			function clickProfile(){
				alert('${group.join.userId}');
			}
			
			function clickMessage(){	
				window.open("/message/addMessage?recevierId="+'${group.join.userId}',"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
			}
			
		</script>
	</head>
	<body class="right-sidebar">
		<div id="page-wrapper">	
		<!-- Header -->
				<div id="header">
			<!-- Inner -->
					<div class="inner">
						<header>
							<h1>나들이 모임</h1>
						</header>
					</div>
				<jsp:include page="../layout/toolbar.jsp" />		
			</div>		
		<!-- Main -->
				<div class="wrapper style1">
					<div class="container">
						<div class="row 200%">
							<div class="8u 12u(mobile)" id="content">
								<article id="main">
									<span class="button list" style="float: right; padding: 0; font-size: 12pt; width: 60px; background: #828282;">list</span>
									<header style="margin-bottom: 5em;">
										<h2>${group.title}</h2>
										<div style="float: left;"> 
											<img src="../resources/assets/images/avatar.jpg" alt="" style="border-radius: 5em; height: 100%"/>
											<a href="#none" style="position: relative;">
												<span style="vertical-align: top;" class="name" data-container="body" data-toggle="popover">&nbsp;&nbsp;${group.join.userId}</span>
											</a>
										</div>
										<div style="float: right;">
											<span style="padding-right: 30px;"><span class="glyphicon glyphicon-eye-open"></span> &nbsp;&nbsp;${group.viewCount}</span>
											<span style="border-left: 1px solid; padding-left: 30px;">${group.regDate}</span>
										</div>
										<br/>
										<div class="userMenu" style="float: right; margin-top: 10px">
											<span class="button modify" style="padding: 0; font-size: 12pt; width: 60px; background: #0060ad;">modify</span>
											<span class="button delete" style="padding: 0; font-size: 12pt; width: 60px; background: #9b2114;">delete</span>
										</div>
									</header>
									<span id="map"></span>
									<span>
										${group.text}
									</span>
								</article>
							</div>
							<div class="4u 12u(mobile)" id="sidebar">
								<hr class="first"/>
								<section>
									<jsp:include page="./join.jsp"></jsp:include>
								</section>
								<input type="hidden" name="postNo" value="${group.join.groupNo}">
								<jsp:include page="../common/like.jsp"></jsp:include>
								<div>
									<jsp:include page="../common/comment.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	</body>
	
	<script type="text/javascript">
		
		var lat= '${group.lat}'.replace(",","");
		var lng= '${group.lng}'.replace(",","");
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(lng, lat), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(lng, lat),
		    map: map
		});
		
		var placeName = '${group.placeName}';
		var content = placeName.slice(placeName.indexOf("<h3>")+4,placeName.indexOf("</h3>"));
		var infowindow = new daum.maps.InfoWindow({
		    content : '<center><div style="font-size: 10pt; font-weight: bold;">&nbsp;&nbsp;'+content+'</div></center>'
		});
		
		infowindow.open(map, marker);
		
		addLoadEvent(getMemberList);
		addLoadEvent(getLike);
			
	</script>
</html>