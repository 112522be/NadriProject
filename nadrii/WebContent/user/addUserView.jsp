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

//	�̸��� ���� 
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

 
///     ���̵�� ��й�ȣ�� ���� ���� ��� ���Թ�ư ��Ȱ��ȭ�� ���� ��������
    var idCheckFlag = false;
    var pwdCheck = false;
    //���̵� üũ�Ͽ� ���Թ�ư ��Ȱ��ȭ, �ߺ�Ȯ��.
     
    function checkId() {
    
        var data = "userId=" + $("#userId").val();
        $.ajax({
            	type:"POST",
            	data : data,
				url : "/user/checkId",     
            
            success : function(result) {
            	if(result.check == 1){
            		//alert("���̵� �ߺ��Ǿ����ϴ�.");
            		idCheckFlag = false;
            		$("#userId").css("background-color", "#FFCECE");
            		$(".signupbtn").prop("disabled", true);
	                $(".signupbtn").css("background-color", "#aaaaaa");
	                $("#htmlId").html("���̵� �ߺ��Դϴ�.").css('color','red');
            		return;
            	}else{
            		//alert("��� �����մϴ�.");
            		idCheckFlag = true;
            		$("#userId").css("background-color", "#B0F6AC");
            		$(".signupbtn").prop("disabled", false);
            		$("#htmlId").html("��밡���� ���̵� �Դϴ�.").css('color','blue');
            	}
            }
        });    
        
    }
    
    
	
   
    
//    function joinform(){
 //   	location.href="getUser.jsp"
 //   		var str3 = document.getElementById('join');

//		str3.submit();

//		alert("������ �Ϸ�Ǿ����ϴ�.")
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
    		alert("���̵� �Է����ּ���.");
    		$("#userId").focus();
    		return;
    	}
   		
   		if(idCheckFlag == false){
    		alert("���̵� ������Դϴ�.");
    		$("#userId").val('');
    		$("#userId").focus();
    		$("#userId").css("background-color", "#B0F6AC");
    		return;
    	}
   		
   		if($("#password").val() == ''){
   			alert("��й�ȣ�� �Է����ּ���.");
   			$("#password").focus();
   			return;
   		}
   		
   		if($("#password2").val() == ''){
   			alert("��й�ȣ Ȯ���� �Է����ּ���.");
   			$("#password2").focus();
   			return;
   		}
    	
    	if($("#password").val() != $("#password2").val()){
    		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
    		$("#password").val('');
    		$("#password2").val('');
    		$("#password").focus();
    		return;
    	}
    	
    	if($("#email").val() == ''){
    		alert("�̸����� �Է����ּ���.");
    		$("#email").focus();
    		return;
    	}
    	
    	if(confirm("ȸ�������� �Ͻðڽ��ϱ�?")){
    		$("form").attr("method" ,"POST").attr("action" ,"/user/addUser").submit();
    		
    	
    	}
    }
    
    function delchk(){
        if(confirm("����Ͻðڽ��ϱ�?")){
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-success text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" placeholder="Enter ID" class="form-control" id="userId" required class="userid" name="userId" value="${facebookId}" oninput="checkId();" autofocus>
		      <span id = "chkMsg"></span>
		    </div>
			<div id="htmlId"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control password" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		    <div id="htmlId"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��" oninput="checkPwd();">
		    </div>
		  </div>
<!-- 	  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ֹι�ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="ssn" name="ssn" placeholder="�ֹι�ȣ">
		      <span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">" -  " ���� 13�ڸ��Է��ϼ���</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="�ּ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
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
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="��ȣ">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="��ȣ">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  -->
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���" oninput="emailValid();">
		      <input type="button" value="����" class="btn btn-primary btn-sm" id="btn_submit" onClick="check()">
		    </div>
		  </div> 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success cancelbtn signupCheck signupbtn" onclick="addUser();" >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button" onclick="delchk();" >��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->

		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->


</body>

</html>