<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://dev.kakao.com/sdk/js/kakao-1.2.0.min.js"></script>
	
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
			$("a[href='#' ]:contains('회  원  가  입')").on("click" , function() {
				alert("회원가입화면")
				self.location = "/user/addUser"
			});
		}); 
			
		//============= 아이디 찾기 화면이동 =============
		$( function() {
			$("a[href='#' ]:contains('아이디 찾기')").on("click" , function() {
				/* self.location = "/user/findIdPg" */
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
 
/*   function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
 //     testAPI();
    } else {
      
    }
  }
  
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      if (response.status === 'connected') {
    	  if (response.authResponse) {
			//user is authorized
			//document.getElementById('loginBtn').style.display = 'none';
			testAPI();
			
    		 var uid = response.authResponse.userID;
    		   var accessToken = response.authResponse.accessToken;
    		   
    		   
    		   var data = "uid="+ uid;
    		   data += "&accessToken=" + accessToken;
    		   
    		 
    		   location.href="/user/addUserFacebook?" + data; 
    		   
		} else {
			//user is not authorized
		}
      }
    });
  }
  
  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', {fields: 'email,name'}, function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	    });
	  }
    

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1974223106165873',
      cookie     : true,  
      status     : true,                    
      xfbml      : true,  
      version    : 'v2.8' 
    });


    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      if (response.status === 'connected') {
          //user is authorized
          
      } else {
          //user is not authorized
      }
    });

  };
  
   function handleFacebookRegist(response){
		FB.api('/me', {fields: 'email'}, function(response) {
		//	 $("#email").text("이메일 : "+response.email);
		//	$('#email').html(response.email);
			onsole.log(JSON.stringify(response));
		});
	} 
  
   function facebooklogin() {  
	   

	    //페이스북 로그인 버튼을 눌렀을 때의 루틴.  
	  FB.login(function(response) {  
	    var fbname;  
	    var accessToken = response.authResponse.accessToken;  
	    FB.api('/me', function(user) {  
	      fbname = user.name;
	      $.post("/user/adduser", { "userid": user.id, "email":user.email, "username": fbname, "fbaccesstoken":accessToken},  
	      function (response) {  
	        if(response=="N"){
	         location.replace('/unmember/memberrege?flag=1');            
	        }else{
	         location.replace('/');            
	        }
	      });      
	    });   
	  }, {scope: "user_about_me,offline_access,email,user_birthday"});  
	}  
    */
   
   ///////////////////////////////////////////////////////////////
   
   

/* function getUserData() {
     FB.api('/me', function(response) {
        document.getElementById('response').innerHTML = 'Hello ' + response.name;
        console.log(response);
    }); 
    FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
    	
    	alert("정보");
        console.log(JSON.stringify(response));
        $("#name").text("이름 : "+response.name);
        $("#email").text("이메일 : "+response.email);
        $("#gender").text("성별 : "+response.gender);
        $("#birthday").text("생년월일 : "+response.birthday);
        $("#id").text("아이디 : "+response.id);
        
//        var email = $("#email");
//s        location.href="/user/addUserFacebook.jsp";
        
        var email =  JSON.stringify(response);
        var data = "email="+ email;   
		 
		   location.href="/user/addUserFacebook?params=" + encodeURI(JSON.stringify(response));
    });
    
    
} */
    
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
          statusChangeCallback(response);
          if (response.status === 'connected') {
        	  if (response.authResponse) {
    			//user is authorized
    			//document.getElementById('loginBtn').style.display = 'none';
    			
        		   
    		} else {
    			//user is not authorized
    		}
          }
        });
      }
  
window.fbAsyncInit = function() {
    //SDK loaded, initialize it
    FB.init({
        appId      : '1974223106165873',
        cookie     : true,  // enable cookies to allow the server to access
                // the session
        xfbml      : true,  // parse social plugins on this page
        version    : 'v2.8' // use graph api version 2.8
    });
  
    //check user session and refresh it
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            //user is authorized
            //document.getElementById('loginBtn').style.display = 'none';
            //getUserData();

            
        } else {
            //user is not authorized
        }
    });
};
        
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
  
  
  
