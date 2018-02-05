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
		/* $( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
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
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		*/
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
		
		
/**
 * �α���
 */
function loginProc(){
	var userId = $("#userId").val();
	var password = $("#password").val();
	var data = "userId=" + userId;
	data += "&password=" + password;
	
	if(userId == ''){
		alert("���̵� �Է��� �ּ���.");
		$("#userId").focus();
		return;
	}
	if(password ==''){
		alert("��й�ȣ�� �Է��� �ּ���.");
		$("#password").focus();
		return;
	}
	
	$.ajax({
		data :data,
		url : "/user/loginProc",
		type : "POST",
		success : function(result){
			if(result.msg == "failed"){
				alert("���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���.");
				return;
			}
			if(result.msg == "success"){
				location.href="/user/main";
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
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1974223106165873',
      cookie     : true,  
                          
      xfbml      : true,  
      version    : 'v2.8' 
    });


    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

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
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
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
	
//============= kakao �α��� =============	
	
	</script>		
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<br/>
			
			<div class="col-md-6">
				<img src="/images/cropped-1920-1080-693903.jpg" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">L&nbsp;O&nbsp;G&nbsp;I&nbsp;N&nbsp;</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">I&nbsp;D</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">PASSWORD</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" onkeypress="if(event.keyCode==13){loginProc(); return false}">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary" onclick="loginProc();" >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					      <a class="btn btn-warning btn" role="button" href="#"> ���̵� ã�� </a>
					      <a class="btn btn-info" role="button" href="#"> ��й�ȣ ã�� </a>
					      <!--  facebook login -->
					 		<script>
					 		(function(d, s, id) {
							    var js, fjs = d.getElementsByTagName(s)[0];
							    if (d.getElementById(id)) return;
							    js = d.createElement(s); js.id = id;
							    js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=1974223106165873';
							    fjs.parentNode.insertBefore(js, fjs);
							  }(document, 'script', 'facebook-jssdk'))</script>
					 		  <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								Facebook Login	
								<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>					
							</fb:login-button>
							
							<div id="status"> </div>
							<!--  facebook login  end-->
							
							<!-- kakao ligin 
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=d4e94f0de61668f5bbbb2f58170b7891&redirect_uri=http://192.168.0.56:8081/oauth&response_type=code" class="kakaoLoginBtn"><img src="../images/kakao_account_login_btn_medium_narrow.png"></a>
							-->
							
<!--  						<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
						</a>
					    <script type='text/javascript'>
					      //<![CDATA[
					        // ����� ���� JavaScript Ű�� ������ �ּ���.
					        Kakao.init(' 55a2455a0f492f809a761acf2db7e5f9');
					        // īī�� �α��� ��ư�� �����մϴ�.
					        Kakao.Auth.createLoginButton({
					          container: '#kakao-login-btn',
					          success: function(authObj) {
					            alert(JSON.stringify(authObj));
					            location.href="/user/addUser";
					          },
					          fail: function(err) {
					             alert(JSON.stringify(err));
					          }
					        });
					        
					        Kakao.init('55a2455a0f492f809a761acf2db7e5f9');
					        function loginWithKakao() {
					          // �α��� â�� ���ϴ�.
					          Kakao.Auth.login({
					            success: function(authObj) {
					              alert(JSON.stringify(authObj));
					            },
					            fail: function(err) {
					              alert(JSON.stringify(err));
					            }
					          });
					        };
					        </script>-->
							<!-- kakao ligin end-->
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