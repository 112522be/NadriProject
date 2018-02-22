<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html  lang="ko">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>
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
<script type="text/javascript">
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
  			return;
  		}
  		if(password=null||password==""){
  			makeToast("비밀번호를 입력하지 않았습니다");
  			return;
  		}
  		//alert("로그인");
  		$("form[name='Login']").attr("method","POST").attr("action","/user/login").submit();
	})
})

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
  		/*
  		if(code !=${session.code}){
  			makeToast("인증번호가 일치하지 않습니다");
  			return;
  		}
  		*/
  		alert("회원가입");
		
	})
	
	$("input[name='sendEmail']").on("click",function(){
		alert("이메일 전송");
	})
	
	$("input[name='checkCode']").on("click",function(){
		alert("확인");
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
            		//alert("아이디가 중복되었습니다.");
            		idCheckFlag = false;
            		$("#userId").css("background-color", "#FFCECE");
            		$(".signupbtn").prop("disabled", true);
	                $(".signupbtn").css("background-color", "#aaaaaa");
	                $("#htmlId").html("아이디 중복입니다.").css('color','red');
            		return;
            	}else{
            		//alert("사용 가능합니다.");
            		idCheckFlag = true;
            		$("#userId").css("background-color", "#B0F6AC");
            		$(".signupbtn").prop("disabled", false);
            		$("#htmlId").html("사용가능한 아이디 입니다.").css('color','blue');
            	}
            }
        });    
        
    }


//////////////////외부 로그인

$(function(){
	$("img[name='kakaoLogin']").on("click",function(){
		alert("카카오");
	})
	$("img[name='naverLogin']").on("click",function(){
		alert("네이버");
	})
})





</script>

<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  max-width: 700px;
  width: auto;
  height:700px;  
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 100%;
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
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
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
  
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
  
}
body .container .content form {
  position: relative;
  height: 400px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(4), body .container .content input:nth-of-type(4), body .container .content .more:nth-of-type(4) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(5), body .container .content input:nth-of-type(5), body .container .content .more:nth-of-type(5) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

img {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
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

body .container .content input.inpt.email {
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
body .container .content input.inpt.access {
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


body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
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

body .container .content.signin-cont.cont input.submit {
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
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}

body .container .content .submit-wrap {
  position: relative;
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
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
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

article{
	padding-left: 10%;
	padding-right: 10%; 
	padding-top: 10%;
	padding-bottom: 10%;
}

img{
	max-width: 100%;
 	width: auto; 
	height: auto;
	float: left;
	
}

.btn.btn-info{
	font-size: 20px;
	max-width: 100%;
 	width: auto; 
	height: auto;
	float:right;
	margin-left: 5%;

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



</style>
<!-- </head> -->
	
<body class="no-sidebar">
	
	<div id="page-wrapper">

		<div id="header">

			<div class="inner">
				<header>
					<h1><a href="../index.jsp" id="logo">나들이 정보</a></h1>
				</header>
			</div>
			<jsp:include page="/layout/toolbar.jsp" />
		</div>

		<section class="container">
		    <article class="">
		       
		        <div class="tabs">
		            <span class="tab signin active"><a href="#signin">로그인</a></span>
		            <span class="tab signup"><a href="#signup">가입하기</a></span>
		        </div>
		        <div class="content">
		            <div class="signin-cont cont">
		                <form name ="Login">
			                <input type="text" name="userId" class="inpt" required="required" placeholder="아이디">
			                
			                <input type="password" name="password" class="inpt" required="required" placeholder="비밀번호">
									        			    			                
				            <div class="submit-wrap">
				            <a class="btn btn-info" role="button" href="#">비밀번호 찾기</a>
				            <a class="btn btn-info" role="button" href="#" >아이디 찾기</a>
							
			 	               <input type="button" value="Login" class="submit">
				 	        </div>
        		    	</form>
    				</div>
    				<div class="signup-cont cont">
	                	<form name ="join">
							<input type="text" name="userId" class="inpt" required="required" placeholder="아이디">
							<input type="password" name="password" class="inpt" required="required" placeholder="비밀번호">
							<input type="password" name="password2" class="inpt" required="required" placeholder="비밀번호 확인">
							
							<ul>
								<li><input type="text" name="email" class="inpt email" required="required" placeholder="이메일" ></li>
	                			<li><input type="button" class="inpt access" name="sendEmail" value="인증"></li>
	                		</ul>
	                		
	                		<ul>
								<li><input type="text" name="code" class="inpt email" required="required" placeholder="인증번호" ></li>
	                			<li><input type="button" class="inpt access" name="checkCode" value="확인"></li>
	                		</ul>
	                		
							
	                		
							<div class="submit-wrap">
								<img src="../resources/images/userImage/kakao_account_login_btn_medium_narrow.png" class="6u 12u(mobile) special" name="kakaoLogin">
	                			<img src="../resources/images/userImage/naverLongBar-iloveimg-resized.png" class="6u 12u(mobile) special" name ="naverLogin">
								<input type="button" value="가입" class="submit">
							</div>
							
	        			</form>
	            	</div>
				</div>
			</article>
		</section>

	</div>

 	<div id="toastMessage" class='toastMessage' style='display:none'>Toast</div>
 	

</body>
</html>
