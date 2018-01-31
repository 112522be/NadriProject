<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
	<jsp:forward page="main.jsp" />
</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	background-color: rgba(160, 220, 220, 0.7);
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
				alert("ȸ������")
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
		
		//============================== �����˻� ��Ʈ ===================
		$( function() {
			$("a[href='#' ]:contains('�ڹ���')").on("click" , function() {
				self.location = "../trip/listMuseum?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('���ð�')").on("click" , function() {
				self.location = "../trip/listExhibit?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('�̼���')").on("click" , function() {
				self.location = "../trip/listGallery?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('ü���')").on("click" , function() {
				self.location = "../trip/listExperience?pageNo=1"
			});
		});
		
		$( function() {
			$("a[href='#' ]:contains('�μӸ���')").on("click" , function() {
				self.location = "../trip/listTradition?pageNo=1"
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
				self.location = "/trip/listMuseum?pageNo=1"
			});
		});
		
		$(function(){
			$("a[href='#' ]:contains('�� �� �� ��')").on("click" , function() {
				if(confirm("�α׾ƿ��� �Ͻðڽ��ϱ�?")){
				self.location = "/user/logoutProc";
				}
			});
		});
		-
		

	//============= FaceBook �α��� START =============

	/*
	 FirebaseChat.prototype.init = function(){ //...����
	  	this.liFacebookBtn = document.getElementById('liFacebookBtn');
	  } 
	  // �ʱ� �̺�Ʈ ���ε�  
	 		 FirebaseChat.prototype.initEvent = function(){ 
		  //...����
	  		this.liFacebookBtn.addEventListener('click', this.onFacebookBtnClick.bind(this)); 
		 }
		  // ���̽��� �α��� ��ư Ŭ�� / 
		  FirebaseChat.prototype.onFacebookBtnClick = function(){ 
			  var facebookProvider = new firebase.auth.FacebookAuthProvider(); 
			  this.auth.setPersistence(firebase.auth.Auth.Persistence.SESSION) 
			  .then(this.signInWithPopup.bind(this, facebookProvider)).(function(error) { 
				  console.error('���� ���� ���� �� ���� �߻�' , error); 
				  }); 
			  }    
		  //*/
		  
	// This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(response);
      // The response object is returned with a status field that lets the
      // app know the current login status of the person.
      // Full docs on the response object can be found in the documentation
      // for FB.getLoginStatus().
      if (response.status === 'connected') {
        // Logged into your app and Facebook.
        testAPI();
      } else {
        // The person is not logged into your app or we are unable to tell.
        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
      }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
      FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
      });
    }

    window.fbAsyncInit = function() {
    FB.init({
      appId      : '{1974223106165873}',
      cookie     : true,  // enable cookies to allow the server to access
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });

    // Now that we've initialized the JavaScript SDK, we call
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      console.log(vm)
		vm.statusChangeCallback(response);
    });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "https://connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
      console.log('Welcome!  Fetching your information.... ');
      FB.api('/me', function(response) {
       /*  console.log('Successful login for: ' + response.name);
        document.getElementById('status').innerHTML =
          'Thanks for logging in, ' + response.name + '!'; */
 
          $("#facebookId").val(response.name);
          $("#facebookForm").submit();
      });
    }
    
    
	//============= FaceBook �α��� END =============
    
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
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#target">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- toolBar Button End //////////////////////// -->

			<div class="collapse navbar-collapse" id="target">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${loginUser eq null }">
						<li><a href="#">ȸ������</a></li>
						<li><a href="#">�� �� ��</a></li>
						<li><a href="#">��ǰ�˻�</a></li>
						<li><a href="#">�ڹ���</a></li>
						<li><a href="#">���ð�</a></li>
						<li><a href="#">�̼���</a></li>
						<li><a href="#">ü���</a></li>
						<li><a href="#">�μӸ���</a></li>
						<li><a href="#">������Ƽ��</a></li>
						<li><a href="#"> 
						
						<!--  facebook login --> <script>
					 		(function(d, s, id) {
							    var js, fjs = d.getElementsByTagName(s)[0];
							    if (d.getElementById(id)) return;
							    js = d.createElement(s); js.id = id;
							    js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=1974223106165873';
							    fjs.parentNode.insertBefore(js, fjs);
							  }(document, 'script', 'facebook-jssdk'))</script> <fb:login-button
									scope="public_profile,email" onlogin="checkLoginState();">
								Facebook Login						
							</fb:login-button>

								<div id="status"></div> 
								<!--  facebook login  end-->
								
								
						</a></li>
					</c:if>

					<c:if test="${loginUser ne null }">
						<li><a href="#">�� �� �� ��</a></li>
						<li><a href="#">�ڹ���</a></li>
						<li><a href="#">���ð�</a></li>
						<li><a href="#">�̼���</a></li>
						<li><a href="#">ü���</a></li>
						<li><a href="#">�μӸ���</a></li>
						<li><a href="#">������Ƽ��</a></li>
					</c:if>
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
					<p>If you got some good emotion for about your memory, that was
						good memory to you.</p>
					<p>But, if you got some bad emotion, that was good experience
						to you.</p>
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
						<li class="list-group-item"><a href="#">����������ȸ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">ȸ��������ȸ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>


				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">�ǸŻ�ǰ���</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">�ǸŻ�ǰ����</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>


				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						<li class="list-group-item"><a href="#">�����̷���ȸ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
						<li class="list-group-item"><a href="#">�ֱٺ���ǰ</a> <i
							class="glyphicon glyphicon-ban-circle"></i></li>
					</ul>
				</div>

			</div>
			<!--  Menu ���� end /////////////////////////////////////-->
			<div class="fb-like" data-share="true" data-width="450"
				data-show-faces="true"></div>

		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->


	

</body>

</html>