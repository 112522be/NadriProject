<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

		//============= "�α���"  Event ���� =============
		/* $( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		
		
/**
 * ���̵� ã��
 */
 
 $(document).ready(function() { 
		$("#userId").val('');
		idCheckFlag = false;
		$(".signupbtn").prop("disabled", true);
		
		
	});
 
 var idCheckFlag = false;
 var pwdCheck = false;
 
function faindPasswordUser(){
	var data = "userId=" + userId;
	data += "&userName=" + userName;
	data += "&email" +email;
	if($("#userId").val() == ''){
		alert("���̵� �Է����ּ���.");
		$("#userId").focus();
		return;
	}
	if(idCheckFlag == false){
		alert("���� ���̵� �Դϴ�.");
		$("#userId").val('');
		$("#userId").focus();
		$("#userId").css("background-color", "#B0F6AC");
		return;
	}
	if(userName ==''){
		alert("�̸��� �Է����ּ���.");
		$("#userName").focus();
		return;
	}
	if(email ==''){
		alert("�̸����� �Է����ּ���.");
		$("#email").focus();
		return;
	
	
	$.ajax({
		data :data,
		url : "/user/loginProc",
		type : "POST",
		success : function(result){
			if(result.msg == "failed"){
				alert("���̵� �Ǵ� �̸����� Ȯ�����ּ���.");
				return;
			}
			if(result.msg == "success"){
				location.href="/user/loginView";
			}
		}
	});
		
}
}

	function checkId() {
		
		var data = "userId=" + $("#userId").val();
        $.ajax({
            	type:"POST",
            	data : data,
				url : "/user/checkId",
				success : function(result) {
        	if(result.check == 1){
        		//alert("���̵� �ߺ��Ǿ����ϴ�.");
        		idCheckFlag = true;
        		$("#userId").css("background-color", "#B0F6AC");
        		$(".signupbtn").prop("disabled", false);
        		return;
        	}else{
        		//alert("��� �����մϴ�.");
        		idCheckFlag = false;
        		$("#userId").css("background-color", "#FFCECE");
        		$(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<br/>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">��&nbsp;��&nbsp;��&nbsp;ȣ&nbsp;ã&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userName" class="col-sm-4 control-label">��&nbsp;��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userName" id="userName"  placeholder="�̸�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">��&nbsp;��&nbsp;��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" oninput="checkId();">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="email" class="col-sm-4 control-label">��&nbsp;��&nbsp;��</label>
					    <div class="col-sm-6">
					      <input type="email" class="form-control" name="email" id="email" placeholder="�̸���" oninput="emailValid();">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary signupbtn" onclick="faindPasswordUser()">��&nbsp;��</button>
					    </div>
					  </div>
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>