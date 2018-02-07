<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('button.btn.btn-default:contains("쪽지보내기")').bind('click', function() {
			alert("쪽지보내기!");
		})
	})
</script>
</head>
<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
	<div class="container" align="center">
		<div align="center">
			<h3>${community.title}</h3>
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
	<jsp:include page="../common/comment.jsp"></jsp:include>
</body>
</html>