<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="utf-8">
	
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
				self.location = "/user/faindIdUser"
			});
		});
		
		
/**
 * 로그인
 */
function fainId(){
	var data = "userName=" + $("#userName").val;
	data += "&email=" + $("#email").val;
	var emailLists = data.user_email;
	var emailLength = emailLists.length
	var emailfind = emailLists.substring(1, emailLength-1)
	
	
	if(userName == ''){
		alert("이름을 입력해 주세요.");
		$("#userName").focus();
		return;
	}
	if(email ==''){
		alert("이메일을 입력해 주세요.");
		$("#email").focus();
		return;
	}
	
	$.ajax({
		data :data,
		url : "/user/loginProc",
		type : "POST",
		success : function(result){
			if(result.msg == "failed"){
				alert("이메일을 확인해주세요.");
				return;
			}
			if(result.msg == "success"){
				location.href="/user/loginView";
			}
		}
	});
		
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

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userName" class="col-sm-4 control-label">이&nbsp;름</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userName" id="userName"  placeholder="이름" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="email" class="col-sm-4 control-label">이&nbsp;메&nbsp;일</label>
					    <div class="col-sm-6">
					      <input type="email" class="form-control" name="email" id="email" placeholder="이메일" oninput="emailValid();">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary signupbtn" onclick="fainId();" >다&nbsp;음</button>
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