<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Autocomplete - Default functionality</title>
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="../resources/helios/assets/js/jquery.min.js"></script>
	<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
	<script src="../resources/helios/assets/js/skel.min.js"></script>
	<script src="../resources/helios/assets/js/util.js"></script> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
		<script src="/resources/helios/assets/js/jquery.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/helios/assets/js/main.js"></script>
	<script>
	$(function() {
		$(document).ready(function() {
			if($('input[name="userId"]').val()==null || $('input[name="userId"]').val()==""){
				self.location="../user/loginView.jsp"
			}
		})
		$('a#submit').bind('click', function() {
			var hashtags=',';
			$('button.selectedhashtagButtons').each(function() {
				hashtags += $(this).val()+',';
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
<body class="no-sidebar">
	<div id="page-wrapper">
		<div id="header">
				<jsp:include page="../layout/toolbar.jsp"></jsp:include>
				<!-- Inner -->
				<div class="inner">
					<header>
						<h1><a href="../index.jsp" id="logo">N A D R I I</a></h1>
					</header>
				</div>
			</div>
		<div class="body">
			<div class="wrapper style1">
				<div class="container" align="center">
				<br/>
					<form name="postData">
					<c:if test="${community.postNo != null}">			
						<input type="hidden" name="postNo" value="${community.postNo}">
					</c:if>
						<input type="hidden" name="userId" value="${loginUser.userId}">
						<%-- ${loginUser.userId} --%>
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
		</div>
	</div>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>