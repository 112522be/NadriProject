
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="../resources/assets/js/1jquery.min.js"></script>
<script src="../resources/assets/js/1skel.min.js"></script>
<script src="../resources/assets/js/1util.js"></script>
<script src="../resources/assets/js/1main.js"></script>
<script
  src="http://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
<style type="text/css">

img{
	max-width: 800px;
	height: auto;
}

footer a{
	color: #555 !important;
}

footer{
	padding: 0 0 0 0;
	background: #ffffff !important;
}

.button.fit {
	margin-top: 10px !important; 
	font-size: 1em;
}

.navbar {
    margin-bottom: 0px !important;
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
	
	h3{
		font-size: 14pt;
		
	}
</style>
<script>
$(function(){
	$("a.button.small.write:contains('write')").bind("click", function(){
		self.location="addComm.jsp";
	});
	
	$("a.button.small:contains('link')").bind("click", function(){
		self.location="/comm/listComm";
	});
	
	$("a.button.small.modify:contains('modify')").bind("click", function(){
		self.location="/comm/updateCommView?postNo=${community.postNo}";
	});
	
	$("a.button.small.delete:contains('delete')").bind("click", function(){
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

</head>
<body>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
<div id="main">
<section class="two">
	<div class="container" style="height: auto;">
		<a href="#" class="button small write" style="position: relative; float:right; margin-top: -40px; margin-right: 80px">write</a>
		<a href="#" class="button small" style="position: relative; float:right; margin-top: -40px;">list</a>
			<article class="post">
				<header>
					<div class="title" style="overflow: hidden">
						<h2>${community.title}</h2>
						<div>
							<ul id="count">
								<li>view : ${community.viewCount}</li>
							</ul>
						</div>
					</div>
					
					<div class="meta">
						<time class="published" datetime="${community.regDate}">${community.regDate}</time>
						<a href="#" class="author"><span class="name" data-container="body" data-toggle="popover">${community.userId}</span>
						<img src="../resources/assets/images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				<br/>
				<div align="center">
					${community.text}
				</div>
				<c:if test="${community.userId==loginUser.userId}">		
					<div align="right">
						<a href="#" class="button small modify">modify</a>
						<a href="#" class="button small delete">delete</a>
					</div>
				</c:if>	
				<footer>
					<div class="col-xs-6">
						<ul class="stats">
							<li class="like"><a href="#" class="icon fa-heart" onclick="javascript:addLike();">28</a></li>
							<li class="comment"><a href="#" class="icon fa-comment">128</a></li>
						</ul>
					</div>
					<div class="col-xs-6" align="right">
						<img src="/resources/images/hashtag.png" width="30px" height="30px"><span style="color: gray; font-size: 10pt;">&nbsp;&nbsp;${community.hashtag}</span>
					</div>
				</footer>
			</article>
		<jsp:include page="../common/comment.jsp"></jsp:include>
	</div>
	</section>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28f2a580a6a043772106fd68ca5e3561"></script>
	<script>
		function map(lat, lng) {	
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(lat, lng),
				level: 3
			};
	
			var map = new daum.maps.Map(container, options);
		}
	</script>
</body>
<link rel="stylesheet" href="../resources/assets/css/main.css?version=0206455" />
</html>