<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<<<<<<< HEAD
	<!-- Facebook Login -->
	<!-- HTTPS required. HTTP will give a 403 forbidden response -->
	<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
	<script src="https://sdk.accountkit.com/ko_KR/sdk.js"></script>

	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
	body {
		background-image: url(images\\cropped-1920-1080-819582.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
		 }
	.row { 
		margin: 100px;
		}
	.jumbotron {
			color: navy;
			background-color: rgba( 160, 220, 220, 0.7 );
        }
    .jumbotron p {
     	font-weight: bold;
     	font-style: italic;
     }   
     .jumbotron h1 {
     	font-stretch: wider;
     }   
	
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		//============= listTicket ȭ���̵� =============
		$( function() {
			$("a[href='#' ]:contains('������Ƽ��')").on("click" , function() {
				self.location = "/ticket/listTicket"
			});
		});
		
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('������')").on("click" , function() {
				self.location = "/tour/museum?pageNo=1"
			});
		});
		
		//============= FaceBook �α��� =============
		
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1663788730309184',
				xfbml : true,
				version : 'v2.11'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/ko_KR/sdk.js";
//			js.src = "https://connect.facebook.net/en_US/sdk.js";
//			js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=1663788730309184';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		
		FB.login(function(response) {
			  // handle the response
			}, {scope: 'public_profile,email'});
		//============= FaceBook �α��� =============
	
	</script>	
	
	<!-- Bootstrap core CSS 
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template 
    <link href="css/4-col-portfolio.css" rel="stylesheet">
	-->
	
</head>

<body>


    



	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">������ TEST</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
					 <li><a href="#">
					 		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								Facebook Login						
							</fb:login-button>
						 </a>
					 </li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
		<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
		  			<h1>������ TEST</h1>
		  			<p>If you got some good emotion for about your memory, that was good memory to you.</p>
		  			<p>But, if you got some bad emotion, that was good experience to you.</p>
				<div class="text-center">
			  			<a class="btn btn-primary btn-lg" href="#" role="button">ȸ������</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">�� �� ��</a>
			  			<a class="btn btn-success btn-lg" href="#" role="button">������Ƽ��</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">������</a>
			  		</div>
			  	
			  	</div>
	        </div>
	 	<!--  Main end /////////////////////////////////////-->   		
	
	
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			<!--  ȸ������ ������ -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						  <li class="list-group-item">
						  	<a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">�ֱٺ���ǰ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   
			<div class="fb-like" 
				 data-share="true" 
				 data-width="450" 
				 data-show-faces="true">
			</div>

		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

=======
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('��ǰ�˻�')").on("click" , function() {
				self.location = "../product/listProduct?menu=search"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('����')").on("click" , function() {
				self.location = "../trip/listMuseum?pageNo=1"
			});
		});
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">��ǰ�˻�</a></li>
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
	                 <li><a href="#">����</a></li>
	                 
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			
	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-12">
				<div class="jumbotron">
			  		<h1>Model2 MVC Shop</h1>
			  		<p>�α��� �� ��밡��...</p>
			  		<p>�α��� �� �˻��� �����մϴ�.</p>
			  		<p>ȸ������ �ϼ���.</p>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-warning btn-lg" href="#" role="button">ȸ������</a>
			  			<a class="btn btn-success btn-lg" href="#" role="button">�� �� ��</a>
			  		</div>
			  	
			  	</div>
			  	<div class="container">
		<div class="col-md-12"  style="padding:0">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
		      <!-- Indicators -->
		      <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		      </ol>
		      <div class="carousel-inner" role="listbox">
		        <div class="item active">
		          <img class="first-slide" src="../images/uploadFiles/AHlbAAAAtBqyWAAA.jpg" alt="First slide" width="300" height="200">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1 align="right">Example headline.</h1>
		               
		              <p align="right"><a class="btn btn-lg btn-primary" href="#" role="button">�����Ϸ� ����</a></p>
		            </div>
		          </div>
		        </div>
		        <div class="item">	
		          <img class="second-slide" src="../images/uploadFiles/AHlbAAAAtDPSiQAA.jpg" alt="Second slide" width="300" height="200">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1 align="right">Another example headline.</h1>
		              <p align="right"><a class="btn btn-lg btn-primary" href="#" role="button">�����Ϸ� ����</a></p>
		            </div>
		          </div>
		        </div>
		        <div class="item">
		          <img class="third-slide" src="../images/uploadFiles/AHlbAAAAvWs@GwAA.jpg" alt="Third slide" width="300" height="200">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1 align="right">One more for good measure.</h1>
		              <p align="right"><a class="btn btn-lg btn-primary" href="#" role="button">�����Ϸ� ����</a></p>
		            </div>
		          </div>
		        </div>
		      </div>
		      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div>
		
		</div>
	</div>
<!-- Container end -->	
			  	
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
		
	
>>>>>>> refs/remotes/origin/master
</body>

</html>