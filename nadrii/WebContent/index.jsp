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
		
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous"> 
	
	<!-- Optional theme -->	
	<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> -->
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="../resources/helios/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	<!-- Scripts -->
	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script> 
	<script src="/resources/js/tripLocation.js"></script>
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		
<style>
body{
	background-color: #e1dae266;
}
.reel article{
	border: 1px solid;
	border-color: #878787;
}

</style>
<script type="text/javascript">


//========== Login Part ==========


	//============= '로그인' 버튼 클릭 Event 처리 =============
	$(function() {
		$("input[name='loginID']").bind("click", function(event) {
//			alert("로그인")
			event.preventDefault();
			
			var userId = $("input[name='userId']").val();
			var userPw = $("input[name='password']").val();
			
			fncLoginValidateCheck(userId, userPw);
		})
	});
///*
	// ========== 로그인 시 아이디, 비밀번호 유효성 검사 ==========
	function fncLoginValidateCheck(userId, userPw) {

//		alert(userId + " / " + userPw)

	 	if (userId == null || userId == "") {
			alert("아이디를 입력해주세요.");
			return;
		}

		if (userPw == null || userPw == "") {
			alert("비밀번호를 입력해 주세요.")
			return;
		}
		
		$("form").attr("method", "POST").attr("action", "/user/login").submit();
		
		alert(userId + " 님 환영합니다.")
	}
	
	
	

	///*
	
	
