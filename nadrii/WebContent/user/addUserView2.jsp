<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!--  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .container-fluid {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}
  
    </style>
    
     			
<script>
$(document).ready(function() { 
	$("#userId").val('');
	idCheckFlag = false;
	$(".signupbtn").prop("disabled", true);
	
	
});

//	이메일 인증 
function check(){
	var email = $("#email").val();
	$.ajax({
		type:"POST",
		url:"/user/check",
		data:"email=" +email,     //    onclick();
		success :function(result){
			
		}
	});
}

 
///     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheckFlag = false;
    var pwdCheck = false;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
     
    function checkId() {
    
        var data = "userId=" + $("#userId").val();
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
    
    
	
   
    
//    function joinform(){
 //   	location.href="getUser.jsp"
 //   		var str3 = document.getElementById('join');

//		str3.submit();

//		alert("가입이 완료되었습니다.")
//   }
    
	function checkPwd(){
		var password = $("#password").val();
		var password2 = $("#password2").val();
		
		if(password == password2 ){
			$("#password2").css("background-color", "#B0F6AC");
			return;
		}
		
		if(password != password2 ){
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#password2").css("background-color", "#FFCECE");
			return;
		}
	
	}
	
	function emailValid(){
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/; 
		var email = $("#email").val();
		if(!regExp.test(email)){
			$(".signupbtn").prop("disabled", true);
			$("#email").css("background-color", "#FFCECE");
			return;
		}
		
		if(regExp.test(email)){
			$(".signupbtn").prop("disabled", false);
			$("#email").css("background-color", "#B0F6AC");
		}
	}
    
    function addUser(){
    	var data = "userId=" + $("#userId").val();
    	data += "&password=" + $("#password").val(); 
   		data += "&email=" + $("#email").val();
    	if($("#userId").val() == ''){
    		alert("아이디를 입력해주세요.");
    		$("#userId").focus();
    		return;
    	}
   		
   		if(idCheckFlag == false){
    		alert("아이디가 사용중입니다.");
    		$("#userId").val('');
    		$("#userId").focus();
    		$("#userId").css("background-color", "#B0F6AC");
    		return;
    	}
   		
   		if($("#password").val() == ''){
   			alert("비밀번호를 입력해주세요.");
   			$("#password").focus();
   			return;
   		}
   		
   		if($("#password2").val() == ''){
   			alert("비밀번호 확인을 입력해주세요.");
   			$("#password2").focus();
   			return;
   		}
    	
    	if($("#password").val() != $("#password2").val()){
    		alert("비밀번호가 일치하지 않습니다.");
    		$("#password").val('');
    		$("#password2").val('');
    		$("#password").focus();
    		return;
    	}
    	
    	if($("#email").val() == ''){
    		alert("이메일을 입력해주세요.");
    		$("#email").focus();
    		return;
    	}
    	
    }
    
    function delchk(){
        if(confirm("취소하시겠습니까?")){
            location.href = "/user/main";
        }
    }
    
    function addUser(){
    	$("body").attr("method" , "POST").attr("action" , "/user/addUser").submit();
    }
    
    $("#signUp").on("click", function(){
    	alert("가입하러 가자");
    	addUser();
    })
    
    
</script>
</head>

<body>

	
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-success text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" placeholder="Enter ID" class="form-control" id="userId" required class="userid" name="userId" oninput="checkId();" autofocus>
		      <span id = "chkMsg"></span>
		    </div>
			<div id="htmlId"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control password" id="password" name="password" placeholder="비밀번호">
		    </div>
		    <div id="htmlId"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" oninput="checkPwd();">
		    </div>
		  </div>
<!-- 	  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주민번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="ssn" name="ssn" placeholder="주민번호">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">" -  " 제외 13자리입력하세요</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="번호">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="번호">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  -->
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일" oninput="emailValid();">
		      <input type="button" value="인증" class="btn btn-primary btn-sm" id="btn_submit" onClick="check()">
		    </div>
		  </div> 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="signUp" class="btn btn-success cancelbtn signupCheck signupbtn">가   입</button>
			  <a class="btn btn-primary btn" id="cancel" href="#" role="button" >취   소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->

		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->


</body>

</html>