<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".heart").on("click", function() {
		$(this).toggleClass("heart-blast");
	});
}); 
</script>
<style type="text/css">
.heart {
  width: 100px;
  height: 100px;
  position: relative;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  background: url(https://cssanimation.rocks/images/posts/steps/heart.png) no-repeat;  
  cursor: pointer;
  
}
.heart-blast {
  background-position: -2800px 0;
  transition: background 1s steps(28);
}
</style>
</head>
<body>
<div class="heart"></div>
</body>
</html>