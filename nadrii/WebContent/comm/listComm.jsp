<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Nadrii :: ������ ������</title>
<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript">
$(function() {
	$('article.item').on('click', function() {
		var postNo = $($('input[name="postNo"]')[$('.item').index(this)]).val()
		self.location = "getComm?postNo="+postNo;
	})
	$('#searchKeyword').keydown(function(key) {
			var data = $(this).val();
			if(key.keyCode==13){
				if(data!=""){
				$('form.search').attr('method', 'POST').attr('action', '/comm/listComm').submit();
				}else{	
	 				alert("�˻�� �Է����ּ���");
				}
			}
	})
})
</script>
<style type="text/css">
	div.wrapper.style1{
		background-image: url("/resources/images/background_3.jpg");
	}
	#searchKeyword{
		border-radius: 30px;
		width: 300px;
	}
</style>
</head>
<body>
	<div class="wrapper style1">
					<section id="features" class="container special">
						<header>
							<h2>������ ������</h2>
							<p>���� �ϳ����� ����� �߾��� �����ϼ���</p>
						</header>
						<div class="continer">
						<div class="col-xs-6" align="left">
							<h6 style="color: #aeb1b7;font-style:normal;">��ü ${resultPage.totalCount}�� �Խù�</h6>
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
									<article class="4u 12u(mobile) special" style="height:500px;">
										<div style="background-color: white;">
											<img src="${community.thumbNailFileName}" alt="" height="245px" width="368px" style="margin-bottom: 20px"/>
											<header align="center">
												<h3><a href="#">${community.title}</a></h3>
											</header>
											<p style="margin: 10px 0 0 10px; font-size: 15px;">
												${community.hashtag}
											</p>
										</div>
									</article>
								</c:forEach>
							</div>
					</section>
				</div>
</body>
</html>