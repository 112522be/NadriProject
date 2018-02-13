
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="../resources/assets/js/1jquery.min.js"></script>
<script src="../resources/assets/js/1skel.min.js"></script>
<script src="../resources/assets/js/1util.js"></script>
<script src="../resources/assets/js/1main.js"></script>
<style type="text/css">
footer a{
	color: #555 !important;
}

footer{
	background: #ffffff !important;
}

.button.fit {
	margin-top: 10px !important; 
	font-size: 1em;
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

table {
	float: left !important;
}
table td {
	font-size: 0.6em;
    padding: 0.05em 1.3em !important;
}

section > :last-child, section > .container, section:last-child, article > :last-child, article > .container, article:last-child {
    margin-bottom: -35px !important;
}

.author .name{
	margin: 0 10px 0 0 !important;
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
	
	$('[data-toggle="popover"]').popover(
			{ html: true,
			 container: 'body',
			 content: '<a href="#none" class="profile" onclick="javascript:clickProfile()">프로필 조회 <span class="glyphicon glyphicon-user"></span></a> <br/><a href="#none" class="message" onclick="javascript:clickMessage()"> 쪽지 보내기 <span class="glyphicon glyphicon-envelope"></span></a>',
			 placement: 'bottom',
			 }
			);	
});

function clickProfile(){
	alert('${group.join.userId}');
}

function clickMessage(){	
	window.open("/message/addMessage?recevierId="+'${group.join.userId}',"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
}
</script>

</head>
<body>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
<div id="main">
<section class="two">
	<div class="container">
	<a href="#none" id="write" class="button small write" style="position: relative; float:right; margin-top: -40px; margin-right: 80px">write</a>
	<a href="#none" id="list" class="button small" style="position: relative; float:right; margin-top: -40px;">list</a>
			<article class="post">
				<header>
					<div class="title" style="overflow: hidden">
						<h2>${group.title}</h2>
						<div>
							<ul id="count">
								<li>view : ${group.viewCount}</li>
							</ul>
						</div>
					</div>
					
					<div class="meta">
						<time class="published" datetime="${group.regDate}">${group.regDate}</time>
						<a href="#none" class="author"><span class="name" data-container="body" data-toggle="popover">${group.join.userId}</span>
						<img src="../resources/assets/images/avatar.jpg" alt="" /></a>
					</div>
				</header>

				<div class="table-wrapper" style="width: 30%">
					<jsp:include page="./join.jsp"></jsp:include>	
				</div>
				<br/>
				<div>
				<p>${group.text}</p>
				</div>
				<input type="hidden" name="postNo" value="${group.join.groupNo}">
				<jsp:include page="./like.jsp"></jsp:include>	
				<div id="userMenu" style="float: right; margin-top: -3em; display: none;">
					<a href="#none" id="modify" class="button small modify">modify</a>
					<a href="#none" id="delete" class="button small delete">delete</a>
				</div>
	
			</article>
	
	</div>
	
	</section>
	<jsp:include page="../common/comment.jsp"></jsp:include>
	</div>
	
</body>
<link rel="stylesheet" href="../resources/assets/css/main.css?version=0206455" />
</html>