//load the JavaScript SDK
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.com/ko_KR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

        function testAPI() {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
            	
            	alert("정보!!!!");
                console.log(JSON.stringify(response));
                $("#name").text("#name : "+response.name);
                $("#email").text("#email : "+response.email);
                $("#gender").text("#gemder : "+response.gender);
                $("#birthday").text("#birthday : "+response.birthday);
                $("#id").text("#id : "+response.id);
                
                var email =  JSON.stringify(response);
                var data = "email="+ email;   
                
                $("#email").val(data);
        		 
        		   //location.href="/user/addUserFacebook?params=" + encodeURI(JSON.stringify(response));
        		   
        		   $("form").attr("method","GET").attr("action" , "/user/addUserFacebook").submit();
            });
          }


//////////////////////////////////////////////////////////




/* // This is called with the results from from FB.getLoginStatus(). 
function statusChangeCallback(response) { console.log('statusChangeCallback'); console.log(response); 
// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
// 앱에서 현재의 로그인 상태에 따라 동작하면 된다. 
// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다. 
if (response.status === 'connected') { 
	// 페이스북을 통해서 로그인이 되어있다.
	console.log(response.authResponse.accessToken);
	testAPI(); 
	}  else if (response.status === 'not_authorized') {

        FB.login(function(response) {}, {
          scope: 'email'
        });
        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
      } else {
        FB.login(function(response) {}, {
          scope: 'email'
        });
        document.getElementById('status').innerHTML = 'Please log ' +
          'into Facebook.';
      }
    }
			// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다. 
			// onlogin 핸들러를 아래와 같이 첨부하면 된다. 
			function checkLoginState() { 
				FB.getLoginStatus(function(response) { 
					statusChangeCallback(response)
					}); 
				} 
			window.fbAsyncInit = function() { 
				FB.init({ appId : '{1974223106165873}', 
					cookie : true, 
					autoLogAppEvents : true,
				    xfbml            : true,
					// 쿠키가 세션을 참조할 수 있도록 허용 xfbml : true, 
					// 소셜 플러그인이 있으면 처리 
					version : 'v2.1' // 버전 2.1 사용 
					}); 
				// 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다. 
				//.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다. 
				// 그 3가지 상태는 아래와 같다. // 1. 앱과 페이스북에 로그인 되어있다. ('connected')
				// 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized') 
				// 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다. 
				// // 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다. 

				// SDK를 비동기적으로 호출 
				(function(d, s, id) { 
					var js, fjs = d.getElementsByTagName(s)[0]; 
					if (d.getElementById(id)) {return;} 
					js = d.createElement(s); 
					js.id = id; js.src = "//connect.facebook.net/en_US/sdk.js"; 
					fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk')); 
				// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
				// 이 호출은 statusChangeCallback()에서 이루어진다. 
				function testAPI() { 
					console.log('Welcome! Fetching your information.... '); 
				}
				FB.api('/me', function(response) { console.log('Successful login for: ' + response.name); 
				document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!'; 
				}); 
				}

			function checkLoginState() {
			    FB.getLoginStatus(function(response) {
			      statusChangeCallback(response);
			      if (response.status === 'connected') {
			    	  if (response.authResponse) {
						//user is authorized
						//document.getElementById('loginBtn').style.display = 'none';
						
			    		 var uid = response.authResponse.userID;
			    		   var accessToken = response.authResponse.accessToken;
			    		   
			    		   
			    		   var data = "uid="+ uid;
			    		   data += "&accessToken=" + accessToken;
			    		   
			    		 
			    		   location.href="/user/addUser?" + data; 
			    		   
					} else {
						//user is not authorized
					}
			      }
			    });
			  }
					 */
