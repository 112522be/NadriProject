<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<style type="text/css">
.popover{
	box-shadow: 0 0 0 0 rgba(0,0,0,.2) !important;	
}

.popover-content {
    padding: 8px 8px;
}
</style>

<script>

$(function(){

	$('[data-toggle="popover"]').popover(
			{ html: true,
			 container: 'body',
			 content: '<a href="#" class="profile" onclick="javascript:clickProfile()">프로필 조회 <span class="glyphicon glyphicon-user"></span></a> <br/><a href="#" class="message" onclick="javascript:clickMessage()"> 쪽지 보내기 <span class="glyphicon glyphicon-envelope"></span></a>',
			 placement: 'bottom',
			 }
			);	
});

function clickProfile(){
	alert('${group.join.userId}');
}

function clickMessage(){
	alert('${group.join.userId}');
}

</script>
</head>
<body>
</body>
</html>