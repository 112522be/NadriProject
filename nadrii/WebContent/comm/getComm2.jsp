<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>나들이 티켓 상세조회</title>

<meta charset="UTF-8">


<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	<!-- Scripts -->
	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script> 
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>
	
	
	<script type="text/javascript">
	
	// ========== getComm.jsp function START ========== //
	$(function(){
		$(".icon.fa-edit").bind("click", function(event){
			
			event.preventDefault();
			self.location="/comm/updateCommView?postNo=${community.postNo}";
		});
		
		$(".icon.fa-eraser").bind("click", function(event){
			event.preventDefault();
			if(confirm("삭제하시겠습니까?")==true){
				self.location="/comm/deleteComm?postNo=${community.postNo}";
				alert("삭제되었습니다.");
			}else{
				return;	
			}		
		});
		
		$( function() {
		    $( "#accordion" ).accordion({
		      collapsible: true
		    });
		} );
	});

	function clickProfile(){
		alert('${group.join.userId}');
	}

	function clickMessage(){	
		window.open("/message/addMessage?recevierId="+'${group.join.userId}',"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
	}

	function addLike(){
		
		$.ajax({
			url: "../like/json/addLike/"+groupNo,
			method: "POST",
			dataType: "json",
			success:function(returnData){
				getCountLike();
			}
		});	
		
	}

	var likeCount;

	function getCountLike(){
		
		$.ajax({
			url: "../like/json/getCountLike/"+groupNo,
			method: "POST",
			dataType: "json",
			success:function(returnData){
				
				likeCount = returnData.totalCount;

			}
		});	
	}

	$(function(){
		$(".like").bind("click", function(){
			alert(1);
		});
	});
	
	// ========== getComm.jsp function END ========== //
	
	
	// ========== comment.jsp function START ========== //
	
	var postNo = $('input[name="postNo"]').val();
	function listComment() {
		$.ajax({
			url:"/common/listCommentByPost",
			method:"GET",
			data:{
				"postNo": postNo
			},
			success: function(JSONData) {
				$('#commentContainer').empty();
				for(i=0;i<JSONData.totalCount;i++){
					var html = '<div class="comments"><span class="col-xs-1" style="float: left; padding: 0;"><input type="hidden" name="commentNo" value="'
					+JSONData.listComment[i].commentNo
					+'"><img src="/resources/images/00742106_105752.jpg" alt="${user.userId}" class="img-circle" width="40px" height="40px"></span><span class="col-xs-15" style="padding-left: 30px;"><span style="color: black;">'
					+JSONData.listComment[i].userId
					+'</span>&nbsp;<span style="color: gray; font-size:10pt; padding: 0;">'
					+JSONData.listComment[i].regDate
					+'</span><br/><span class="text" style="padding-left: 30px;">'+JSONData.listComment[i].text+'</span></span><span class="col-xs-2 edit" style="float: right; padding: 0;">';
					if("${loginUser.userId}"==JSONData.listComment[i].userId){
						html += '<span class="glyphicon glyphicon-pencil" style="font-size:10pt;"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-trash" style="font-size:10pt;"/>';
					}
					html += '</span></div><hr style="margin-bottom: 5em; position: absolute; border: 0; top: 0; height: 0;"/>'
					$('#commentContainer').append(html);
				}
				$(".comment").empty();
				$(".comment").append(JSONData.totalCount);
			}
			
		});
	}
	function addComment() {
		var userId = $('input[name="userId"]').val();
		var text=$('input[name="text"]').val();
		$.ajax({
					url:"/common/addComment",
					dataType:"json",
					method:"POST",
					headers : {
						"Accept" : "application/json",
					},
					data:{
						"postNo": postNo,
						"text": text,
						"userId": userId
					},
					success: function(JSONData) {
						$('input[name="text"]').val("");
						$('#commentContainer').empty();  
						listComment();
					},
					error: function() {
						alert("알 수 없는 오류가 발생했습니다.")
					}
		})
	}
	function updateComment(commentNo, text) {
		$.ajax({
			url: '/common/updateComment',
			method:'POST',
			headers:{
				"Accept" : "application/json",
			},
			data:{
				"commentNo": commentNo,
				"text": text
			},
			success: function() {
				$('input[name="text"]').val("");
				$('#commentContainer').empty();
				alert('수정을 완료했습니다.');
				listComment();
			},
			error: function() {
				$('input[name="text"]').val("");
				$('#commentContainer').empty();
				alert("수정을 실패했습니다.");
				listComment();
			}
			
		})
	} 
		
	$(function() {
		$('body').load('like.jsp', function() {
			getLike();
			listComment();
		})
		
		$('div[name="submitComment"]').bind('click', function() {
			addComment();
		});
		
		var text;
		var commentNo;
		
		$('#commentContainer').on('click','span.glyphicon.glyphicon-pencil',function() {
			text = $($('span.text')[$(".glyphicon.glyphicon-pencil").index(this)]).html();
			commentNo = $($('input[name="commentNo"]')[$(".glyphicon.glyphicon-pencil").index(this)]).val();
			
			var editForm = '<span style=" position: relative; float: left; width: 78%; padding-left: 25px"><input name="editText" class="form-control" type="text" value="'+text+'"/></span><div class="button" style="float: right; position: relative; padding: 0; font-size: 12pt; width: 12%; height: 1.8%" name="update">수정</div>';
			
			$($('span.text')[$(".glyphicon.glyphicon-pencil").index(this)]).html(editForm);
			$($('span.edit')[$(".glyphicon.glyphicon-pencil").index(this)]).css("display","none");
			$($('div.comments')[$(".glyphicon.glyphicon-pencil").index(this)]).attr("style", "margin-bottom: -10em;");
			$($('span.text')[$(".glyphicon.glyphicon-pencil").index(this)]).removeAttr("style");
		});
		
		$('#commentContainer').on('click', 'div[name="update"]', function() {
			alert(commentNo);
			text = $('input[name="editText"]').val();
			updateComment(commentNo, text);
		});
		
		$('#commentContainer').on('click', 'span.glyphicon.glyphicon-trash',function() {
			if(confirm("삭제하시겠습니까?")==true){
				var commentNo = $($('input[name="commentNo"]')[$(".glyphicon.glyphicon-trash").index(this)]).val();
				$.ajax({
					url: '/common/deleteComment',
					method:'POST',
					data:{
						"commentNo": commentNo,
						"postNo": postNo
					}, 
					success: function(JSONData) {
						$('input[name="text"]').val("");
						$('#commentContainer').empty();
						alert('삭제를 완료했습니다.');
						listComment();
					},
					error: function() {
						$('input[name="text"]').val("");
						$('#commentContainer').empty();
						alert("삭제에 실패했습니다.");
						listComment();
					}
					
				});
			}else{
				return;
			}
		})
	})
	
	
	// ========== comment.jsp function START ========== //
	
	
	
	</script>
</head>

<body class="no-sidebar">
	<div id="page-wrapper">
	
		<!-- Header -->
		<div id="header">

			<div class="inner">
				<header>
					<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
				</header>
			</div>
					
				<jsp:include page="/layout/toolbar.jsp" />

		</div>

<form action="navigation">			
		<!-- Main -->
		<div class="wrapper style1">
		
			<div class="container">
				<article id="main" class="special">
					
					<header>
						<h2>
							<a href="#">${community.title}</a>
						</h2>
						<p class="icon fa-">
							Test Example
						</p>
					</header>
					
						<div class="row 25% no-collapse">
							<div class="4u">
								<h3 class="icon fa-user" align="left">&nbsp;&nbsp;${community.userId}</h3>
							</div>
							<div class="4u">
								<h3 class="icon fa-eye" align="right">&nbsp;&nbsp;${community.viewCount}</h3>
							</div>
							<div class="4u">
								<h3 class="icon fa-history" align="right">&nbsp;&nbsp;${community.regDate}</h3>
							</div>
						</div>
						
						<br>	

						<!-- <a href="#" class="image featured"><img src="/resources/helios/images/pic06.jpg" alt="" /></a> -->
						${community.text}	
						
							
				</article>
			<hr/>
			</div><!-- container End -->		
		
		
			<div class="container">	
			
				<div class="row 25% no-collapse">
					
					<article class="8u">
						<header>
							<h3 class="icon fa-hashtag" align="left">&nbsp;&nbsp;${community.hashtag}</h3>
						</header>	
					</article>

					<article class="2u">
						<header>
							<h3 class="icon fa-comment" align="right">&nbsp;&nbsp;</h3>
						</header>
					</article>
					
					<article class="2u">
						<header>
							<h3 class="icon fa-heart" align="right" >&nbsp;&nbsp;</h3>
						</header>
					</article>
					
				</div><!-- row 25% no-collapse End -->
				
				<hr />
				
				<!-- 댓글 
				<div class="row">
				
					<article class="10u 12u(mobile) special">
						<header>
							<input type="text" placeholder="댓글을 입력하세요.">
						</header>	
					</article>
					
					<article class="2u 12u(mobile) special">
						<header>
							<h3>
								<a href="#" class="button">submit</a>
							</h3>
						</header>
					</article>
					
				</div><!-- row End -->
				
				
				<!-- <article id="main" class="special">
				
					<div class="row 50%">
						
						<div class="2u">
							<a href="#" class="image fit">
								<img src="/resources/helios/images/pic10.jpg" alt="" style="width: 60px; height: 60px;">
							</a>
						</div>
						<div class="10u">
							<h4>Nibh sed cubilia</h4>
							<p>Amet nullam fringilla nibh nulla convallis tique ante proin.</p>
						</div>
						
					</div>

				</article> -->
				
				
				
				
				
				
				
				<!-- ........................................................................... -->
			
				<div class="row">
					<article class="12u 12u(mobile) special">
						<header>
							<jsp:include page="../common/comment.jsp"></jsp:include>
						</header>	
					</article>
				</div><!-- row End -->

				<div class="row">
					<article class="2u 12u(mobile) special">
						<header>
							<input type="hidden" name="postNo" value="${community.postNo}">
							<jsp:include page="../common/like.jsp"/>
						</header>	
					</article>
					<article class="2u 12u(mobile) special">
						<header>
							<div id="commentContainer"></div>
						</header>	
					</article>
				</div><!-- row End -->
				
				
				<!-- 수정/삭제 -->
				<c:if test="${community.userId == loginUser.userId}">
				<hr>
				<div class="row 25% no-collapse">
					
					<article class="6u">
						<header>
							<h2 class="icon fa-edit" align="center">&nbsp;&nbsp;수 정</h2>
						</header>
					</article>
					<article class="6u">
						<header>
							<h2 class="icon fa-eraser" align="center">&nbsp;&nbsp;삭 제</h2>
						</header>
					</article>
					
				</div><!-- row 25% no-collapse End -->
				</c:if>
				
				
				
				
				
				
				
				
			</div><!-- container End -->	

		</div>
</form>

		<jsp:include page="/layout/footer.jsp" />

	</div>

	

</body>


</html>