////////테스트중

			
////////////////////////////////////////////////////////
  
/* 	//add event listener to login button
	document.getElementById('loginBtn').addEventListener('click', function() {
	    //do the login
	    FB.login(function(response) {
	        if (response.authResponse) {
	            access_token = response.authResponse.accessToken; //get access token
	            user_id = response.authResponse.userID; //get FB UID
	            console.log('access_token = '+access_token);
	            console.log('user_id = '+user_id);
	            $("#access_token").text("접근 토큰 : "+access_token);
	            $("#user_id").text("FB UID : "+user_id);
	            //user just authorized your app
	            //document.getElementById('loginBtn').style.display = 'none';
	            getUserData();
	        }
	    }, {scope: 'email,public_profile,user_birthday',
	        return_scopes: true});
	}, false);  */ 
  
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
    }  */
  
 
  /////////////////////////////////////////////////////////////////////////
  
   /* function getUserData() {
	     FB.api('/me', function(response) {
	        document.getElementById('response').innerHTML = 'Hello ' + response.name;
	        console.log(response);
	    }); 
	    FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
	        console.log(JSON.stringify(response));
	        $("#name").text("이름 : "+response.name);
	        $("#email").text("이메일 : "+response.email);
	        $("#gender").text("성별 : "+response.gender);
	        $("#birthday").text("생년월일 : "+response.birthday);
	        $("#id").text("아이디 : "+response.id);
	    });
	}
	  
	window.fbAsyncInit = function() {
	    //SDK loaded, initialize it
	    FB.init({
	        appId      : '1974223106165873',
	        cookie     : true,  // enable cookies to allow the server to access
	                // the session
	        xfbml      : true,  // parse social plugins on this page
	        version    : 'v2.8' // use graph api version 2.8
	    });
	  
	    //check user session and refresh it
	    FB.getLoginStatus(function(response) {
	        if (response.status === 'connected') {
	            //user is authorized
	            //document.getElementById('loginBtn').style.display = 'none';
	            testAP();
	        } else {
	            //user is not authorized
	        }
	    });
	};
	  
	//load the JavaScript SDK
	(function(d, s, id){
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) {return;}
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.com/ko_KR/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	  
	//add event listener to login button
	document.getElementById('loginBtn').addEventListener('click', function() {
	    //do the login
	    FB.login(function(response) {
	        if (response.authResponse) {
	            access_token = response.authResponse.accessToken; //get access token
	            user_id = response.authResponse.userID; //get FB UID
	            console.log('access_token = '+access_token);
	            console.log('user_id = '+user_id);
	            $("#access_token").text("접근 토큰 : "+access_token);
	            $("#user_id").text("FB UID : "+user_id);
	            //user just authorized your app
	            //document.getElementById('loginBtn').style.display = 'none';
	            getUserData();
	        }
	    }, {scope: 'email,public_profile,user_birthday',
	        return_scopes: true});
	}, false);
 	
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
	
	passport.use(new FacebookStrategy({
	    clientID: secret_config.federation.facebook.client_id,
	    clientSecret: secret_config.federation.facebook.secret_id,
	    callbackURL: secret_config.federation.facebook.callback_url,
	    profileFields: ['id', 'email', 'gender', 'link', 'locale', 'name', 'timezone',
	      'updated_time', 'verified', 'displayName']
	  }, function (accessToken, refreshToken, profile, done) {
	    var _profile = profile._json;
	    loginByThirdparty({
	      'auth_type': 'facebook',
	      'auth_id': _profile.id,
	      'auth_name': _profile.name,
	      'auth_email': _profile.id
	    }, done);
	  }
	)); */


  ///////////////////////////////////////////////////////////////////////
  
  
	//============= FaceBook 로그인 =============
	
