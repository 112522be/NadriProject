<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>나들이 메인화면</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
		
		<!-- 합쳐지고 최소화된 최신 CSS 
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			 			 
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) 
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
    		
    	<!-- 합쳐지고 최소화된 최신 자바스크립트 
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> --> 		
    	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    	<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">-->
    	<!-- <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>  -->
    	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.0/jquery-ui.js"></script> 

<script type="text/javascript">

	//============= '로그인' 버튼 클릭 Event 처리 =============
	$(function() {
		$(".button.circled.12u").bind("click", function(event) {
			
			event.preventDefault();
			
			var userId = $("input[name='userId']").val();
			var userPw = $("input[name='userPw']").val();
			
			fncValidateCheck(userId, userPw);
		})
	});

	// ========== 아이디, 비밀번호 유효성 검사 ==========
	function fncValidateCheck(userId, userPw) {


		if (userId == null || userId == "") {
			alert("아이디를 입력해주세요.");
			return;
		}

		if (userPw == null || userPw == "") {
			alert("비밀번호를 입력해 주세요.")
			return;
		}

		if (id != null || password != null) {
			alert("아이디 또는 비밀번호가 틀립니다.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/user/login").submit();
	}

	// ========== Dialog 회원가입 ==========
		
		
		
	

	// ===============	회원가입	 ==============
	$(document).ready(function() {
		$("#userId01").val('');
		idCheckFlag = false;
		$(".signupbtn").prop("disabled", true);

	});

	$(document).ready(function() {
		$("#userId01").val('');
		idCheckFlag = false;
		$(".signupbtn").prop("disabled", true);

	});

	//   이메일 인증 
	function checkSend() {
		var email = $("#email").val();
		var frm = $("#frm").serialize();
		if (email != "") {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "/user/check",
				async : false,
				data : frm, //    onclick();
				success : function(result) {

					$("#btn_submit").hide();
					$("#btn_chkSuccess").css("display", "block");
					$("#confirmNum").css("display", "block");
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		} else {
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
		}

	}

	//이메일 인증 번호 확인
	function checkSuccess() {
		var confirmNum = $("#confirmNum").val();
		var frm = $("#frm").serialize();
		if (confirmNum != "") {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "/user/checkSuccess",
				async : false,
				data : frm, //    onclick();
				success : function(result) {
					if (result.result == "success") {
						alert("인증 확인되었습니다.");
						$("#checkNumStatus").val("Y");
					} else {
						alert("인증 번호가 다릅니다.");
						$("#checkNumStatus").val("N");
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		} else {
			alert("인증번호를 입력해주세요");
			$("#confirmNum").focus();
			return false;
		}

	}

	///     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheckFlag = false;
	var pwdCheck = false;
	//아이디 체크하여 가입버튼 비활성화, 중복확인.

	function checkId() {

		var data = "userId=" + $("#userId01").val();
		$.ajaxSettings.traditional = true;
		//alert("아이디 중복체크");
		$.ajax({
			type : "POST",
			data : data,
			url : "/user/json/checkId",
			dataType : "json",
			success : function(result) { /* function(result) */
				if (result.check == 1) {
					//alert("아이디가 중복되었습니다.");
					idCheckFlag = false;
					$("#userId01").css("background-color", "#FFCECE");
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#htmlId").html("아이디 중복입니다.").css('color', 'red');
					return;
				} else {
					//alert("사용 가능합니다.");
					idCheckFlag = true;
					$("#userId01").css("background-color", "#B0F6AC");
					$(".signupbtn").prop("disabled", false);
					$(".signupbtn").css("background-color", "#610B21");
					$("#htmlId").html("사용가능한 아이디 입니다.").css('color', 'blue');
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}

	function checkPwd() {
		var password = $("#password01").val();
		var password2 = $("#password02").val();
		if (password == password2) {
			$(".signupbtn").prop("disabled", false);
			$(".signupbtn").css("background-color", "#610B21");
			$("#password02").css("background-color", "#B0F6AC");
			return;
		}

		if (password == "" || password2 == "") {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#password02").css("background-color", "#B0F6AC");
			return;
		}

		if (password != password2) {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#password02").css("background-color", "#FFCECE");
			return;
		}
	}

	function emailValid() {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var email = $("#email").val();
		if (!regExp.test(email)) {
			$(".signupbtn").prop("disabled", true);
			$("#email").css("background-color", "#FFCECE");
			return;
		}

		if (regExp.test(email)) {
			$(".signupbtn").prop("disabled", false);
			$("#email").css("background-color", "#B0F6AC");
		}
	}

	//*/  

	function addUser() {
		var data = "userId=" + $("#userId01").val();
		data += "&password=" + $("#password01").val();
		data += "&email=" + $("#email").val();
		if ($("#userId01").val() == '') {
			alert("아이디를 입력해주세요.");
			$("#userId01").focus();
			return;
		}

		if (idCheckFlag == false) {
			alert("아이디가 사용중입니다.");
			$("#userId01").val('');
			$("#userId01").focus();
			$("#userId01").css("background-color", "#B0F6AC");
			return;
		}

		if ($("#checkNumStatus").val() == "Y") {
			alert("이메일 인증 완료 되었습니다.");
			return;
		}

		if ($("#checkNumStatus").val() != "N") {
			alert("이메일 인증이 실패 되었습니다. \n 재인증 해주세요");
			return;
		}
	}

	function delchk() {
		if (confirm("취소하시겠습니까?")) {
			$(".addUserView01")[0].reset();
			location.href = "/user/main";
		}
	}

	$(function() {
		$("button[type='button']:contains('가입')").on(
				"click",
				function() {

					if ($("#password01").val() == '') {
						alert("비밀번호를 입력해주세요.");
						$("#password01").focus();

						return;
					}

					if ($("#password02").val() == '') {
						alert("비밀번호 확인을 입력해주세요.");
						$("#password02").focus();
						return;
					}

					if ($("#email").val() == '') {
						alert("이메일을 입력해주세요.");
						$("#email").focus();
						return;
					}

					if ($("#confirmNum").val() == "") {
						alert("인증번호를 입력해주세요");
						$("#confirmNum").focus();
						return false;
					}

					alert("걸린건가?");

					//  		alert("걸린건가?");
					$("form").attr("method", "POST").attr("action",
							"/user/addUser").submit();
				});

		$("button[type='button']:contains('restTest')").on("click", function() {
			//alert("걸린건가?");
			self.location = "addUserViewRestTest.jsp";
		});
	});

	////////// TOPbutton////////////////////
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});

		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
	
<style>
#header {
	background-image:
		url(/resources/images/tripIcon/knocker-2163643_1920.jpg);
	background-color: #3a2748;
}

.buttonyagn {
	background-color: #df7366;
	display: inline-block;
	border-radius: 100%;
	width: 4.5em;
	height: 4.5em;
	line-height: 4.5em;
	text-align: center;
	font-size: 1.25em;
	color: #fff;
	padding: 0;
}

#topBtn{
				position:fixed;
				right:2%;
				bottom:50px;
				z-index:999;
				background:#6cc;
				font-weight: bolder
}
</style>

</head>
	
	
	
	
	<body class="homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

						<jsp:include page="/layout/inner.jsp" />
				 		 	

						<jsp:include page="/layout/toolbar.jsp" />

				</div>
				
<!-- /////////////////////////////////////////////////////////// -->
<c:if test="${  empty loginUser }">
<div class="wrapper-style1">
	<section id="banner">
	<div class="container">
		<div class="row">
		
			<article class="4u 12u(mobile) special">
				<header>
					<h3>
						<a href="#"><strong>아 이 디</strong></a>
					</h3>
				</header>
				<form>
					<input type="text" class="12u" name="userId" placeholder="  ID">
				</form>
			</article>
			<article class="4u 12u(mobile) special">
				<header>
					<h3>
						<a href="#"><strong>비밀번호</strong></a>
					</h3>
				</header>
				<form>
					<input type="password" class="12u" name="userPw" placeholder="  Password">
				</form>
			</article>
			<article class="2u 12u(mobile) special">
				<header>
					<h3>
						<a href="#"><strong>&nbsp;</strong></a>
					</h3>
					<input type="button" name="loginID" class="button circled 12u" value="로그인">
				</header>
			</article>
			<article class="2u 12u(mobile) special">
				<header>
					<h3>
						<a href="#"><strong>&nbsp;</strong></a>
					</h3>
					<input type="button" name="loginPW" class="12u" value="회원가입">
					
				</header>
			</article>
			
			
		</div>
	</div>
	</section>
</div>
</c:if>
<!-- /////////////////////////////////////////////////////////// -->				
				
			<!-- Carousel -->
				<section class="carousel">
					<div class="reel">
						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/racing-442393_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 정보</a></h3>
							</header>
							<p>어디로 갈까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/calendar-3073971_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 플래너</a></h3>
							</header>
							<p>계획을 짜볼까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/notebook-1803664_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나만의 나들이</a></h3>
							</header>
							<p>자랑해볼까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/admission-2974645_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 티켓</a></h3>
							</header>
							<p>입장권을 사볼까?</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/images/tripIcon/pinky-swear-329329_1920.jpg" alt="" /></a>
							<header>
								<h3><a href="#">나들이 모임</a></h3>
							</header>
							<p>누구와 갈까?</p>
						</article>

					</div>
				</section>


		</div><!-- page-wrapper -->

		<!-- 회원가입 다이얼로그 창 -->
	<div id="addUserView" style="display:none; ">
		<form id ="frm" class="form-horizontal addUserView01" title="회원가입" style="padding-top:25px;" name="joinform">
	     
	      <input id="checkNumStatus" name="checkNumStatus" type="hidden" value="N">
	        <div class="form-group icon01" style="">
	          <label for="userId" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">아 이 디</label>
	          <div class="col-sm-4 col-xs-6">
	            <input type="text" style="padding:10px; width:250px; ime-mode:disabled;" 
	            	placeholder="아이디" class="form-control" id="userId01" required class="userid" 
	            		name="userId" oninput="checkId();"autofocus>
	            <!-- <span id = "chkMsg"></span> -->
	          </div>
	         <div id="htmlId"></div>
	        </div>
	        
	        <div class="form-group" style="display:inline-block; width:404px; padding-top:30px;">
	          <label for="password" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">비밀번호</label>
	          <div class="col-sm-4 col-xs-6">
	            <input type="password" style="padding:10px; width:250px; ime-mode:disabled;" class="form-control password addUerlayoutInput" id="password01" required class="password01" name="password" placeholder="비밀번호"/>
	          </div>
	          <div id="htmlId"></div>
	        </div>
	        
	        <div class="form-group" style="padding-top:30px;">
	          <label for="password2" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">비밀번호 확인</label>
	          <div class="col-sm-4">
	            <input type="password" style="padding:10px; width:250px" class="form-control password02 addUerlayoutInput" id="password02" name="password02" placeholder="비밀번호 확인" oninput="checkPwd();"/>
	          </div>
	        </div>
	         <div class="form-group" style="display:inline-block; width:404px; padding-top:30px;">
	          <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">이메일</label>
	          <div class="col-sm-4">
	            <input type="text" style="padding:10px; width:250px" class="form-control addUerlayoutInput" id="email" name="email" placeholder="이메일" oninput="emailValid();"/>
	            <input type="button" style="margin-top:15px" value="인증발송" class="btn btn-primary btn-sm" id="btn_submit" onClick="checkSend();">
	            <input type="text" style="display:none;" class="form-contorl" id="confirmNum" name="confirmNum"/>
	            <input value="인증" style="display:none;" class="btn btn-primary icon fa- circled" id="btn_chkSuccess" onClick="checkSuccess();"/>
	          </div>
	        </div> 
	        
	        <div class="form-group" style="margin-top:25px;">
	          <div class="col-sm-offset-4  col-sm-4 text-center">
	            <button type="button" id="signUp" class="btn btn-success cancelbtn signupCheck signupbtn icon fa- circled" style="width:70px; height:70px; background:#610B21; padding:0; margin-left: 100px; position: absolute;"><div style="margin-top:-5px; font-size:24px;">가입</div></button>
	           <a class="btn btn-primary btn icon circled" href="#" style="width:70px; height:70px; padding:0; margin-left:205px; position: absolute; background:#0B615E;" onclick="delchk();">
	           <div style="font-size:24px; margin-top:-3px">취소</div></a>
	           <!-- <button type="button" class="btn btn-success cancelbtn signupCheck signupbtn icon fa- circled" style="margin-left:290px; padding:0;"><div class="">restTest</div></button>	 -->
	          </div>
	        </div>
     	 </form>
      </div>

	<!-- top button -->
	<a id="topBtn" href="#" class="icon fa-arrow-up circled"></a>


		<!-- Scripts 
			<script src="/resources/helios/assets/js/jquery.min.js"></script>-->
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		    <script src="/resources/helios/assets/js/main.js"></script>	

	</body>
</html>