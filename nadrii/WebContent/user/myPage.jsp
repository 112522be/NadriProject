<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!--  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<!-- tabs -->
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	  <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.button01 {
    	font-size: 14px;
    	padding: 20px 0 18px;
   		font-weight: 700;
   		width: 30%;
   		position: relative;
   		outline: 0;
   		border: 0;
	}
	hr {
    position: relative;
    display: block;
    top: 0;
    margin-bottom: 0;
    height: 0;
    border: 0;
    width: 95%;
    border-top: solid 1px rgba(128, 128, 128, 0.2);
    border-bottom: solid 1px rgba(128, 128, 128, 0.2);
}
</style>
<script type="text/javascript">
	var currentPage = 1;
	var maxPage;
	$(function() {
		$('a.col-xs-4').bind('click', function() {
			$('a.col-xs-4').css("border", "0")
			$('span.button01').css("color", "#5b5b5b")
			$(this).css("border-bottom", "4px solid #FE8A71");
			$(this).children().css("color", "#FE8A71")
			if($(this).children().html() == "좋아요"){
				getLike('add');
			}else if($(this).children().html() == "댓글"){
				getComments('add');
			}else{
			}
		})
		$('#logContainer').on('click', 'a.more', function() {
			if(currentPage < maxPage){
			    currentPage++;
			    if($('#logContainer').find('input[name="type"]').val() == "좋아요"){
			    	getLike("update");
			    }else if($('#logContainer').find('input[name="type"]').val() == "댓글"){
			    	getComments("update");
			    }else{
			    	
			    }
			        
			}else{
			    return;
			}
		})	
	})

	function listMessage() {
		$.ajax({
			url:"/message/json/listMessage/"+'${loginUser.userId}',
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},						
			success: function(JSONData){
				$("tbody tr").remove();
				var message = JSONData.list;
				var tableValue ='<div align="right" style="font-size:12pt; padding:1%;"><a id="received" name="received">받은쪽지</a>&nbsp;&nbsp;<a name="sended">보낸쪽지</a></div>';
								
				
				for (var i = 0; i < message.length; i++) {
					tableValue += '<div class="row" style="padding-left: 2.5%;">'
					+'<div class="col-xs-2">'
					+'<input type="checkbox" name="checkbox" id="checkbox" value="'
			        +message[i].messageNo+'">&nbsp;'
			        +message[i].senderId
					+'</div>'
					+'<div class="col-xs-7">'
					+message[i].text
					+'</div>'
					+'<div class="col-xs-3" align="center" style="color: gray; font-size:12pt;">'
					+'<span>'+message[i].regDate+'.</span>'
					+'</div>'
					+'</div>'
					+'<hr/>';
			    }
				$('#logContainer').html(tableValue);
				$('#logContainer').on('click', 'a[name="received"]:contains("받은쪽지")',function() {
					alert();
					listMessage();
				})
				$('#logContainer').on('click', 'a[name="sended"]:contains("보낸쪽지")',function() {
					alert();
					listSendMessage();
				})
			}
		});
	}
	function listSendMessage(){
		$.ajax({
			url:"/message/json/listSendMessage/"+'${loginUser.userId}',
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},						
			success: function(returnData){
				var message = returnData.list;
				var tableValue ='<div align="right" style="font-size:12pt; padding:1%;"><a id="received" name="received">받은쪽지</a>&nbsp;&nbsp;<a name="send">보낸쪽지</a></div>';
								
				
				for (var i = 0; i < message.length; i++) {
					tableValue += '<div class="row" style="padding-left: 2.5%;">'
						+'<div class="col-xs-2">'
						+'<input type="checkbox" name="checkbox" id="checkbox" value="'
				        +message[i].receiverId+'">&nbsp;'
				        +message[i].senderId
						+'</div>'
						+'<div class="col-xs-7">'
						+message[i].text
						+'</div>'
						+'<div class="col-xs-3" align="center" style="color: gray; font-size:12pt;">'
						+'<span>'+message[i].regDate+'.</span>'
						+'</div>'
						+'</div>'
						+'<hr/>'
					$("#logContainer").html(tableValue);
			    }
			}
		});
	}
	$(function(){
		
		$(document).on("click","tr td:nth-child(4)", function(){
		//$("tr td:nth-child(4)").on("click",function(){
			var messageNo = $($("input[name='checkbox']")[$("tr td:nth-child(4)").index(this)]).val();
			//alert(messageNo)
			window.open("/message/getMessage?messageNo="+messageNo,"getMessge","width=300, height=350,status=no, scrollbars=no, location=no");
		});
	});
	
	
	function deleteMessage(messageNoList){
		$.ajax({
			url:"/message/json/deleteMessage/"+messageNoList,
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},						
			success: function(returnData){
				var count = returnData.count;
				alert(count+"개의 메시지가 삭제되었습니다");
				for (var i = 0; i < count; i++) {
					$($("input[name=checkbox]:checked").parents("td")).parents("tr").remove();					
				}
				
				
			}
			
		});
	}
	
	$(function(){
		$("button[type='button']:contains('삭제')").on("click",function(){
			//alert("삭제");
			var checkedMessageCount = $("input[name=checkbox]:checked").length;
			var messageNoList="";
			
			
			for (var i = 0; i < checkedMessageCount; i++) {
				if(i != checkedMessageCount-1){
					var value = $($("input[name=checkbox]:checked")[i]).val()+","; 
				}else{
					var value = $($("input[name=checkbox]:checked")[i]).val();
				}
				
				messageNoList += value;
			
			}
			
			alert(messageNoList);
			deleteMessage(messageNoList);
		});
	});
	
	function getLike(menu) {
		if(menu == 'add'){
			currentPage=1;
		}
		$.ajax({
			url: "/like/json/listLikeById",
			method: "GET",
			data: {
				"currentPage": currentPage,
				"searchKeyword": "${loginUser.userId}"
			},
			headers: {
				"Accept": "application/json"
			},
			success: function(JSONData) {
				if(JSONData.totalCount%12 == 0){
					maxPage = JSONData.totalCount / 12;
				}else{
					maxPage = Math.floor(JSONData.totalCount / 12)+1;
				}
				console.log(maxPage);
				var html='<div class="likes" align="center"><input type="hidden" name="type" value="좋아요">';
				if(currentPage > 1){
					html += '<hr/>';
				}
				console.log(JSONData)
				for(var i=0;i<JSONData.list.length;i++){
					html += '<div class="row" style="padding: 1em 0 0 0; margin: 1em 0 1em 0;">'
						+'<div class="col-xs-3" align="center" style="padding:0; color: gray;">'
						+'<span>'+JSONData.yearNMonth[i]+'.</span>'
						+'<span style="font-size:2em; font-weight:700">'+JSONData.day[i]+'</span>'
						+'</div>'
						+'<div class="col-xs-3" align="center" style="padding-top:0; padding-left: 0; padding-right: 0;">';
						if(JSONData.title[i] != null){
							html += '<i class="fas fa-heart" style="color: #F05643; font-size:1em; "></i>&nbsp;좋아요'
							+'</div>'
							+'<div class="col-xs-6" align="left" style="padding-top:0; padding-left: 0;">'
							+'<p id="addedTitle" style="padding: 0 0 0 5%;"><span style="font-size: 1em; font-weight: 900; color: #3b2b48">'
							+JSONData.title[i]+'<input type="hidden" name="postNo" value="'+JSONData.list[i].postNo+'">';
						}else{
							html += '</div>'
								+'<div class="col-xs-6" align="left" style="padding-top:0; padding-left: 0;">'
							+'<p id="addedTitle" style="padding: 0 0 0 5%;;"><span style="font-size: 1em; font-weight: 900; color: #3b2b48">' 
							+"삭제된 게시물입니다."
						}
						html +='</span></p>'
						+'</div>'
						+'</div>';
						if(i != JSONData.list.length-1){
							html += '<hr/>';
						}
				}
				if(currentPage < maxPage){
					html+='<a class="more">+ 더보기</a></div>'
				}
				if(menu == 'add'){
					$('#logContainer').html(html);
				}else{
					$('#logContainer').find('a.more').remove();
					$('#logContainer').append(html);
				}
				$('#logContainer').on('click', 'p#addedTitle', function() {
					var postNo = $($('input[name="postNo"]')[$('p#addedTitle').index(this)]).val();
						if(postNo == null){
							alert("삭제된 게시물입니다.");
						}else{
							if(postNo.indexOf("60") != 0 && postNo.indexOf("40") != 0){
								self.location = "/comm/getComm?postNo="+postNo;
							}else if(postNo.indexOf("40") != 0){
								self.location = "/group/getGroup?groupNo="+postNo;
							}else{
								self.location = "/planner/getPlanner?postNo="+postNo;
							}
						}
					})
				}
			})
		}
	function getComments(menu) {
		if(menu == 'add'){
			currentPage=1;
		}
		$.ajax({
			url: "/common/listCommentById",
			method: "GET",
			data: {
				"currentPage": currentPage,
				"searchKeyword": '${loginUser.userId}'
			},
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			success: function(JSONData) {
				console.log(JSONData)
				if(JSONData.totalCount%12 == 0){
					maxPage = JSONData.totalCount / 12;
				}else{
					maxPage = Math.floor(JSONData.totalCount / 12)+1;
				}
				console.log(maxPage);
				var html = '<div class="comments" align="center"><input type="hidden" name="type" value="댓글">';
				if(currentPage > 1){
					html += '<hr/>';
				}
				for(var i=0;i<JSONData.comments.length;i++){
					html += '<div class="row" style="padding: 1em 0 0 0; margin: 1em 0 1em 0;">'
						+'<div class="col-xs-3" align="center" style="padding:0; color: gray;">'
						+'<span>'+JSONData.yearNMonth[i]+'.</span>'
						+'<span style="font-size:2em; font-weight:700">'+JSONData.day[i]+'</span>'
						+'</div>'
						+'<div class="col-xs-3" align="center" style="padding-top:0; padding-left: 0; padding-right: 0;">';
						if(JSONData.title[i] != null){
							html += '<i class="fas fa-comment" style="font-size:1em;"></i>&nbsp;댓글'
							+'</div>'
							+'<div class="col-xs-6" align="left" style="padding-top:0; padding-left: 0;">'
							+'<p id="addedTitle" style="padding: padding: 0 0 0 5%;"><span style="font-size: 1em; font-weight: 900; color: #3b2b48">'
							+JSONData.title[i]+'<input type="hidden" name="postNo" value="'+JSONData.comments[i].postNo+'">';
						}else{
							html += '</div>'
								+'<div class="col-xs-6" align="left" style="padding-top:0; padding-left: 0;">'
							+'<p id="addedTitle" style="padding: padding: 0 0 0 5%;"><span style="font-size: 1em; font-weight: 900; color: #3b2b48">' 
							+"삭제된 게시물입니다."
						}
						html +='</span></p>'
						+JSONData.comments[i].text
						+'</div>'
						+'</div>';
						if(i != JSONData.comments.length-1){
							html += '<hr/>';
						}
				}
				if(currentPage < maxPage){
					html+='<a class="more">+ 더보기</a></div>'
				}
				if(menu == 'add'){
					$('#logContainer').html(html);
				}else{
					$('#logContainer').find('a.more').remove();
					$('#logContainer').append(html);
				}
				$('#logContainer').on('click', 'p#addedTitle', function() {
					var postNo = $($('input[name="postNo"]')[$('p#addedTitle').index(this)]).val();
					if(postNo == null){
						alert("삭제된 게시물입니다.");
					}else{
						if(postNo.indexOf("60") != 0){
							self.location = "/comm/getComm?postNo="+postNo;
						}else{
							self.location = "/group/getGroup?groupNo="+postNo;
						}
					}
				})
			}
		})
	}
