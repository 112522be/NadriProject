<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>나들이 :: 모임 게시판</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css?version=1041" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	
function fncGetList(currentPage){
	$("#currentPage").val(currentPage);
	$("form .search").attr("method" , "POST").attr("action" , "../group/listGroup").submit();
}

function a(){
	var groupNo = $($("input[id='groupNo']")[$(".fit").index(this)]).val();
}

$(function(){
	
	$("#write").bind("click", function(){
		self.location="../group/addGroup";
	});
	
	$(".fit").on("click", function(){
		
		var groupNo = $($("input[id='groupNo']")[$(".fit").index(this)]).val();
		
		self.location="../group/getGroup?groupNo="+groupNo;
			
	});
	
	$("header h3").on("click", function(){
		
		var groupNo = $($("input[id='groupNo']")[$("header h3").index(this)]).val();
		
		self.location="../group/getGroup?groupNo="+groupNo;
			
	});
	
	$(".author h5").on("click", function(){
	
		var userId = $($("input[id='userId']")[$(".author h5").index(this)]).val();
		
		//self.location="../user/getUserProfile?userId="+userId;
			
	});
	
	$('[data-toggle="popover"]').popover(
			{ html: true,
			 container: 'body',
			 content: '<a href="#" class="profile" onclick="javascript:clickProfile()">프로필 조회<span class="glyphicon glyphicon-user"></span></a> <br/><a href="#" class="message" onclick="javascript:clickMessage()"> 쪽지 보내기</a>',
			 placement: 'bottom',
			 }
			);	

});

function clickProfile(){
	alert(userId);
}

function clickMessage(){
	window.open("/message/addMessage?recevierId="+userId,"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
}

var userId;

function getIndex(k){
	userId = $($("input[id='userId']")[$(".author h5").index(k)]).val();
}


</script>
<style type="text/css">

form.search > input:first-child {
    padding-left: 2.5em;
    margin-right: -20px;
}

.row {
	margin: -20px 0 -1px -20px;
}

@media screen and (max-width: 736px) {
	section > :last-child,
				section > .container, section:last-child, article > :last-child,
				article > .container, article:last-child {
					margin-bottom: 40%;
				}
}
.cog
{
	position: absolute;
	top: 0;
	right: 0;
	padding: 5px;
	margin-top: 5px;
	margin-right: 6px;
	border: none;
	color: #f5fafa;
	font-size: 20px;
}

.admin-text:hover, .cog:hover { cursor: pointer; color: #555555; }

.menu a
{
	display: block;
	background: #F8F8F8;
	width: 120px;
	height: 40px;
	padding: 0 0 0 10px;
	font: bold 13px Helvetica, sans-serif;
	text-transform: uppercase;
	text-decoration: none;
	color: #000000;
	color: rgba( 0, 0, 0, 0.7 );
	line-height: 40px;
	box-shadow: 0 1px 1px rgba( 0, 0, 0, 0.2 );
}

.menu a:nth-child( 2 )
{
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.menu a:last-child
{
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
}

.menu a:hover { color: #555555; }

.menu a:hover > .octicon { color: #555555; }

.glyphicon
{
	float: right;
	margin-top: 12px;
	margin-right: 12px;
	font-size: 15px;
	color: #000000;
	color: rgba( 0, 0, 0, 0.7 );
	opacity: 0.8;
}

.arrow
{
	width: 0;
	height: 0;
	margin-left: 15px;
	border-left: 7px solid transparent;
	border-right: 7px solid transparent;
	border-bottom: 9px solid #F8F8F8;
}

.button.small {
    font-size: 13px;
    box-shadow: 0 0.1em 0.1em 0 rgba(0, 0, 0, 0.05);
}

.author .name {
	margin: 5px 0 0 0;
}

</style>

</head>
<body>
	<header>
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	</header>
	<div id="main">
		<section id="portfolio" class="two">
			<div class="container">
			<section style="position: relative;">
				<form class="search">
					<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}" placeholder="Search" />
				</form>
			</section>
			<a href="#" id="write" class="button small write" style="position: relative; float:left; margin-top: -7px; margin-left: 6px;">write</a>
				<div class="row">
					<c:set var="i" value="0" />
					<c:forEach var="group" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<div class="3u 12u$(mobile)">
							<article class="item">
								<a href="#" class="image fit">
								<input type="hidden" id="groupNo" value="${group.join.groupNo}">
								<img src="../resources/assets/images/pic02.jpg" alt="" />
								</a>
								<header>
									<h3>
										<a href="#">${group.title}</a>
									</h3>
									<time class="published" datetime="${group.regDate}">${group.regDate}</time>
									<span class="author">
										<img src="../resources/assets/images/avatar.jpg" alt="" />
									</span>
									<a href="#" class="author">
										<input type="hidden" id="userId" value="${group.join.userId}">
										<h5 class="name" data-container="body" data-toggle="popover" onclick="javascript:getIndex(this);">${group.join.userId}</h5>
									</a>
								</header>
							</article>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>


	<!-- Scripts -->
	<script src="../resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="../resources/assets/js/jquery.scrollzer.min.js"></script>
	<script src="../resources/assets/js/skel.min.js"></script>
	<script src="../resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="../resources/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../resources/assets/js/main.js"></script>
	<script src="../resources/assets/js/1main.js"></script>
</body>
</html>