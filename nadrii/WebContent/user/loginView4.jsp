<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
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
		//============= '로그인' 버튼 클릭 Event 처리 =============
		$( function() {
			$(".btn.btn-primary:contains('로 그 인')").bind("click" , function() {
				alert("로그인");
				validateCheck();
			});
		});
		//================================================================
		
		function validateCheck(){
			var id = $("#userId").val();
			var password = $("#password").val();
			//alert(id+ ":::"+password);
			
			if(id == null || id ==""){
				alert("아이디 입력해라");
				return;
			}
			
			if(password == null || password=="" ){
				alert("비번은 쳐야지 그래야 안쳐맞지")
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").submit();
		}
		$(function() {
			$('img#kakaoLogin').bind('click', function() {
				self.location="https://kauth.kakao.com/oauth/authorize?client_id=ffbb3cfd77a7b485daca0958078eb74a&redirect_uri=http://192.168.0.78:8080/user/kakaoLogin&response_type=code";
			})
			$('img#naverLogin').bind('click', function() {
				self.location="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=hkuEu0FBgOT1dsQixJU3&state=success to nadrii&redirect_uri=http://127.0.0.1:8080/user/naverLogin";
			})
		})
		
		/////////////////////// facebook login/////////////////////////////////
	
	
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				testAPI();
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
			js.src = "https://connect.facebook.net/ko_KR/all.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function testAPI() {
			 alert("페이스북 로그인 이동");
			 FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
			        console.log(JSON.stringify(response));
			        $("#name").text("이름 : "+response.name);
			        $("#email").text("이메일 : "+response.email);
			        $("#gender").text("성별 : "+response.gender);
			        $("#birthday").text("생년월일 : "+response.birthday);
			        $("#id").text("아이디 : "+response.id);

			        
			        location.href="/user/addUserFacebook?" + encodeURI(JSON.stringify(response));
			    });
		     }
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
	
	<!--  화면구성 div Start /////////////////////////////////////-->
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
								<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력해 주세요.">
								<c:if test="${systemMessage == 'IdError'}">
									아이디가 잘못되었소이다
								</c:if>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-sm-4 control-label">PASSWORD</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password"	id="password" placeholder="비밀번호를 입력해 주세요">
								<c:if test="${systemMessage == 'pwError'}">
									비밀번호가 잘못되었소이다
								</c:if>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<button type="button" class="btn btn-primary">로 그 인</button>
								<a class="btn btn-primary btn" href="#" role="button">회원가입</a> 
								<a class="btn btn-warning btn" role="button" href="#">아이디 찾기</a> 
								<a class="btn btn-info" role="button" href="#">비밀번호 찾기</a>
							</div>

							<div class="col-sm-offset-4 col-sm-6 text-center">

								<br>
								<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
								페이스북 로그인	
								<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
								</fb:login-button>
								<div id="status"></div>
								<!--  facebook login end -->
								
						
							<a href="#">추가정보 입력</a><br/>
							<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" id="kakaoLogin"/>
							<br/><br/>
							<img src="/resources/images/userImage/naver_login.png" width="300" id="naverLogin"/>
					    <script type='text/javascript'>
					      
							
							function setCookie( name , value , expired ){
								 
								 var date = new Date();
								 date.setHours(date.getHours() + expired);
								 var cookieValue = escape(value) + ((exdys==null) ? "" : "; expires=" + exdate.toGMTString());
								 document.cookie = name + "=" + cookieValue;
								}					        
					        
														
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
							
					        
					        Kakao.init('55a2455a0f492f809a761acf2db7e5f9');
					        function loginWithKakao() {
					        
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
										  $('#kakaoEmail').val(res.email);
					                      createLogoutKakao();
					                      window.location.href="/user/addUserView";
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