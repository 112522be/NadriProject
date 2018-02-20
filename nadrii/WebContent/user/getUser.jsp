<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  
	  <link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		});
		
		 $( function() {
			    $( ".tabs" ).tabs();
			  } );
		
	</script>
	
	<style>
	.tabs{
		margin:0 0 30px 0;
	}
	
	#nav{
   background-color: #086A87;
   opacity: 0.4;
   color:#ddd;
   
}
	.updatebtn{
		margin:40px 0 50px 0;
	}
	
	.updatebtn01{
		font-size:16px;
		line-height: 20px;
		margin: 4px 0 0 -5px;
	}
	
	.tabs{
		border: 1px solid #31708f;
   		width: 740px;
    	margin: auto;
    	padding: 0;
	}
	@media screen and (max-width:736px){
		.groupbtn .updatebtn{width:75px; height:75px; margin:0px}
		.updatebtn01{margin-top:10px;}
		.container .tabs{width:500px}
		.container{padding:35px; margin-top:30px !important;}
	}
	</style>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- Header -->
				<div id="header">

					<div class="inner">
						<header>
							<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
						</header>
					</div>
					
						<jsp:include page="/layout/toolbar.jsp" />

				</div>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:200px; width: 1170px;">
	
		<div class="page-header" style="    border-bottom: 3px solid #31708f;">
	       <h3 class=" text-info" style="margin:0 0 25px 15px">회원정보조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>Email</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>생 년 월 일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 수</strong></div>
			<div class="col-xs-8 col-md-4">${user.children}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성 별</strong></div>
			<div class="col-xs-8 col-md-4">${user.gender}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>QrCode</strong></div>
			<div class="col-xs-8 col-md-4">${user.qrCode}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가입일자</strong></div>
			<div class="col-xs-8 col-md-4">${user.regDate}</div>
		</div>
		
		<hr/>
			<div class="tabs col-md-8">
				<ul style="background:#f8f8f8; border:1px solid #31708f;">
					<li style="border:1px solid #31708f;"><a href="#tabs-1">쪽지</a></li>
		    		<li style="border:1px solid #31708f;"><a href="#tabs-2">좋아요</a></li>
		    		<li style="border:1px solid #31708f;"><a href="#tabs-3">내가 쓴 댓글</a></li>
		    	</ul>
		    	<div id="tabs-1">
    				쪽지
				</div>
				<div id="tabs-2">
					좋아요
				</div>
			   <div id="tabs-3">
			   		내가 쓴 댓글 
			   </div>
			</div>
		
		<!-- <hr/> -->
		
		
		<div class="row">
	  		<div class="text-center groupbtn" style="padding-top:60px;">
	  			<button type="button" class="btn btn-primary updatebtn">회원정보<br>수정</button>
	  		</div>
		</div>
		
		<!-- 메인 script-->
		
		<!-- Scripts 
			<script src="/resources/helios/assets/js/jquery.min.js"></script>-->
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		    <script src="/resources/helios/assets/js/main.js"></script>

</body>

</html>