<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	  <!-- Scripts 
			<script src="/resources/helios/assets/js/jquery.min.js"></script>-->
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		    <script src="/resources/helios/assets/js/main.js"></script>
   
<title>Insert title here</title>

<script type="text/javascript">
	var currentPage;
	var maxPage;
	/* $(function() {
		$('a.col-xs-4').bind('click', function() {
			$('a.col-xs-4').css("border", "0")
			$('span.button01').css("color", "#5b5b5b")
			$(this).css("border-bottom", "4px solid #FE8A71");
			$(this).children().css("color", "#FE8A71")
			if($(this).children().html() == "좋아요"){
				getLike();
			}else if($(this).children().html() == "댓글"){
				$.ajax({
					url: "/common/listCommentById",
					method: "GET",
					data: {
						"searchKeyword": '${loginUser.userId}'
					},
					headers: {
						"Accept": "application/json",
						"Content-Type": "application/json"
					},
					success: function(JSONData) {
						console.log(JSONData)
						currentPage = 1;
						if(JSONData.totalCount%12 == 0){
							maxPage = JSONData.totalCount / 12;
						}else{
							maxPage = (JSONData.totalCount / 12)+1;
						}
						var html = '';
						for(var i=0;i<JSONData.comments.length;i++){
							html += '<div class="row">'
								+'<div class="col-xs-2" align="center" style="color: gray;">'
								+'<span>'+JSONData.yearNMonth[i]+'.</span>'
								+'<span style="font-size:25pt; font-weight:700">'+JSONData.day[i]+'</span>'
								+'</div>'
								+'<div class="col-xs-2">'
								+'<img alt="" src="" style="height: 10%; width: 13%;">'
								+'</div>'
								+'<div class="col-xs-8">'
								+'<p id="addedTitle"><span style="font-size: 9pt; font-weight: 900; color: #3b2b48">';
								if(JSONData.title[i] == null){
									html += "삭제된 게시물입니다."	
								}else{
									html += JSONData.title[i]+'<input type="hidden" name="postNo" value="'+JSONData.comments[i].postNo+'">'
								}
								html +='</span></p>'
								+JSONData.comments[i].text
								+'</div>'
								+'</div>'
								+'<hr/>';
						}
						$('#logContainer').html(html);
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
			}else{
				listMessage();
			}
		})
		$(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		    if(currentPage < maxPage){
			    currentPage++;
			    var searchKeyword = $('input[name="searchKeyword"]').val();      
			}else{
			    return;
			}
		}
	})	
	})
	function infinityScroll() {
	}
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
				var tableValue ='<div align="right" style="font-size:12pt; padding:1%;"><span name="received">받은쪽지</span>&nbsp;&nbsp;<span name="sended">보낸쪽지</span></div>';
								
				
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
				var tableValue ='<div align="right" style="font-size:12pt; padding:1%;"><span name="received">받은쪽지</span>&nbsp;&nbsp;<span name="received">보낸쪽지</span></div>';
								
				
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
	function getLike() {
		$.ajax({
			url: "/like/json/listLikeById",
			method: "GET",
			data: {
				"searchKeyword": "${loginUser.userId}"
			},
			headers: {
				"Accept": "application/json"
			},
			success: function(JSONData) {
				currentPage = 1;
				if(JSONData.totalCount%12 == 0){
					maxPage = JSONData.totalCount / 12;
				}else{
					maxPage = Math.floor(JSONData.totalCount / 12)+1;
				}
				var html="";
				console.log(JSONData)
				for(var i=0;i<JSONData.list.length;i++){
					html += '<div class="row">'
						+'<div class="col-xs-2" align="center" style="color: gray;">'
						+'<span>'+JSONData.yearNMonth[i]+'.</span>'
						+'<span style="font-size:25pt; font-weight:700">'+JSONData.day[i]+'</span>'
						+'</div>'
						+'<div class="col-xs-2">'
						+'<img alt="" src="" style="height: 10%; width: 13%;">'
						+'</div>'
						+'<div class="col-xs-8">'
						+'<p id="addedTitle"><span style="font-size: 9pt; font-weight: 900; color: #3b2b48">';
						if(JSONData.title[i] == null){
							html += "삭제된 게시물입니다."	
						}else{
							html += JSONData.title[i]+'<input type="hidden" name="postNo" value="'+JSONData.list[i].postNo+'">'
						}
						html +='</span></p>'
						+'</div>'
						+'</div>'
						+'<hr/>';
				}
				$('#logContainer').html(html);
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
	} */
	
	$("#userProfile").load("/user/myPage2.jsp #a");
</script>

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

	.mypage{
		border-top:2px solid lightgray; 
		border-bottom:2px solid lightgray;
		padding:3% 3% 15% 3%;
		display:flex;
		height: 500px;
	}
	
	.mypage01{
		dis
	}
	
	.userProfile{
		
	}
</style>

</head>
<body>
	  <div id="header">
<div class="inner">
						<header>
							<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
						</header>
					</div>
					
					<jsp:include page="/layout/toolbar.jsp" />
     </div>
     <div class="container" style=" position: relative; ">
     	<div name="userProfile" style="margin: 20px; position: relative; height: auto;">
      		<a><div id="userProfile"></div>
      		<img alt="" src="/resources/images/00742106_105752.jpg" width="10%" style="margin: 10px;"></a>
     		
     		<span style="position:absolute; top: 10%; margin: 10px; font:bold; font-size: 20pt; color: #3b2b48;">
     			<a style="font-weight: 700;">${loginUser.userId}</a>
     			<br/>
     			<span style="font-size: 12pt;">${loginUser.email}</span>
     		</span>
     		<!-- <span style="position:absolute; bottom: 10%; margin: 10px; font:bold;"><a style="font-size: 15px;"><span class="glyphicon glyphicon-cog"> 프로필수정</span></a></span>-->     	</div>
     	<br/>
     	<div class="mypage">    	
	     	<div class="col-md-6 userName">
	     		<div>이 름</div>
	     		<div class="userName">${user.userName}</div>
	     	</div>
     		<div class="gender col-md-6">
     			<div>성 별</div>
     			<div class="usergender">${user.gender}</div>
     		</div>   		
     		<div class="gender col-md-6">
     			<div>이 메 일</div>
     			<div class="usergender">${user.email}</div>
     		</div>
     		<div class="gender col-md-6">
     			<div>자 녀 수</div>
     			<div class="usergender">${user.children}</div>
     		</div>
     		<div class="gender col-md-6">
     			<div>생 일</div>
     			<div class="usergender">${user.birth}</div>
     		</div>
     		<div class="gender col-md-6">
     			<div>핸 드 폰  번 호</div>
     			<div class="usergender">${user.phone}</div>
     		</div>    		
     		<div class="gender col-md-6">
     			<div>QrCode</div>
     			<div class="usergender">${user.qrCode}</div>
     		</div>
     	</div>
     	<!-- <div style="background-color: white; margin-top:10pt;">
	     	<div style="margin: 20px; position: relative; height: inherit;">
	     		<a class="col-xs-4" align="center"><span class="button01" align="center">좋아요</span></a>
	     		<a class="col-xs-4" align="center"><span class="button01" align="center">댓글</span></a>
	     		<a class="col-xs-4" align="center"><span class="button01" align="center">쪽지</span></a>
	     	</div>
	     	<div id="logContainer"></div> -->
     	</div>
     </div>
     <br/>
     <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>