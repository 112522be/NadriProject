<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="../resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	

	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script> 
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
				self.location="https://kauth.kakao.com/oauth/authorize?client_id=ffbb3cfd77a7b485daca0958078eb74a&redirect_uri=http://127.0.0.1:8080/user/kakaoLogin&response_type=code";
			})
			$('img#naverLogin').bind('click', function() {
				self.location="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=hkuEu0FBgOT1dsQixJU3&state=success to nadrii&redirect_uri=http://127.0.0.1:8080/user/naverLogin";
			})
		})
	</script>		
	
</head>


	
<body class="no-sidebar">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

						<jsp:include page="/layout/inner.jsp" />
				 		 	

						<jsp:include page="/layout/toolbar.jsp" />

				</div>
		</div>
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
								Facebook Login	
								<div class="fb-login-button" data-max-rows="1" data-size="large"
										data-button-type="continue_with" data-show-faces="false"
										data-auto-logout-link="false" data-use-continue-as="false">
									</div>
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