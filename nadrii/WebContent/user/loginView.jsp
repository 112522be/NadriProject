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
		/*
		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
//				alert(id +"/"+ pw)
				
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
	
				//fncLoginCheck(id, pw);
				
//				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		//*/
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
								Facebook Login	
								<div class="fb-login-button" data-max-rows="1" data-size="large"
										data-button-type="continue_with" data-show-faces="false"
										data-auto-logout-link="false" data-use-continue-as="false">
									</div>
								</fb:login-button>
								<div id="status"></div>
								<!--  facebook login end -->
								
								<!-- kakao ligin 
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=d4e94f0de61668f5bbbb2f58170b7891&redirect_uri=http://192.168.0.56:8081/oauth&response_type=code" class="kakaoLoginBtn" 
							id="kakao" onclick="kakaoLogin()">
							<img src="../images/kakao_account_login_btn_medium_narrow.png"></a>-->
							
							<!-- kakao ligin 
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=d4e94f0de61668f5bbbb2f58170b7891&redirect_uri=http://192.168.0.56:8081/oauth&response_type=code" class="kakaoLoginBtn"><img src="../images/kakao_account_login_btn_medium_narrow.png"></a>
							-->
							<a href="#">추가정보 입력</a><br/>
							<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" id="kakaoLogin"/>
							<br/><br/>
							<img src="/resources/images/userImage/naver_login.png" width="300" id="naverLogin"/>
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