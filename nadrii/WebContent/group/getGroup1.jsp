
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="../resources/assets/js/1jquery.min.js"></script>
<script src="../resources/assets/js/1skel.min.js"></script>
<script src="../resources/assets/js/1util.js"></script>
<script src="../resources/assets/js/1main.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3"></script>
<style type="text/css">
.btn.btn-default {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
		-webkit-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
		-ms-transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
		transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;
		background-color: #FFFFFF;
		border: 0;
		width: auto;
		height: auto;
		box-shadow: inset 0 0 0 1px rgba(160, 160, 160, 0.3);
		color: #3c3b3b;
		cursor: pointer;
		display: inline-block;
		letter-spacing: 0.25em;
		line-height: 2.8125em;
		padding: 0;
		text-align: center;
		text-decoration: none;
		text-transform: uppercase;
		white-space: nowrap;
	}
	
	
footer a{
	color: #555 !important;
}

footer{
	background: #ffffff !important;
	padding: 50px 270px 0 0 !important;
}

.button.fit {
	margin-top: 10px !important; 
	font-size: 1em;
}

.navbar {
    margin-bottom: 0px !important;
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

table {
	float: left !important;
}
table td {
	font-size: 0.6em;
    padding: 0.05em 1.3em !important;
}

section > :last-child, section > .container, section:last-child, article > :last-child, article > .container, article:last-child {
    margin-bottom: -35px !important;
}

.author .name{
	margin: 0 10px 0 0 !important;
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
		$("#userMenu").css("display","block");
	}
	
	$("#write").bind("click", function(){
		self.location="../group/addGroup";
	});
	
	$("#list").bind("click", function(){
		self.location="../group/listGroup";
	});
	
	$("#modify").bind("click", function(){
		self.location="../group/updateGroup?groupNo=${group.join.groupNo}";
	});
	
	$("#delete").bind("click", function(){
		if(confirm("삭제하시겠습니까?")==true){
			self.location="../group/deleteGroup?groupNo=${group.join.groupNo}";
			alert("삭제되었습니다.");
		}else{
			return;	
		}		
	});
	
	$('[data-toggle="popover"]').popover(
			{ html: true,
			 container: 'body',
			 content: '<a href="#none" class="profile" onclick="javascript:clickProfile()">프로필 조회 <span class="glyphicon glyphicon-user"></span></a> <br/><a href="#none" class="message" onclick="javascript:clickMessage()"> 쪽지 보내기 <span class="glyphicon glyphicon-envelope"></span></a>',
			 placement: 'bottom',
			 }
			);	

	addLoadEvent(getMemberList);
	addLoadEvent(getLike);
});

function clickProfile(){
	alert('${group.join.userId}');
}

function clickMessage(){	
	window.open("/message/addMessage?recevierId="+'${group.join.userId}',"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
}
</script>

</head>
<body>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
<div id="main">
<section class="two">
	<div class="container">
	<a href="#none" id="write" class="button small write" style="position: relative; float:right; margin-top: -40px; margin-right: 80px">write</a>
	<a href="#none" id="list" class="button small" style="position: relative; float:right; margin-top: -40px;">list</a>
			<article class="post">
			<a href="#none" id="list" class="button small delete">delete</a>
				<header>
					<div class="title" style="overflow: hidden">
						<h2>${group.title}</h2>
						<div>
							<ul id="count">
								<li>view : ${group.viewCount}</li>
							</ul>
						</div>
					</div>
					
					<div class="meta">
						<time class="published" datetime="${group.regDate}">${group.regDate}</time>
						<a href="#none" class="author"><span class="name" data-container="body" data-toggle="popover">${group.join.userId}</span>
						<img src="../resources/assets/images/avatar.jpg" alt="" /></a>
					</div>
				</header>

				<div style="padding-bottom: 330px">
					<div class="table-wrapper" style="width: 30%; float: left;">
						<jsp:include page="./join.jsp"></jsp:include>	
					</div>
					<div id="map" style="width:100%; height:350px; position: relative; display: block;"></div>
				</div>
		
				<div>
				<p>${group.text}</p>
				</div>
				<input type="hidden" name="postNo" value="${group.join.groupNo}">
				<jsp:include page="../common/like.jsp"></jsp:include>	
				<div id="userMenu" style="float: right; margin-top: -3em; display: none;">
					<a href="#none" id="modify" class="button small modify">modify</a>
					<a href="#none" id="delete" class="button small delete">delete</a>
				</div>
	
			</article>
			<div style="margin-top: -100px; margin-left: -25px; margin-bottom: 100px;">
			<input type="hidden" name="postNo" value="${group.join.groupNo}">
			<jsp:include page="../common/comment.jsp"></jsp:include>
			</div>
		</div>
</section>	
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
    content : '<div style="font-size: 10pt; font-weight: bold;">&nbsp;&nbsp;'+content+'</div><br/>'
});

infowindow.open(map, marker);

</script>
<link rel="stylesheet" href="../resources/assets/css/main.css?version=0206455" />
</html>