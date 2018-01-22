<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function addComment(comment) {
		console.log(comment);
		$('body').append('<div class="container"><p/>'+comment+'<div/>');
	}
	$(function() {
		$('textarea.form-control').bind('click', function() {
			$(this).empty();
		})
		$('button.btn.btn-info:contains("댓 글")').bind('click', function() {
			var comment=$('textarea.form-control').val();
			addComment(comment);
		})
	})
</script>
</head>
<body>
	<div class="container">
		<p/>
		<hr/>
		<div>
			<div class="col-md-11">
				<textarea class="form-control" rows="3" >댓글을 입력하세요</textarea>
			</div>
			<div class="col-md-1">
				<button align="right" type="button" class="btn btn-info" name="submitComment">댓 글<p/>저 장</button>
			</div>
		</div>
	</div>
</body>
</html>