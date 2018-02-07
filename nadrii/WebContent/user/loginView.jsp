<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body > div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            border-radius: 8px;
        }
        
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
//				alert(id +"/"+ pw)
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
	
				fncLoginCheck(id, pw);
				
//				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		}); 
		
		//============= ���̵� ã�� ȭ���̵� =============
		$( function() {
			$("a[href='#' ]:contains('���̵� ã��')").on("click" , function() {
				self.location = "/user/findIdPg"
			});
		});
		
		//============= ��й�ȣ ã�� ȭ���̵� =============
		$( function() {
			$("a[href='#' ]:contains('��й�ȣ ã��')").on("click" , function() {
				self.location = "/user/findPasswordPg"
			});
		});
		//============= '�α���' ��ư Ŭ�� Event ó�� =============
		$( function() {
			$(".btn.btn-primary:contains('�� �� ��')").bind("click" , function() {
				fncLoginCheck();
				//self.location = "/user/findPasswordPg"
			});
		});
		
		//========== fncLoginProc Event ó�� ==========
		function fncLoginCheck(id, pw) {
//			var userId = $("#userId").val();
//			var password = $("#password").val();
			
			var loginData = "userId=" + id + "&password=" + pw;
			
			$.ajax({
				url : "/user/json/loginCheck",
				type : "POST",
				data : loginData,
				success : function(result){
					if(result.msg == "failed"){
						alert("��ϵ� ���̵� �����ϴ�.");
						location.href="/index.jsp";
					}
					if(result.msg == "success"){
						alert(result.welcomeSign + " ��, ȯ���մϴ�.");
						location.href="/index.jsp";
					}
				}
			});
		}
		
		//============= FaceBook �α��� =============

		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				testAPI();
			} else {
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			}
		}

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '1974223106165873',
				cookie : true,

				xfbml : true,
				version : 'v2.8'
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me',
							function(response) {
								console.log('Successful login for: '
										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.name + '!';
							});
		}
		/*
		(function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "https://connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk'));
		  function testAPI() {
		    console.log('Welcome!  Fetching your information.... ');
		    FB.api('/me', function(response) {
		        $("#facebookId").val(response.name);
		        $("#facebookForm").submit();
		    });
		  }
		 */
		//============= FaceBook �α��� =============
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=1974223106165873';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'))
		//============= kakao �α��� =============
	</script>		
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar navbar-default">
        <div class="container">
        	<div class="navbar-header">
        		<a class="navbar-brand" href="/index.jsp">Nadrii Main</a>
        	</div>	
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">


			<div class="col-md-12">
				<br />
				<div class="jumbotron">
					<h1 class="text-center">
						<img src="http://cdn.firespring.com/images/90349557-f83b-4af1-a134-ef1b43293823.png" />
					</h1>

					<form class="form-horizontal">

						<div class="form-group">
							<label for="userId" class="col-sm-4 control-label">I&nbsp;D</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="userId" id="userId" placeholder="���̵� �Է��� �ּ���.">
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-sm-4 control-label">PASSWORD</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password"	id="password" placeholder="��й�ȣ�� �Է��� �ּ���">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<button type="button" class="btn btn-primary">�� �� ��</button>
								<a class="btn btn-primary btn" href="#" role="button">ȸ������</a> 
								<a class="btn btn-warning btn" role="button" href="#">���̵� ã��</a> 
								<a class="btn btn-info" role="button" href="#">��й�ȣ ã��</a>
							</div>

							<div class="col-sm-offset-4 col-sm-6 text-center">

								<br>
								<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								Facebook Login	
								<div class="fb-login-button" data-max-rows="1" data-size="large"
										data-button-type="continue_with" data-show-faces="false"
										data-auto-logout-link="false" data-use-continue-as="false">
									</div>
								</fb:login-button>
								<div id="status"></div>

							</div>
						</div>

					</form>
				</div>

			</div>

		</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>