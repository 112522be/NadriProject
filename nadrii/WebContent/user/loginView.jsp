<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

		//============= "로그인"  Event 연결 =============
		/* $( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		*/
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		}); 
		
		//============= 아이디 찾기 화면이동 =============
		$( function() {
			$("a[href='#' ]:contains('아이디 찾기')").on("click" , function() {
				self.location = "/user/findIdPg"
			});
		});
		
		//============= 비밀번호 찾기 화면이동 =============
		$( function() {
			$("a[href='#' ]:contains('비밀번호 찾기')").on("click" , function() {
				self.location = "/user/findPasswordPg"
			});
		});
		
		
/**
 * 로그인
 */
function loginProc(){
	var userId = $("#userId").val();
	var password = $("#password").val();
	var data = "userId=" + userId;
	data += "&password=" + password;
	
	if(userId == ''){
		alert("아이디를 입력해 주세요.");
		$("#userId").focus();
		return;
	}
	if(password ==''){
		alert("비밀번호를 입력해 주세요.");
		$("#password").focus();
		return;
	}
	
	$.ajax({
		data :data,
		url : "/user/loginProc",
		type : "POST",
		success : function(result){
			if(result.msg == "failed"){
				alert("아이디 또는 비밀번호를 확인해주세요.");
				return;
			}
			if(result.msg == "success"){
				location.href="/user/main";
			}
		}
	});
		
} 

//============= FaceBook 로그인 =============

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
	//============= FaceBook 로그인 =============
	
//============= kakao 로그인 =============	
	
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
	
	<!--  화면구성 div Start /////////////////////////////////////-->
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
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">PASSWORD</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" onkeypress="if(event.keyCode==13){loginProc(); return false}">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary" onclick="loginProc();" >로 &nbsp;그 &nbsp;인</button>
					      <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					      <a class="btn btn-warning btn" role="button" href="#"> 아이디 찾기 </a>
					      <a class="btn btn-info" role="button" href="#"> 비밀번호 찾기 </a>
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
					        // 사용할 앱의 JavaScript 키를 설정해 주세요.
					        Kakao.init(' 55a2455a0f492f809a761acf2db7e5f9');
					        // 카카오 로그인 버튼을 생성합니다.
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
					          // 로그인 창을 띄웁니다.
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
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>