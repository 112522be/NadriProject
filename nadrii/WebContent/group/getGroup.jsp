<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="../resources/assets/js/1jquery.min.js"></script>
<script src="../resources/assets/js/1skel.min.js"></script>
<script src="../resources/assets/js/1util.js"></script>
<script src="../resources/assets/js/1main.js"></script>
<style type="text/css">
footer a{
	color: #555 !important;
}
.post > footer {
	background : #ffff;
}

.navbar {
    margin-bottom: 0px !important;
	}

#groupName {
					display: inline-block;
					font-family: "Raleway", Helvetica, sans-serif;
					font-size: 0.6em;
					font-weight: 400;
					letter-spacing: 0.25em;
					line-height: 1;
					margin: 0 0 0 0em;
					padding: 0 2em 0 0em;
					float: left;
				}

#count {
					display: inline-block;
					font-family: "Raleway", Helvetica, sans-serif;
					font-size: 0.6em;
					font-weight: 400;
					letter-spacing: 0.25em;
					line-height: 1;
					margin: 0 0 0 2em;
					padding: 10px 2em 0 2em;
					float: right;
				}

</style>
<script>

$(function(){
	if("${loginUser.userId}" == "${group.join.userId}"){
		$("#userMenu").css("display","block");
	}
	
	$("#write").bind("click", function(){
		self.location="../group/addGroup";
	});
	
	$("#list").bind("click", function(){
		self.location="../group/listGroup";
	});
	
	$("#modify").bind("click", function(){
		self.location="../group/updateGroup?groupNo=${group.join.groupNo}";
	});
	
	$("#delete").bind("click", function(){
		if(confirm("삭제하시겠습니까?")==true){
			self.location="../group/deleteGroup?groupNo=${group.join.groupNo}";
			alert("삭제되었습니다.");
		}else{
			return;	
		}		
	});
	
	
});

</script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
<div id="main">
<section class="two">
	<div class="container">
	<a href="#" id="write" class="button small write" style="position: relative; float:right; margin-top: -40px; margin-right: 80px">write</a>
	<a href="#" id="list" class="button small" style="position: relative; float:right; margin-top: -40px;">list</a>
			<article class="post">
				<header>
					<div class="title" style="overflow: hidden">
						<h2>${group.title}</h2>
						<div>
							<ul id="groupName" style="overflow: hidden">
								<li>${group.groupName}</li>
							</ul>
							<ul id="count">
								<li>view : ${group.viewCount}</li>
							</ul>
						</div>
					</div>
					
					<div class="meta">
						<time class="published" datetime="${group.regDate}">${group.regDate}</time>
						<a href="#" class="author"><span class="name">${group.join.userId}</span>
						<img src="../resources/assets/images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				
				
				<a href="#" class="image featured">
					<img src="../resources/assets/images/pic01.jpg" alt=""/>
				</a>
				<p>${group.text}</p>
				
				<footer>
					<ul class="stats">
						<li><a href="#" class="icon fa-heart">28</a></li>
						<li><a href="#" class="icon fa-comment">128</a></li>
					</ul>
				</footer>
				<div id="userMenu" style="float: right; margin-top: -3em; display: none;">
					<a href="#" id="modify" class="button small modify">modify</a>
					<a href="#" id="delete" class="button small delete">delete</a>
				</div>
			</article>
	</div>
	</section>
	</div>
</body>
<link rel="stylesheet" href="../resources/assets/css/main.css?version=0206455" />
</html>