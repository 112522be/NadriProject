<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>Prologue by HTML5 UP</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css?version=1041" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.item').on('click', function() {
			var postNo = $($('input[name="postNo"]')[$('.item').index(this)]).val()
			self.location = "getComm?postNo="+postNo;
		})
	})
</script>
<style type="text/css">
>>>>>>> refs/remotes/origin/master

.icon{
	padding: 5px;
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
/* 	font: bold 13px Helvetica, sans-serif; */
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

</style>
</head>
<body>
	<header>
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	</header>
	<div class="container">
		<nav class="container">
		<section id="portfolio" class="two">
			<div class="container">
				<div align="right">
					<img class="icon" src="">
					
				</div>
				<div class="row">
					<c:set var="i" value="0" />
					<c:forEach var="community" items="${list}">
						<c:set var="i" value="${i+1}" />
						<div class="3u 12u$(mobile)">
							<article class="item">
								<a href="#" class="image fit"> 
								<input type="hidden" name="postNo" value="${community.postNo}"> 
								<img src="${community.thumbNailFileName}" alt="" />
								</a>
								<header>
									<h3>
										<a href="#">${community.title}</a>
									</h3>
									<time class="published" datetime="${community.regDate}">${community.regDate}</time>
									<span class="author">
										<input type="hidden" id="userId" value="${community.userId}">
										<img src="../resources/assets/images/avatar.jpg" alt="" />
									</span>
									<a href="#" class="author">
										<h5>${community.userId}</h5>
									</a>
								</header>
							</article>
						</div>
					</c:forEach>
				</div>
				<link href="../css/floating.css" rel="stylesheet">
				<a class="buttons" href="addComm.jsp" tooltip="게시물 작성"><span><span class="rotate"></span></span></a></nav>
			</div>
		</section>
	</div>


	<!-- Scripts -->
	<script src="../resources/assets/js/jquery.min.js"></script>
	<script src="../resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="../resources/assets/js/jquery.scrollzer.min.js"></script>
	<script src="../resources/assets/js/skel.min.js"></script>
	<script src="../resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="../resources/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../resources/assets/js/main.js"></script>

</body>
</html>