<<<<<<< HEAD
	
	
	////////////////////////////////////////////
	
	$(function(){
	 	$(document).on("click","a[name='received']", function(){
	
			alert("받은 쪽지")
			
		
		})
		
		
	})
	
	
	
	/////////////////////////////////////
=======

>>>>>>> refs/heads/team/yr
</script>
</head>
<body onload="javascript:getLike('add');">
<input type="hidden" name="searchKeyword" value="${loginUser.userId}">
 	  <div id="header">
			<div class="inner">
				<header>
					<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
				</header>
			</div>	
			<jsp:include page="/layout/toolbar.jsp" />
     </div>
     <div class="container" align="center">
     	<div name="userProfile" style="margin: 20px;height: auto;">
     		<span class="col-xs-4" style="width: 30%" align="right">
     			<c:if test="${! empty loginUser.profileImageFile}">
     				<a><img alt="" src="/resources/images/${loginUser.profileImageFile}" style="width: 100%"></a>
     			</c:if>
      			<c:if test="${empty loginUser.profileImageFile}">
      				<a><img alt="" src="/resources/images/00742106_105752.jpg" style="width: 100%"></a>
     			</c:if>
     		</span>
     		<span style="font:bold; font-size: 2em !important; color: #3b2b48;" class="col-xs-8">
     			<p style="padding: 0.5em 0.5em 0.5em 0;">
	     			<a style="font-weight: 700;">${loginUser.userId}</a>
	     			<br/>
	     			<span style="font-size: 12pt;">${loginUser.email}</span>
     			</p>
     			<a style="float: left; font-size: 0.5em; margin: 10px; font:bold;" href="/user/updateUser?userId=${loginUser.userId}"><span class="fas fa-cog"></span> 프로필수정</a>
     		</span>
     	</div>
     </div>
     <div class="container">
     	<div style="background-color: white; margin-top:10pt;">
	     	<div style="margin: 20px; padding-bottom:1em; height: inherit;">
	     		<a class="col-xs-4" align="center"><span class="button01" align="center">좋아요</span></a>
	     		<a class="col-xs-4" align="center"><span class="button01" align="center">댓글</span></a>
	     		<a class="col-xs-4" align="center"><span class="button01" align="center">내 모임</span></a>
	     	</div>
	     	<div id="logContainer"></div>
     	</div>
     </div>
     <br/>

     <jsp:include page="../layout/footer.jsp"></jsp:include>
   		<script src="../resources/helios/assets/js/jquery.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
		<script src="../resources/helios/assets/js/skel.min.js"></script>
		<script src="../resources/helios/assets/js/util.js"></script>
		<script src="../resources/helios/assets/js/main.js"></script>
     

</body>
<style type="text/css">
	p{
		margin-bottom: 0;
	}
</style>
</html>