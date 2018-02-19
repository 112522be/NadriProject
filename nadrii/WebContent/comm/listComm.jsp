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
<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript">
$(function() {
	$('div.articles').on('click', function() {
		var postNo = $($('input[name="postNo"]')[$('.articles').index(this)]).val()
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
	#nav {
	    background-color: #3b2b48;
	    opacity: 0.7;
	}
	div.wrapper.style1{
		background-image: url("/resources/images/background_3.jpg");
	}
	#searchKeyword{
		border-radius: 30px;
		width: 300px;
	}
	.image.featured{
		margin: 0 0 1em 0;
	}
</style>
</head>
<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
	<div class="wrapper style1">
					<section id="features" class="container special">
						<header>
							<h2>나만의 나들이</h2>
							<p>세상에 하나뿐인 당신의 추억을 공유하세요</p>
						</header>
						<div class="continer">
						<div class="col-xs-6" align="left">
							<h6 style="color: #aeb1b7;font-style:normal;">전체 ${resultPage.totalCount}개 게시물</h6>
						</div>
						<div class="col-xs-6" align="right">
							<form class="search">
								<input type="text" name="searchKeyword" id="searchKeyword" value="" width="300px">
							</form>
						</div>
						</div>	
						<div class="row">
						<c:set var="i" value="0" />
								<c:forEach var="community" items="${list}">
								<c:set var="i" value="${i+1}" />
									<div class="articles">
									<article class="4u 12u(mobile) special" >
										<input type="hidden" name="postNo" value="${community.postNo}">
										<div style="background-color: white;">
										<a href="#" class="image featured">
											<img src="${community.thumbNailFileName}" alt="" height="245px" width="368px"/>
										</a>
										<div style="padding:0 10px 0 10px;">
										<header align="center">
											<h3><a href="#">${community.title}</a></h3>
										</header>
										<p>${community.hashtag}</p>
										<div align="right">
											<span class="glyphicon glyphicon-heart"> 10</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-eye-open"> ${community.viewCount}</span>
										</div>
										</div>
										</div>
									</article>
									</div>
								</c:forEach>
							</div>
					</section>
				</div>
</body>
</html>