//============= kakao 로그인 =============	
	
 /*
	  $.ajax({
		  url : "/user/kakao",
		  type : "POST",
		  data : $("#kakao").val(),
		  success: function(data) {
		      // 로그인 성공시, API를 호출합니다.
		      Kakao.API.request({
		        url: 'http://192.168.0.56:8081/user/loginView.jsp',
		        success: function(res) {
		          alert(JSON.stringify(res));
		          
//		          Location: {redirect_uri}code={authorize_code};
		        },
		        fail: function(error) {
		          alert(JSON.stringify(error))
		        }
		      });
		    },
	  })
  
 
  var Kakao = require('passport-kakao').Strategy;
  passport.use('kakao-login', new KakaoStrategy({
      clientID: 'u1N5M6Sn4cT3DMseJTdyatBT1zfAyAoS',
      clientSecret: 'Client_Secret',
      callbackURL: 'http://192.168.0.56:8081/user/loginView'
  },
  function(accessToken, refreshToken, profile, done) {
      console.log(profile);
      return done(null, profile);
  }));
  */

//============= kakao 로그인 =============
	
//============= 추가정보 입력 =============
	
	$( function() {
         $("a[href='#' ]:contains('추가정보 입력')").on("click" , function() {
            self.location = "/user/addUserPlus?userId=${user.userId}"
         });
      });
	
  ///////============== 移댁뭅?? ???? ==================
	  
///	var request = JSON.stringify(res.kakaoEmail);		//	// stringify 臾몄???? ??蹂???
	
//	$(function(){
	
//	  var value = $(JSON.stringify(authObj)).val();

	
//	   console.log(value);
	   
//	   self.location = "/user/addUser"
	
//	  });
  


	
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
			        
			        <input type="hidden" name="email" id="email" />
		  
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
					      <a class="btn btn-primary btn" href="#" role="button">회  원  가  입</a>
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
								Facebook Login	<a href="#" onclick="loginBtn()">
								<div class="fb-login-button" data-max-rows="1" id="loginBtn"  data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" scope="email" >
								<button type="button" class="button facebook" id="loginBtn" >페이스북 계정</button>
								</div>					
							</fb:login-button>
							 <!-- <button type="button" class="button facebook" id="loginBtn" >페이스북 계정</button>  -->
							<div id="response"></div>
							
							<div id="status"> </div>
							<!--  facebook login  end-->
							
							<!-- kakao ligin 
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=d4e94f0de61668f5bbbb2f58170b7891&redirect_uri=http://192.168.0.56:8081/oauth&response_type=code" class="kakaoLoginBtn" 
							id="kakao" onclick="kakaoLogin()">
							<img src="../images/kakao_account_login_btn_medium_narrow.png"></a>-->
							
							<!-- kakao ligin 
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=d4e94f0de61668f5bbbb2f58170b7891&redirect_uri=http://192.168.0.56:8081/oauth&response_type=code" class="kakaoLoginBtn"><img src="../images/kakao_account_login_btn_medium_narrow.png"></a>
							-->
							<a href="#">추가정보 입력</a>
  						<a id="custom-login-btn"  href="javascript:loginWithKakao()">
						<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
						<input type="hidden" id="kakaotocken" name="kakaotocken" value="0">
						</a>
					    <script type='text/javascript'>
					      //<![CDATA[
					        // ?ъ?⑺?? ?깆?? JavaScript ?ㅻ?? ?ㅼ???? 二쇱?몄??.
//					        Kakao.init(' 55a2455a0f492f809a761acf2db7e5f9');
					        // 移댁뭅?? 濡?洹몄?? 踰??쇱?? ???깊?⑸????.
