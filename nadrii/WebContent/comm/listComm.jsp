<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Nadrii :: 나만의 나들이</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="../resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../resources/helios/assets/css/bootstrap.min.css" />	
		<link rel="stylesheet" href="../resources/helios/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="../resources/helios/assets/css/ie8.css" /><![endif]-->
				
		<script src="../resources/helios/assets/js/jquery.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
		<script src="../resources/helios/assets/js/skel.min.js"></script>
		<script src="../resources/helios/assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="../resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../resources/helios/assets/js/main.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
		
		<script type="text/javascript">
		$(function() {
			$('#searchKeyword').keydown(function(key) {
				var data = $(this).val();
				if(key.keyCode==13){
					if(data!=""){
						$('form.search').attr('method', 'POST').attr('action', '/comm/listComm').submit();
					}else{	
			 			alert("검색어를 입력해주세요");
					}
				}
			});
			
			$('.image.featured').on('click', function() {
				var postNo = $($('input[name="postNo"]')[$('.image.featured').index(this)]).val();
				self.location = "getComm?postNo="+postNo;
			});
			
			$('a[name="title"]').on('click', function() {
				var postNo = $($('input[name="postNo"]')[$('a[name="title"]').index(this)]).val();
				self.location = "getComm?postNo="+postNo;
			});	
			
			$(".author span").on("click", function(){
				var userId = $($("input[id='userId']")[$(".author span").index(this)]).val();
				//self.location="../user/getUserProfile?userId="+userId;	
			});
			
			$('[data-toggle="popover"]').popover({ 
				html: true,
				container: 'body',
				content: '<a href="#none" class="profile" style="color: #656565;" onclick="javascript:clickProfile()">프로필 조회 <span class="glyphicon glyphicon-user"></span></a> <br/><a href="#none" class="message" onclick="javascript:clickMessage()" style="color: #656565;"> 쪽지 보내기 <span class="glyphicon glyphicon-envelope"></span></a>',
				placement: 'bottom',
			});	
			
			$('button[name="addComm"]').bind('click', function() {
				self.location="addComm.jsp"
			})
		});
		
		function clickProfile(){
			alert(userId);
		}
		
		function clickMessage(){
			window.open("../message/addMessage?recevierId="+userId,"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
		}
		
		var userId;
		
		function getIndex(k){
			userId = $($("input[name='userId']")[$(".author span").index(k)]).val();
		}
		
		function getSomething(){
			
			for(var i=0; i< '${resultPage.totalCount}' ; i++){
				var postNo = $($('input[name="postNo"]')[i]).val();
				
				$.ajax({
					url: "../like/json/getLikeUserList/"+postNo,
					dataType: "json",
					async: false,
					success:function(returnData){
						
						$("article.special:nth-child("+(i+1)+") .like").empty();
						$("article.special:nth-child("+(i+1)+") .like").append(returnData.totalCount);
						
						if( ((JSON.stringify(returnData.list)).indexOf("${loginUser.userId}") == -1) || ("${loginUser.userId}"=='') || ("${loginUser.userId}" == null) ){
							$("article.special:nth-child("+(i+1)+") .heart").append('<i class="far fa-heart"></i>');
						}else{
							$("article.special:nth-child("+(i+1)+") .heart").append('<i class="fas fa-heart" name="full"></i>');
						}
					}
				});	
				
				$.ajax({
					url:"/common/listCommentByPost",
					method:"GET",
					async: false,
					data:{
						"postNo": postNo
					},
					success: function(JSONData) {
						
						$("article.special:nth-child("+(i+1)+") .comment").empty();
						$("article.special:nth-child("+(i+1)+") .comment").append(JSONData.totalCount);
						
					}
				});
			}
		}
		
		</script>
		<style type="text/css">
			#nav {
			    background-color: #3b2b48;
			    opacity: 0.7;
			}
			div.wrapper.style1{
				background-image: url("/resources/images/background_3.jpg");
			}
			#searchKeyword{
				border-radius: 30px;
				width: 400px;
				height: 50px;
				padding: 1em 1em 1em 2.5em;
			}
			.image.featured{
				margin: 0 0 1em 0;
			}
			article {
				height: 500px;
			}
			.icons {
				position: absolute;
				bottom: 10px;
				right: 10px;
			}
			.author {
				position: absolute;
				bottom: 0px;
				left: 10px;
			}
			a.author:hover {
				text-decoration: none !important;
			}
			input:focus{
				outline:none;
			}
			svg[name="full"]{
				color: #F05643 !important;
			}
			
		</style>
	</head>
	<body onload="getSomething()">
		<div id="header">
			<jsp:include page="../layout/toolbar.jsp"></jsp:include>
			<!-- Inner -->
			<div class="inner">
				<header>
					<h1><a href="../index.jsp" id="logo">NADRII</a></h1>
				</header>
			</div>
		</div>
		<div class="wrapper style1">
			<section id="features" class="container special">
				<header>
					<h2>나만의 나들이</h2>
					<p>세상에 하나뿐인 당신의 추억을 공유하세요</p>
				</header>
				<div class="continer">
					<div class="col-sm-9" align="left">
						<h6 style="color: #8a8c91;font-style:normal;">전체 ${resultPage.totalCount}개 게시물</h6>
					</div>
					<div class="col-sm-3" align="right">
						<form class="search">
							<span class="fas fa-search" style="position: relative; margin-right: -40px;"></span>
							<input type="text" name="searchKeyword" id="searchKeyword" value="" style="width: 80%"/>
						</form>
					</div>
				</div>	
				<div>
					<button style="margin-top: 5px;" type="button" class="btn btn-default" name="addComm"><span class="glyphicon glyphicon-pencil"></span></button>
				</div>
				<div class="row">
					<c:set var="i" value="0" />
					<c:forEach var="community" items="${list}">
						<c:set var="i" value="${i+1}" />
							<article class="4u 12u(mobile) special">
								<div style="background-color: white; height:450px; padding: 10px 10px 0 10px; position: relative;">
									<input type="hidden" name="postNo" value="${community.postNo}">
									<a href="#" class="image featured"><img src="${community.thumbNailFileName}" alt="" height="245px"></a>
									<header align="center">
										<h3><a href="#none" name="title">${community.title}</a></h3>
									</header>
									<p>
										${community.hashtag}
									</p>
									<div>
										<div class="author" style="float: left;"> 
											<img src="../resources/assets/images/avatar.jpg" alt="" style="border-radius: 5em; height: 100%"/>
											<a href="#none" style="position: relative;">
												<input type="hidden" name="userId" value="${community.userId}">
												<span style="vertical-align: top;" class="name" data-container="body" data-toggle="popover" onclick="javascript:getIndex(this);">&nbsp;&nbsp;${community.userId}</span>
											</a>
										</div>
										<div class="icons" style="float: right;">
											<span>view :  ${community.viewCount}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="heart"></span>&nbsp;<span class="like"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-comment"></i>&nbsp;<span class="comment"></span>
										</div>
									</div>
								</div>
						</article>
					</c:forEach>
				</div>
				<c:if test="">
				</c:if>
				<div align="center" style="font-size: medium;">
					<button type="button" name="more">더보기<span class="glyphicon glyphicon-chevron-down"></span></button>
				</div>
			</section>
		</div>
	</body>
</html>