// ========== 회원가입 파트 ==========
	
	// ========== ID part ==========
	
		// ========== 아이디 유효성 검사 ==========
	
	
	function checkId() {

		var data = "userId=" + $("input[name='modalUserId']").val();

		$.ajax({
			type : "POST",
			data : data,
			url : "/user/json/checkId",
			dataType : "json",
			success : function(result) {
				if ($("input[name='modalUserId']").val() == "") {
					$("#duplicateId").html(" ").css('color', 'blue');
					$(".signupbtn").prop("disabled", true);
					$("input[name='modalUserId']").css("background-color", "#fafafa");
				} else if (result.check == 1) {
					//alert("아이디가 중복되었습니다.");
					idCheckFlag = false;
					$("input[name='modalUserId']").css("background-color",
							"#FFCECE");
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#duplicateId").html("&nbsp;&nbsp;이미 사용중인 아이디 입니다.").css('color', 'red');
				} else if (result.check == 0) {
					//alert("사용 가능합니다.");
					idCheckFlag = true;
					$("input[name='modalUserId']").css("background-color",
							"#B0F6AC");
					$(".signupbtn").prop("disabled", false);
					$(".signupbtn").css("background-color", "#610B21");
					$("#duplicateId").html("&nbsp;&nbsp;사용가능한 아이디 입니다.").css('color', 'blue');
					idCheck = 1;
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}

	// ========== Password part ==========
///*
	// ========== 비밀번호 확인 ==========
	function checkPwd() {

		var modaluserPw = $("input[name='modalUserPw']").val();
		var modalUserRePw = $("input[name='modalUserRePw']").val();

		if (modaluserPw == modalUserRePw) {
			$(".signupbtn").prop("disabled", false);
			$(".signupbtn").css("background-color", "#df7366");
			$("input[name='modalUserRePw']").css("background-color", "#B0F6AC");
			$("#validatePw").html("&nbsp;&nbsp;비밀번호가 일치 합니다.").css('color', 'blue');
			pwCheck = 1;
			
			/* if(idCheck == 1 && pwCheck == 1){
				$(".signupbtn").prop("disabled", true);
				$(".signupbtn").css("background-color", "#aaaaaa");
				$("input[name='modalUserId']").css("background-color", "#FFCECE");
				$("input[name='modalUserRePw']").css("background-color", "#FFCECE");
			} */
		}else if(modaluserPw == "" || modalUserRePw == "") {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("input[name='modalUserRePw']").css("background-color", "#fafafa");
			$("#validatePw").html(" ").css('color', 'blue');
		}else if (modaluserPw != modalUserRePw) {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("input[name='modalUserRePw']").css("background-color", "#FFCECE");
			$("#validatePw").html("&nbsp;&nbsp;비밀번호가 일치하지 않습니다.").css('color', 'red');
		}
	}
///*
	// ========== '회원가입 시 인증번호 요청' 버튼 Event 처리 ==========
	$(function() {
		$("a[href='#']:contains('인증번호요청')").bind("click", function(event) {
			event.preventDefault();
			checkSend();

		})
	});
///*
	// ========== '회원가입 시 인증번호 요청' 버튼 Event 처리 ==========
	function checkSend() {

		var email = $("input[name='modalUserEmail']").val();
		var emailSerialize = $("input[name='modalUserEmail']").serialize();

		if (email != "") {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "/user/check",
				async : false,
				data : emailSerialize, //    onclick();
				success : function(result) {
				//	alert("success")
					$("#btn_submit").hide();
					$("#btn_chkSuccess").css("display", "block");
					$("#confirmNum").css("display", "block");
					$("#serialNum").html("&nbsp;&nbsp;인증번호가 발송 되었습니다.").css('color', 'grey');
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		} else {
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return ;
		}

	}

	///*
	// ========== 회원가입 시 아이디, 비밀번호 유효성 검사 ==========
	function fncAddValidateCheck() {
		if ($("input[name='modalUserPw']").val() == '') {
			alert("비밀번호를 입력해주세요.");
			$("input[name='modalUserPw']").focus();

			return;
		}

		if ($("input[name='modalUserRePw']").val() == '') {
			alert("비밀번호 확인을 입력해주세요.");
			$("input[name='modalUserRePw']").focus();
			return;
		}

		if ($("input[name='modalUserEmail']").val() == '') {
			alert("이메일을 입력해주세요.");
			$("input[name='modalUserEmail']").focus();
			return;
		}

		if ($("input[name='modalUserEmailAuth']").val() == "") {
			alert("인증번호를 입력해주세요");
			$("input[name='modalUserEmailAuth']").focus();
			return ;
		} 

		$("form").attr("method", "POST").attr("action", "/user/addUser").submit();
		alert("회원가입이 완료 되었습니다.")
	}


	// ========== 회원가입 버튼 Block 처리 ==========
	//	/*
	var idCheckFlag = false;
	var pwdCheck = false;	
		
	$(document).ready(function() {
		$("input[name='modalUserId']").val('');
		idCheckFlag = false;
		$(".signupbtn").prop("disabled", true);
	});
	
	
	// ========== 이메일 인증 버튼 Event 처리 ==========
	$(function() {
		$("a[href='#']:contains('이메일 인증')").bind("click", function(event) {
			event.preventDefault();
			checkSuccess();

		})
	});

	// ========== 이메일 인증 번호 확인 ==========
	function checkSuccess() {
		var confirmNum = $("input[name='modalUserEmailAuth']").val();
		var frm = $("form").serialize();
		if (confirmNum != "") {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "/user/checkSuccess",
//				async : false,
				data : frm, //    onclick();
				success : function(result) {
					if (result.result == "success") {
						$("#checkNumStatus").val("Y");
						$("#authorNum").html("&nbsp;&nbsp;인증이 완료 되었습니다.").css('color', 'grey');
						
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
			$("input[name='modalUserEmailAuth']").focus();
			return false;
		}

	}
///*
	///     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheckFlag = false;
	var pwdCheck = false;
	//아이디 체크하여 가입버튼 비활성화, 중복확인.

	function emailValid() {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var email = $("input[name='modalUserEmail']").val();
		if (!regExp.test(email)) {
			$(".signupbtn").prop("disabled", true);
			$("input[name='modalUserEmail']").css("background-color", "#FFCECE");
			return;
		}

		if (regExp.test(email)) {
			$(".signupbtn").prop("disabled", false);
			$("input[name='modalUserEmail']").css("background-color", "#B0F6AC");
		}
	}

	
	///*
	function addUser() {
		var data = "userId=" + $("#userId01").val();
		data += "&password=" + $("#password01").val();
		data += "&email=" + $("#email").val();
		if ($("#userId01").val() == '') {
			alert("아이디를 입력해주세요.");
			$("input[name='modalUserId']").focus();
			return;
		}

		if (idCheckFlag == false) {
			alert("아이디가 사용중입니다.");
			$("input[name='modalUserId']").val('');
			$("input[name='modalUserId']").focus();
			$("input[name='modalUserId']").css("background-color", "#B0F6AC");
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
	//*/

	// ========== '취소' 버튼 Event 처리 ==========
	function delchk() {
		if (confirm("취소하시겠습니까?")) {
//			$(".addUserView01")[0].reset();
//			location.href = "/user/main";
			$("#myModal").empty();
			self.location = "/user/main"
			
			
			
		}
	}

	
	///*
	// ========== '가입' 버튼 Event 처리 ==========
	$(function() {
		$("button:contains('가 입')").on("click", function(event) {
			event.preventDefault();
			fncAddValidateCheck();
		})
	});
	///*
	// ========== '카카버' 버튼 Event 처리 ==========
	$(function() {
		$("input[name='kakaver']").on("click", function(event) {
			self.location="https://kauth.kakao.com/oauth/authorize?client_id=ffbb3cfd77a7b485daca0958078eb74a&redirect_uri=http://192.168.0.78:8080/user/kakaoLogin&response_type=code";
		})
	});
	
	///*
	// ========== TOP button ==========
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
		})
	});
	///*
	//=========alert 대신 toast
	function makeToast(title) {
		$('#toastMessage').text(title).fadeIn(400).delay(3000).fadeOut(400);
	}
	
	
	
	//=============== img 클릭=======================
		$(function(){
			
			$($(".reel img")[0]).on("click",function(){
			
				self.location = "../trip/getTheme"
		
				
			})
		});
		
		$(function(){	
			$($(".reel img")[1]).on("click",function(){
				//alert("어디로 갈까?");
				self.location ="/planner/getUserPlannerList";
			})
		});
			
		$(function(){	
			$($(".reel img")[2]).on("click",function(){
				self.location ="/comm/listComm";
			})
		});
			
		$(function(){	
			$($(".reel img")[3]).on("click",function(){
				
				self.location ="/ticket/listTicket";
				
			})
		});
		
			
		$(function(){	
			
		
			$($(".reel img")[4]).on("click",function(){
				self.location ="/group/listGroup";
			})
			
		});
		
		//*/ 	
		
		
		$(function(){
	$('.tabs .tab').click(function(){
	    if ($(this).hasClass('signin')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signin-cont').show();
	    } 
	    if ($(this).hasClass('signup')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signup-cont').show();
	    }
	});
	$('.container .bg').mousemove(function(e){
	    var amountMovedX = (e.pageX * -1 / 30);
	    var amountMovedY = (e.pageY * -1 / 9);
	    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
	});
})

function makeToast(title) {
	$('#toastMessage').text(title).fadeIn(400).delay(2000).fadeOut(400);
}

/////////////////////////////////컨트롤러 연결////////////////////

/////////////////로그인/////////////////
$(function(){
	$("input[value='Login']").on("click",function(){
 		var userId = $("form[name='Login'] input[name='userId']").val();
 		var password =$("form[name='Login'] input[name='password']").val();
		
  		if(userId==null || userId==""){
  			makeToast("아이디를 입력하지 않았습니다");
  			$("form[name='Login'] input[name='userId']").focus();
  			return;
  		}
  		if(password=null||password==""){
  			makeToast("비밀번호를 입력하지 않았습니다");
  			$("form[name='Login'] input[name='password']").focus();
  			return;
  		}
  		//alert("로그인");
  		//$("form[name='Login']").attr("method","POST").attr("action","/user/login").submit();
  		//openPost();
  		$("form[name='Login']").attr("method","POST").attr("action","/user/login").submit();
	})
})


function openPost(){
	var form = $("form[name='login']");
	var url ="/user/login";
	window.open("","form[name='login']","toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no");
	form.action = url;
	form.action = "post";
	form.target ="form[name='login']";
	form.userId = "questsolve"
	form.password = "1234"
	
	form.submit();
	
	//$("form[name='Login']").attr("method","POST").attr("action","/user/login").submit();
}

///////////////////회원가입/////////////////////////
$(function(){
	
	$("input[value='가입']").on("click",function(){
		
		var userId = $("form[name='join'] input[name='userId']").val();
		var password = $("form[name='join'] input[name='password']").val();
		var password2 = $("input[name='password2']").val();
		var email = $("input[name='email']").val();
		var code = $("input[name='code']").val();
		
		if(userId==null || userId==""){
  			makeToast("아이디를 입력하지 않았습니다");
  			return;
  		}
  		if(password=null||password==""){
  			makeToast("비밀번호를 입력하지 않았습니다");
  			return;
  		}
  		if(password2=null||password2==""){
  			makeToast("확인영 비밀번호를 입력하세요");
  			return;
  		}
  		
  		if(password2 != password){
  			makeToast("비밀번호가 서로 다릅니다");
  			return;
  		}
  		
  		if(email=null||email==""){
  			makeToast("이메일 주소를 입력하지 않았습니다");
  			return;
  		}
  		if(code=null||code==""){
  			makeToast("인증번호를 입력해주세요");
  			return;
  		}
  		
  		
  		$("form[name='join']").attr("method","POST").attr("action","/user/addUser").submit();
		
	})
	
	$("input[name='sendEmail']").on("click",function(){
		check();
	})
	
	$("input[name='checkCode']").on("click",function(){
		checkCode();
	})
	
	
})

////////////////////////////빨강 파랑


	function checkId() {
    
        var data = "userId=" + $("form[name='join'] input[name='userId']").val();
        $.ajax({
            	type:"POST",
            	data : data,
				url : "/user/json/checkId",     
            
            success : function(result) {
            	if(result.check == 1){
            		
            		idCheckFlag = false;
            		$("form[name='join'] input[name='userId']").css("background-color", "#FFCECE");
            		$("input[value='가입']").prop("disabled", true);
	                            		
            	}else{
            		
            		idCheckFlag = true;
            		$("form[name='join'] input[name='userId']").css("background-color", "#B0F6AC");
            		$("input[value='가입']").prop("disabled", false);
            		
            	}
            }
        });    
        
    }
//////////////////////인증번호 확인//////

function checkCode(){
	var code = $("input[name='code']").val();

	$.ajax({
		type:"POST",
		url:"/user/checkSuccess",
		data:"modalUserEmailAuth=" +code,     //    onclick();
		success :function(result){
			makeToast(result.result);
		}
	})
	
}
    

//////////////////외부 로그인

$(function(){
	$("img[name='kakaoLogin']").on("click",function(){
		self.location="https://kauth.kakao.com/oauth/authorize?client_id=ffbb3cfd77a7b485daca0958078eb74a&redirect_uri=http://192.168.0.78:8080/user/kakaoLogin&response_type=code";
	})
	$("img[name='naverLogin']").on("click",function(){
		self.location="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=hkuEu0FBgOT1dsQixJU3&state=success to nadrii&redirect_uri=http://192.168.0.78:8080/user/naverLogin";

	})
})

//////////////이메일

function check(){
	var email = $("input[name='email']").val();
	$.ajax({
		type:"POST",
		url:"/user/check",
		data:"modalUserEmail=" +email,     //    onclick();
		success :function(result){
			makeToast("이메일이 발송되었습니다.");
		}
	});
}

function emailValid(){
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; 
	var email = $("input[name='email']").val();
	if(!regExp.test(email)){
		$("input[value='가입']").prop("disabled", true);
		$("input[name='email']").css("background-color", "#FFCECE");
		
	}
	
	if(regExp.test(email)){
		$("input[value='가입']").prop("disabled", false);
		$("input[name='email']").css("background-color", "#B0F6AC");
	}
}

		$( function() {
			
			 $( "#startButton" ).on( "click", function() {
			      $( ".loginView" ).dialog({
			    	  
			    		width: 700,
						height: 650,
						open: function(event, ui){
							$("#dialog").css('overflow', 'auto');
							$(".ui-dialog .ui-dialog-titlebar").css("padding","0");
							$(".ui-widget-header").css("border","0");
							$(".ui-widget-header").css("background","#ffffff");
							
						}   	  
			    	  
			      });
			 });
		    
		  } );
				
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


.toastMessage {
    width:400px;
    height:auto;
    position:fixed;
    left:50%;
    margin-left:-200px;
    bottom:15px;
    background-color: #000000;
    color: #F0F0F0;
    font-size: 18px;
    padding:12px;
    text-align:center;
    border-radius: 2px;
    -webkit-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
    -moz-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
    box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1);
    z-index: 100;
}

.loginView * {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.loginView {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
.loginView .container {
  position: relative;
  overflow: hidden;
  max-width: 500px;
  width: auto;
  height:500px;  
  background-color: #ffffff;
}
.loginView .container .half {
  float: left;
  width: 100%;
  height: 100%;
  padding: 58px 40px 0;
}
.loginView .container .half.bg {
  background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
.loginView .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
.loginView .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
.loginView .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
.loginView .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
.loginView .container .tabs .tab.active a, .loginView .container .tabs .tab:hover a {
  color: #263238;
  
}
.loginView .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
  
}
.loginView .container .content form {
  position: relative;
  height: 400px;
}
.loginView .container .content label:first-of-type, .loginView .container .content input:first-of-type, .loginView .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
.loginView .container .content label:nth-of-type(2), .loginView .container .content input:nth-of-type(2), .loginView .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}

.loginView .container .content label:nth-of-type(3), .loginView .container .content input:nth-of-type(3), .loginView .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

.loginView .container .content label:nth-of-type(4), .loginView .container .content input:nth-of-type(4), .loginView .container .content .more:nth-of-type(4) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

.loginView .container .content label:nth-of-type(5), .loginView .container .content input:nth-of-type(5), .loginView .container .content .more:nth-of-type(5) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

.loginView img {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

.loginView .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
.loginView .container .content label:not([for='remember']) {
  display: none;
}
.loginView .container .content input.inpt {
  font-size: 13pt;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

.loginView .container .content input.inpt.email {
  font-size: 14px;
  display: block;
  width: 80%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float: left;
  
  
}
.loginView .container .content input.inpt.access {
  font-size: 14px;
  
  display: block;
  width: 20%;
  height: 42px;
  margin-bottom: 12px;
  
  color: #ffffff;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: #111111;
}


.loginView .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
.loginView .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
.loginView .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
.loginView .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
.loginView .container .content input.inpt:focus {
  border-color: #999999;
}
.loginView .container .content input.submit {
  font-size: 15px;
	
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

.loginView .container .content.signin-cont.cont input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
.loginView .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
.loginView .container .content input:focus {
  outline: none;
}

.loginView .container .content .submit-wrap {
  position: relative;
  bottom: 0;
  width: 100%;
}
.loginView .container .content .submit-wrap a {
  font-size: 14px;
  display: block;
  margin-bottom: 20px;
  text-align: center;
  text-decoration: none;
  color: #6b6b6b;
}
.loginView .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
.loginView .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.loginView .credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.loginView .credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

.loginView img{
	max-width: 100%;
 	width: auto; 
	height: auto;
}

.loginView .btn.btn-info{
	font-size: 20px;
	max-width: 100%;
 	width: auto; 
	height: auto;
	float:right;
	margin-left: 5%;

}

.white{
	width: 90px;
    float: right;
    font-size: 10pt;
    padding: 0;
    background: #ffffff;
}
.loginView input[type="button"]{
	padding: 0;
}

#navPanel, #titleBar {
		display: block !important;
	}

</style>

</head>




<body class="homepage">

<form>

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
							<article class="3u 12u(mobile) special">
								<header>
									<h3>
										<strong>아 이 디</strong>
									</h3>
								</header>
									<input type="text" class="12u" name="userId" id="userId"
										placeholder="  ID">
							</article>
							<article class="3u 12u(mobile) special">
								<header>
									<h3>
										<strong>비밀번호</strong>
									</h3>
								</header>
									<input type="password" class="12u" name="password"
										id="password" placeholder="  Password">
							</article>
							<article class="2u 12u(mobile) special">
								<header>

									<input type="button" name="loginID" 
										value="로그인">
								</header>
							</article>
							<article class="2u 12u(mobile) special">
								<header>

									<input type="button" name="loginPW" 
										data-toggle="modal" data-target="#myModal" value="회원가입">

								</header>
							</article>
							<article class="2u 12u(mobile) special">
								<header>
									<input type="button" name="kakaver" value="카카버">

								</header>
							</article>
						</div>
					</div>
				</section><!-- banner END -->
			</div>
		</c:if>
		<!-- /////////////////////////////////////////////////////////// -->
											
											<!-- Carousel -->
											<section class="carousel" id="carousel">
												<div class="reel">
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/racing-442393_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 정보</a>
															</h3>
														</header>
														<p>어디로 갈까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/calendar-3073971_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 플래너</a>
															</h3>
														</header>
														<p>계획을 세워볼까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/notebook-1803664_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나만의 나들이</a>
															</h3>
														</header>
														<p>자랑해볼까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/admission-2974645_1920.jpg" alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 티켓</a>
															</h3>
														</header>
														<p>입장권을 사볼까?</p>
													</article>
											
													<article>
														<a href="#" class="image featured"> <img
															src="/resources/images/tripIcon/pinky-swear-329329_1920.jpg"
															alt="" /></a>
														<header>
															<h3>
																<a href="#">나들이 모임</a>
															</h3>
														</header>
														<p>누구를 만날까?</p>
													</article>
											
												</div>
											</section><!-- Carousel END -->

										<!-- Modal -->
											<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
												role="dialog" aria-labelledby="mySmallModalLabel">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title" id="myModalLabel">
																<span class="glyphicon glyphicon glyphicon-user"
																	aria-hidden="true"> </span> 나들이 회원가입
															</h4>
														</div>
										
														<div class="modal-body">
																<h5>
																	<strong>아이디</strong><span class="timestamp" id="duplicateId"></span>
																</h5>
										
																<input type="text" name="modalUserId" placeholder="  ID" oninput="checkId();"> <br>
																<br>
																<h5>
																	<strong>비밀번호</strong><span class="timestamp" id="validatePw"></span>
																</h5>
																<input type="password" name="modalUserPw" placeholder="  Password">
																<br>
																<br>
																<h5>
																	<strong>비밀번호 확인</strong>
																</h5>
																<input type="password" name="modalUserRePw" placeholder="  Password" oninput="checkPwd();"> <br>
																<br>
																<h5>
																	<strong>이메일</strong>&nbsp;&nbsp;<a href="#"
																		class="btn btn-default">인증번호요청</a> <span class="timestamp" id="serialNum"></span>
																</h5>
																<input type="text" name="modalUserEmail" placeholder="  E-mail" oninput="emailValid();"> <br>
																<br>
																<h5>
																	<strong>인증번호입력</strong>&nbsp;&nbsp;<a href="#"
																		class="btn btn-default">이메일 인증</a> <span class="timestamp" id="authorNum"></span>
																</h5>
										
																<input type="text" name="modalUserEmailAuth" placeholder="  6자리 인증번호 입력"> <br>
																<br>
														</div>
										
														<div class="modal-footer">
															<button type="button" class="button signupbtn" data-dismiss="modal"
																style="background-color: #aaaaaa;">가 입</button>
															&nbsp;
															<button type="button" class="button" name="modalCancel"
																data-dismiss="modal" onclick="delchk();">취 소</button>
														</div>
													</div>
												</div>
											</div>
											<!-- modal End -->
											
											<jsp:include page="/layout/footer.jsp" />
	</div>
	<!-- page-wrapper -->


	<!-- top button -->
	<a id="topBtn" href="#" class="icon fa-arrow-up circled"></a>

</form>
<div id="toastMessage" class='toastMessage' style='display:none'>Toast</div>


			<div class="loginView" style="display: none;">
		        <section class="container">
				    <article class="">
				       
				        <div class="tabs">
				            <span class="tab signin active"><a href="#signin" style="font-size: 15pt;">로그인</a></span>
				            &nbsp;&nbsp;&nbsp;
				            <span class="tab signup"><a href="#signup" style="font-size: 15pt;">가입하기</a></span>
				        </div>
				        <div class="content">
				            <div class="signin-cont cont">
				                <form name ="Login">
					                <input type="text" name="userId" class="inpt" required="required" placeholder="아이디">
					                
					                <input type="password" name="password" class="inpt" required="required" placeholder="비밀번호">
											        			    			                
						            <div class="submit-wrap">
						            <a class="button white" role="button" href="#">비밀번호 찾기</a>
						            <a class="button white" role="button" href="#" >아이디 찾기</a>
									
					 	               <input type="button" value="Login" class="submit">
						 	        </div>
		        		    	</form>
		    				</div>
		    				<div class="signup-cont cont">
			                	<form name ="join">
									<input type="text" name="userId" class="inpt" required="required" placeholder="아이디" oninput="checkId();">
									<input type="password" name="password" class="inpt" required="required" placeholder="비밀번호">
									<input type="password" name="password2" class="inpt" required="required" placeholder="비밀번호 확인">
									
									<ul>
										<li><input type="text" name="email" class="inpt email" required="required" placeholder="이메일" value="${outerUser.email}" oninput="emailValid();"></li>
			                			<li><input type="button" class="inpt access" name="sendEmail" value="인증"></li>
			                		</ul>
			                		
			                		<ul>
										<li><input type="text" name="code" class="inpt email" required="required" placeholder="인증번호" ></li>
			                			<li><input type="button" class="inpt access" name="checkCode" value="확인"></li>
			                		</ul>
			                		
									
			                		
									<div class="submit-wrap">
										<img src="../resources/images/userImage/kakao_account_login_btn_medium_narrow.png" class="6u 12u(mobile) special" name="kakaoLogin">
			                			<img src="../resources/images/userImage/naverLongBar-iloveimg-resized.png" class="6u 12u(mobile) special" name ="naverLogin" style="padding-left: 20px">
										<input type="button" value="가입" class="submit">
									</div>
									
			        			</form>
			            	</div>
						</div>
					</article>
				</section>
			</div>



</body>




</html>