//					        Kakao.Auth.createLoginButton({
//					          container: '#kakao-login-btn',
//					          success: function(authObj) {
//					            alert(JSON.stringify(authObj));
//					            location.href="/user/addUser";
//					          },
//					          fail: function(err) {
//					             alert(JSON.stringify(err));
//					          }
//					        });
					        /* 濡?洹몄?? 愿??? 荑??? ????  
							function setCookie( name , value , expired ){
							 
							 var date = new Date();
							 date.setHours(date.getHours() + expired);
							 var expried_set = "expries="+date.toGMTString();
							 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
							 
							}*/
							
							function setCookie( name , value , expired ){
								 
								 var date = new Date();
								 date.setHours(date.getHours() + expired);
								 var cookieValue = escape(value) + ((exdys==null) ? "" : "; expires=" + exdate.toGMTString());
								 document.cookie = name + "=" + cookieValue;
								}					        
					        
							/*	荑??? 遺??ъ?ㅺ린
					        function getCookie(name){
 
							    var nameofCookie = name + "=";
							    var x = 0;
							    while(x <= document.cookie.length){
							        var y = ( x + nameofCookie.length);
							        if(document.cookie.substring(x,y) == nameofCookie){
							            if((endofCookie = document.cookie.indexOf(";",y)) == -1)
							                endofCookie = document.cookie.length;
							            return unescape(document.cookie.substring(y,endofCookie));
							        }
							        x = document.cookie.indexOf(" ",x) + 1;
							        if( x == 0 )
							            break;
							        }
							        
							        return "";
							}*/
							
							function getCookie(name){
								 
							    nameofCookie = name + "=";
							    var cookieDate = document.cookie
							    var start = cookieDate.indexOf(cookiename);
							    var cookieValue = '';
							    if(start != -1){
							    	start += cookieName.length;
							    	var end = cookieDate.indexOf(';',start);
							    	if(end  == -1)end = cookieDate.length;
							    	cookieValue = cookieData.subString(start, end);
							    }
							    return unescape(cookieValue);
							}
							
					        //	濡?洹몄?? 援ы?? ???? 遺?遺?
					        Kakao.init('55a2455a0f492f809a761acf2db7e5f9');
					        function loginWithKakao() {
					          // 濡?洹몄?? 李쎌?? ????????.
					          Kakao.Auth.login({
					            success: function(authObj) {
					              console.log(JSON.stringify(authObj));
					              //location.href="/user/main";
					              Kakao.Auth.cleanup();
					              Kakao.Auth.login({
					                  persistAccessToken: true,
					                  persistRefreshToken: true,
					                  success: function(authObj) {
					                      setCookie("kakao_login","done",1); // 荑??ㅼ???? (濡?洹몄??)
					                      //alert(cookiedata);
					                      $('#kakaoName').val(res.properties.nickname);
										  $('#kakaoId').val(res.id);
					                      createLogoutKakao();
					                      window.location.href="kapi.kakao.com";
					                  },
					                      fail: function(err) {
					                       alert(JSON.stringify(err));
					                  }					                           
					              })
					            },
					            fail: function(err) {
					              alert(JSON.stringify(err));
					            }
					          });
					        };
					        function setCookie( name , value , expired ){
					        	 
					        	 var date = new Date();
					        	 date.setHours(date.getHours() + expired);
					        	 var expried_set = "expries="+date.toGMTString();
					        	 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
					        	 
					        	}
					        
					        
					        ////////////////////////////////////////////////////////////
					        
				        /* Kakao.init('55a2455a0f492f809a761acf2db7e5f9');
					        function loginWithKakao() {
					          // 濡?洹몄?? 李쎌?? ????????.
					          Kakao.Auth.createLoginButton({
   								container: '#kakao-login-btn',
   					//           Kakao.Auth.login({
					            success: function(authObj) {
					           	 Kakao.API.request({
					            	       url: '/user/loginView',
					            	 success: function(res) {

					                     alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

					                     alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

					                     console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

					                     console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

					                     console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 

					                 // res.properties.nickname으로도 접근 가능 )

					                     console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

					                   }

					                 })

					               },

					               fail: function(error) {

					                 alert(JSON.stringify(error));

					               }

					             });
					          }	 */
					        </script>
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