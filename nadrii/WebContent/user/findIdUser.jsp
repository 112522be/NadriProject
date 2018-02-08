<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8"r>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
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
		
		
/**
 * 아이디 찾기
 */

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
 
//	이메일 인증 
	function checkSend(){
		var email = $("#email").val();
		var frm = $("#frm").serialize();
		if(email !=""){
			$.ajax({
				type:"POST",
				dataType : "json",
				url:"/user/check",
				async: false,
				data:frm,     //    onclick();
				success :function(result){
					
					$("#btn_submit").hide();
					$("#btn_chkSuccess").css("display","block");
					$("#confirmNum").css("display","block");
				},
				error:function(request,status,error){
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
			});
		}else{
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
		}
		
	}

	//이메일 인증 번호 확인
	function checkSuccess(){
		var confirmNum = $("#confirmNum").val();
		var frm = $("#frm").serialize();
		if(confirmNum !=""){
			$.ajax({
				type:"POST",
				dataType : "json",
				url:"/user/checkSuccess",
				async: false,
				data:frm,     //    onclick();
				success :function(result){
					if(result.result == "success"){
						alert("인증 확인되었습니다.");
						$("$checkNumStatus").val("Y");
					}else{
						alert("인증 번호가 다릅니다.");
						$("$checkNumStatus").val("N");
					}
				},
				error:function(request,status,error){
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
			});
		}else{
			alert("인증번호를 입력해주세요");
			$("#confirmNum").focus();
			return false;
		}
	}

 
 
 
function fainId(){
	var data = "&email=" + $("#email").val();
	if($("#email").val() == ""){
		alert("이메일을 입력해 주세요.");
		$("#email").focus();
		return;
	}
	
	if($("#confirmNum").val() == ""){
		alert("인증번호를 입력해주세요");
		$("#confirmNum").focus();
		return false;
	}
	
	if($("#checkNumStatus").val() != "N"){
		alert("이메일 인증이 실패 되었습니다. \n 재인증 해주세요");
		return;
	}
	
	if(confirm("아이디를 찾으시겠습니까?")){
	$.ajax({
		data :data,
		url : "/user/loginProc",
		type : "POST",
		success : function(result){
			if(result.msg == "success"){
				alert("이메일 인증되었습니다.");
				location.href="/user/loginView";
			}
		 }
	});	
}
}
		
	function delchk(){
        if(confirm("취소하시겠습니까?")){
            location.href = "/user/main";
        }
    }
		
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
	 	 	
		 	 	<br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">아&nbsp;이&nbsp;이&nbsp;디&nbsp;찾&nbsp;기</h1>

			        <form id ="frm" class="form-horizontal">
		  
					  <!-- <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">아&nbsp;이&nbsp;디</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					    </div>
					  </div> -->
					  
					  <div class="form-group">
					    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="email" name="email" placeholder="이메일" oninput="emailValid();">
					      <input type="button" value="인증발송" class="btn btn-primary btn-sm" id="btn_submit" onClick="checkSend();">
					      <input type="text" style="display:none;" class="form-contorl" id="confirmNum" name="confirmNum"/>
					      <input type="button" value="인증" style="display:none;" class="btn btn-primary btn-sm" id="btn_chkSuccess" 
					       onClick="checkSuccess();">
					       <input type="text" style="display:none;" class="form-control" id="userId" name="userId" placeholder="${ user.userId }">
					    </div>
					  </div> 
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary signupbtn" onclick="fainId();" >다&nbsp;음</button>
					   	  <a class="btn btn-primary btn" href="#" role="button" onclick="delchk();" >취&nbsp;소</a>
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