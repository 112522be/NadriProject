<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Autocomplete - Default functionality</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script>
	$(function() {
		$(document).ready(function() {
			if($('input[name="userId"]').val()==null || $('input[name="userId"]').val()==""){
				alert("로그인 후 이용해주세요")
				self.location="../user/loginView.jsp"
			}
		})
		$('a#submit').bind('click', function() {
			var hashtags=',';
			$('button.selectedhashtagButtons').each(function() {
				hashtags += $(this).val();
			})
			$('input[name="hashtag"]').val(hashtags);
			if("${menu}"=="update"){
				$('form[name=postData]').attr("action", "updateComm").attr("method", "POST").submit();
			}else{
				$('form[name="postData"]').attr("action", "addComm").attr("method", "POST").submit();
			}
		})
	})
	</script>
	<style type="text/css">
		.body{
			background: #e6ebed;
		}
	</style>
</head>
	<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
	<div class="body">
	<div class="container" align="center">
	<br/>
		<form name="postData">
			<input type="hidden" name="postNo" value="${community.postNo}">
			<input type="hidden" name="userId" value="${loginUser.userId}">
			<div class="form-group">
			    <input type="title" class="form-control" name="title" placeholder="제목을 입력하세요" value="${community.title}">
			 </div>
			 <div>
			  	<jsp:include page="noteEditor.jsp"></jsp:include>
			 </div>
	 		 <br/>
			 <div id="cndHashTags">
			 	<c:set var="i" value="0" />
			 	<c:forEach var="hashtags" items="${hashtags}">
			 		<c:set var="i" value="${i+1}" />
			 			<button type="button" class="selectedhashtagButtons" value="${hashtags},"><span class="glyphicon glyphicon-ok"></span>&nbsp;#${hashtags}</button>&nbsp;
			 	</c:forEach>
			 </div>
			 <br/>	
		</form> 
		<div class="box-bottom" >
			<a id="submit">저장하기</a>
		</div>
		<br/>
	</div>	
	</div>
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/resources/css/style.css"/>
	<link rel="stylesheet" href="/resources/skins/default.css"/>
	</body>
</html>