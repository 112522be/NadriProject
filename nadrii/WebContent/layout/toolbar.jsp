<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나들이</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<!-- css -->

	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="/resources/css/flexslider.css" rel="stylesheet" />
	<link href="/resources/css/style.css" rel="stylesheet" />
	<!-- Theme skin -->

	<link href="/resources/skins/default.css" rel="stylesheet" />

	<!-- //////////////////// CSS //////////////////// -->

	<style type="text/css">

		.container {
			padding: 20px;
        }
        
        .dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		}
		
		/* Links inside the dropdown */
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		
		.show {
			display:block;
		}
		
		.dropdown-content a:hover {
			background-color: #68A4C4;
		}
		
		.dropdown01{
		margin-left:-65px; float:left;
		
		}
		
		.box02{
			position:relative;
		}
		
		.box03{
			position:relative;
		}

		@media(max-width: 1200px){
			.container .loginBtn{
				margin-left:30px;
				margin-top:-52px;
			}
			
			.container .joinBtn{
				margin-left:30px;
				margin-top:-60px;
			}
			.joinBtn{
				height:30px;
			}
			.box01{
				height:70px;
			}
		}
		
		.box01{
			width:300px;
		}
		
		.joinBtn{
			margin-top:125px;
		}
		
		.box02:before{ 
			width :0px; 
			height:0PX; 
			border-left: 6px solid transparent; 
			border-right: 6px solid transparent; 
			border-bottom: 6px solid rgb(104, 164, 196);
			position:absolute;
			margin:-6px 0 0 199px;
	        content: "";
		}
		
		.box03:before{ 
			width :0px; 
			height:0PX; 
			border-left: 6px solid transparent; 
			border-right: 6px solid transparent; 
			border-bottom: 6px solid rgb(104, 164, 196);
			position:absolute;
			margin:-6px 0 0 255px;
	        content: "";
		}
	</style>

	<script type="text/javascript">
	
	//========== '나들이 정보' 버튼 처리 Event ==========
	$( function() {
		$("a[href='#' ]:contains('나들이 정보')").on("click" , function() {
			self.location = "../trip/getTheme"
		});
	});

	$( function() {
        $(".glyphicon.glyphicon-envelope").bind("click" , function() {
        	//alert("쪽지함")
      		self.location = "/message/listMessage"
        });
    });
	
	
	$(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".dropbtn01").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
	
	$(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".dropbtn02").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
	
	</script>
	
</head>


<body>
		<nav class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
							data-target="#bs-example-navbar-collapse-1" >
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                   	</button>
					<a class="navbar-brand" href="/index.jsp">N A D R I I</a>
				</div>
				<!-- navbar-header End -->

				
				
				<div class="navbar-collapse collapse ">

					<ul class="nav navbar-nav navbar-right">
					<c:if test="${ ! empty loginUser }">
							<li>
								<a href="/user/getUser?userId=${loginUser.userId}">
								<img src="/resources/images/00742106_105752.jpg" alt="..." class="img-circle" width="30px" height="30px">
								<span>
									<c:if test="${ loginUser.userName eq null }">
										${ loginUser.userId }
									</c:if>
										${ loginUser.userName }
										님
								</span>
								</a>
							</li>
							<li>
								<a href="/purchase/listBasket">
									<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" 
										data-toggle="tooltip" data-placement="bottom" title="장바구니"></span>
								</a>
							</li>
							<li>
								<a href="/purchase/listPurchase">
									<span class="glyphicon glyphicon-qrcode" aria-hidden="true" 
										data-toggle="tooltip" data-placement="bottom" title="구매한티켓"></span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"
										data-toggle="tooltip" data-placement="bottom" title="쪽지"></span>
								</a>
							</li>
							<li><a href=""><span class="glyphicon glyphicon-bell"></span></a></li>
							<li><a href="/user/logoutProc">Logout</a></li>
						</c:if>
						<c:if test="${  empty loginUser }">						
								<!-- <li><a href="/user/loginView.jsp" >Login</a></li>
								<li><a href="/user/addUserView.jsp">Join</a></li> -->
								<div style="margin-top:20px; display:block;">
									<div class="dropdown01" style="position:relative;">						
									  <a class="dropbtn01" href="#">login</a>
									  <ul id="myDropdown" class="dropdown-content" style="position:absolute; float:left; width:300px; z-index:9999; margin-left: -190px; margin-top: 3px;
									  border-top:1px solid #68A4C4;">
									  	<div class="box02" style="display:block;">
											<div style="display:block; z-index:999;">    
											    <div class="col-lg-9" style="height:70px">
											    <p style="padding-top:10px; margin:0;">ID</p> 
											   	 <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력해 주세요.">
											    </div>
											    <div class="col-lg-9" style="height:80px">
											    PassWord
											     <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해 주세요">
											  	</div>
										   </div>
										   <div style="height:60px; width:300px;"></div>
									  	<button class="btn btn-primary loginBtn" style="position:absolute;">로그인</button>	
									  </div>							 
									  </ul>	  						  
									</div>
									
									 <div class="dropdown02" style="margin-right:20px;">						
									  <a class="dropbtn02" href="#">join</a>
									  <ul id="myDropdown" class="dropdown-content" style="z-index:99999; margin-left: -250px; margin-top: 3px; position:absolute; border-top:1px solid #68A4C4;">
									    <div class="box03" style="display:block;">
											<div style="display:block; z-index:999;">    
											    <div class="col-lg-9" style="height:70px">
											    <p style="padding-top:10px; margin:0;">아이디</p> 
											   	 <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력해 주세요.">
											    </div>
											    <div class="col-lg-9" style="height:60px">
											    	비밀번호
											     <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해 주세요">
											  	</div>
											  	<div class="col-lg-9" style="height:60px">
											    	비밀번호 확인
											     <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해 주세요">
											  	</div>
											  	<div class="col-lg-9" style="height:70px">
											    	이메일
											     <input type="password" class="form-control" name="password" id="password" placeholder="이메일을 입력해 주세요">
											  	</div>
										   </div>
										   <div class="box01"></div>
									  	<button class="btn btn-primary joinBtn" style="position:absolute;">가입</button>	
									  </div>		
									  </ul>
									</div>
							</div>
						</c:if>
					</ul>
				</div>
			
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li><a href="#">나들이 정보</a></li>
						<li><a href="/comm/listComm">나만의 나들이</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false" z-index="0">나들이 플래너 
								<b class=" icon-angle-down"></b>
							</a>
							<ul class="dropdown-menu">

								<li><a href="/planner/getUserPlannerList">플래너 게시판</a></li>
								<li><a href="/planner/addPlannerView">플래너 작성</a></li>
								<li><a href="/planner/getMyPlannerList">나의 플래너</a></li>
							</ul>
						</li>
						<li><a href="/ticket/listTicket">나들이 티켓</a></li>
						<li><a href="/group/listGroup">나들이모임</a></li>
					</ul>
				</div>
			<!-- Container End -->
		</nav>
		<!-- navbar End -->
</body>
</html>