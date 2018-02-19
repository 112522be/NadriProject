<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Nadrii :: 나만의 나들이</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
<script type="text/javascript">
$(function() {
	$('article').on('click', function() {
		var postNo = $($('input[name="postNo"]')[$('article').index(this)]).val()
		self.location = "getComm?postNo="+postNo;
	})
	$('#searchKeyword').keydown(function(key) {
			var data = $(this).val();
			if(key.keyCode==13){
				if(data!=""){
				$('form.search').attr('method', 'POST').attr('action', '/comm/listComm').submit();
				}else{	
	 				alert("검색어를 입력해주세요");
				}
			}
	})
})
</script>
<style type="text/css">
	form.search > input:first-child {
		content: none;
		padding-left: 1em;
	}
	#nav {
	    background-color: #3b2b48;
	    opacity: 0.7;
	}
	div.wrapper.style1{
		background-image: url("/resources/images/background_3.jpg");
	}
	#searchKeyword{
		border-radius: 30px;
		width: 400px;
		height: 50px;
	}
	.image.featured{
		margin: 0 0 1em 0;
	}
	article {
		height: 500px;
	}
	.icons {
		position: absolute;
		bottom: 10px;
		right: 10px;
	}
</style>
</head>
<body>
	<div id="header">
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="../index.jsp" id="logo">NADRII</a></h1>
							</header>
						</div>
				</div>
	<div class="wrapper style1">
					<section id="features" class="container special">
						<header>
							<h2>나만의 나들이</h2>
							<p>세상에 하나뿐인 당신의 추억을 공유하세요</p>
						</header>
						<div class="continer">
						<div class="col-sm-9" align="left">
							<h6 style="color: #aeb1b7;font-style:normal;">전체 ${resultPage.totalCount}개 게시물</h6>
						</div>
						<div class="col-sm-3" align="right">
							<form class="search">
								<span class="glyphicon glyphicon-search" style="position: relative; margin-right: -40px;"></span>
								<input type="text" name="searchKeyword" id="searchKeyword" value="" style="width: 80%"/>
							</form>
						</div>
						</div>	
						<div class="row">
						<c:set var="i" value="0" />
								<c:forEach var="community" items="${list}">
								<c:set var="i" value="${i+1}" />
								<article class="4u 12u(mobile) special">
									<div style="background-color: white; height:450px; padding: 10px 10px 0 10px; position: relative;">
									<input type="hidden" name="postNo" value="${community.postNo}">
									<a href="#" class="image featured"><img src="${community.thumbNailFileName}" alt="" height="245px"></a>
									<header align="center">
										<h3><a href="#">${community.title}</a></h3>
									</header>
									<p>
										${community.hashtag}
									</p>
									<div class="icons">
										<span class="glyphicon glyphicon-heart"> 10</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-eye-open"> ${community.viewCount}</span>
									</div>
									</div>
								</article>
								</c:forEach>
							</div>
					</section>
				</div>
</body>
</html>