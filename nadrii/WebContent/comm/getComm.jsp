
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src=""></script>
<script type="text/javascript">
	$(function() {
		$('button.btn.btn-default:contains("쪽지보내기")').bind('click', function() {
			alert("쪽지보내기!");

		})
	})

		
	$(function () {
		$('button.btn.btn-default').bind('click', function() {
			$(this).popover()
		})
	})

</script>
</head>
<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
	<div class="container" align="center">
		<div align="center">
			<h3>${community.title}</h3>
			<br/>
			<div class="col-xs-6">
				<p align="left" class="" color="gray">${community.regDate}</p>
			</div>
			<div class="col-xs-6">
				<p align="right" class="" color="gray">조회수&nbsp;${community.viewCount}</p>
			</div>
			<br/>
			<hr/>
		</div>
		<div>
			${community.text}
		</div>
	</div>
	<br/><br/><br/>
	<div class="container" align="right">
		Profile
		<h3 style="bold">${user.userId}</h3>
		<p>${user.email}<p/>
		<button type="button" class="btn btn-default">쪽지보내기</button>
	</div>
	<div class="container">
		<img alt="" src="/resources/images/hashtag.png" width="30px" height="25px"><span>${community.hashtag}</span>
	</div>
	<jsp:include page="../common/comment.jsp"></jsp:include>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28f2a580a6a043772106fd68ca5e3561&libraries=services"></script>
	<script type="text/javascript" src="/resources/js/map_2.js"></script>
</body>
</html>