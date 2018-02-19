<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Helios by HTML5 UP</title>
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
			

    		<script>
    		
	    		//============= 회원원가입화면이동 =============
	    		/* $( function() {
	    			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	    			$("a[href='#' ]").on("click" , function() {
	    				self.location = "/user/addUser"
	    			});
	    		});  */
	    		
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
	    			 
			     $(function(){
			    	 $("#addUserDialog").click(function(){
			    		alert("되냐?");
			    		$("#addUserView").dialog({
			    			width:450,
			    			height:650,
			    			model:true,
			    			autoOpen:false,
			    			resizable: false,
			    			position: [700,100],
			    		})
			    		
			    		alert("여기도되냐?");
			    			 $('#addUserView').dialog('open');
			    	})
			    });


			    
			    
			    // ===============	회원가입	 ==============
		

//   이메일 인증 
function checkSend(){
   var email = $("#email").val();
   var frm = $("#frm").serialize();
   if(email !=""){
      $.ajax({
         type:"POST",
//         dataType : "json",
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
 //      location.href="getUser.jsp"
 //         var str3 = document.getElementById('join');

//      str3.submit();

//      alert("가입이 완료되었습니다.")
//   }
    
      var password = $("#password").val();
      var password2 = $("#password2").val();
      
      function checkPwd(){
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
       
       alert($("#checkNumStatus").val());
       if($("#confirmNum").val() == ""){
          alert("인증번호를 입력해주세요");
          $("#confirmNum").focus();
          return false;
       }
       
       if($("#checkNumStatus").val() == "N"){
          alert("이메일 인증이 실패 되었습니다. \n 재인증 해주세요");
          return;
       }
       
       
       if(confirm("회원가입을 하시겠습니까?")){
           $.ajax({
             data : data,
             url : "/user/addUser",
             type : "POST",
             success : function(result){
                if(result.msg == "success"){
                   alert("가입이 완료되었습니다.");
                   location.href="/user/main";
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
    function addUser(){
    	$("body").attr("method" , "POST").attr("action" , "/user/addUser").submit();
    }
    
    $("#signUp").on("click", function(){
    	alert("가입하러 가자");
    	addUser();
    })
			   
    
    		</script>
    		
    		<style>
    		
    		.groupId{width:420px; margin:auto; display:block; height:67px;}
    		.labelId{width:50px; float:left; padding-top: 4px;}
    		.loginId{width:350px; float:left;}
    		
    		.groupPw{width:570px; margin:auto; display:block; height:67px;}
    		.labelPw{width:125px; float:left; padding-top: 4px;}
    		.loginPw{width:350px; float:left;}
    		
			form textarea{padding:5px;}
			
			.addUerlayout{width:130px; float:left}
    		</style>
	
	</head>
	
	
	
	
	<body class="homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

						<jsp:include page="/layout/inner.jsp" />
				 		 	

						<jsp:include page="/layout/toolbar.jsp" />

				</div>

			<!-- Banner  ////////// index 화면 로그인,회원가입 화면 ////////// --> 
			<c:if test="${  empty loginUser }">
				<section id="banner">
					<header>
					
					<!-- login -->
					<c:if test="${ ! empty loginUser }">
							<li>
								<a href="/user/getUser?userId=${loginUser.userId}">
								<img src="/resources/images/00742106_105752.jpg" alt="..." class="img-circle" width="30px" height="30px">
								<span>
									<c:if test="${ loginUser.userName eq null }">
										${ loginUser.userId }
									</c:if>
										${ loginUser.userName }
										님
								</span>
								</a>
							</li>
					</c:if>
					
					
					<c:if test="${  empty loginUser }">	
						<form class="form-horizontal">

						<div class="form-group groupId">
							<label for="userId" class="col-sm-4 control-label labelId">I&nbsp;D</label>
							<div class="col-sm-6 loginId">
								<input type="text" class="form-control" name="userId" id="userId" style="padding:0.5em" placeholder="아이디를 입력해 주세요.">
								<c:if test="${systemMessage == 'IdError'}">
									아이디가 잘못되었소이다
								</c:if>
							</div>
						</div>

						<div class="form-group groupPw">
							<label for="password" class="col-sm-4 control-label labelPw">PASSWORD</label>
							<div class="col-sm-6 loginPw">
								<input type="password" class="form-control" name="password"	id="password" style="padding:0.5em" placeholder="비밀번호를 입력해 주세요">
								<c:if test="${systemMessage == 'pwError'}">
									비밀번호가 잘못되었소이다
								</c:if>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<button class="btn btn-primary icon fa- circled" style="width:70px; height:70px; padding:0; margin-left: -40px; position: absolute;"><div style="position:absolute; margin:-40px 0 0 10px; font-size:14px;">로 그 인</div></button>
								<a id="addUserDialog" href="#addUserView" class="btn btn-warning icon fa- circled" data-rel="dialog" style="width:70px; height:70px; margin-left:60px; padding:0;"><div style="font-size:14px; margin-top:-4px ;">회원가입</div></a>
							</div>
						</div>
						</form>
					</c:if>
				</header>
			</section>
		</c:if>
			
			<!-- 회원가입 다이얼로그 창 -->
	<div id="addUserView" style="display:none; ">
		<form id ="frm" class="form-horizontal addUserView01" title="회원가입" style=" padding-top:25px;">
	      <input id="checkNumStatus" name="checkNumStatus" type="hidden" value="N">
	        <div class="form-group icon01" style="">
	          <label for="userId01" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">아 이 디</label>
	          <div class="col-sm-4">
	            <input type="text" style="padding:10px; width:250px" placeholder="Enter ID" class="form-control" id="userId01" required class="userid01" name="userId01" oninput="checkId();"autofocus>
	            <!-- <span id = "chkMsg"></span> -->
	          </div>
	         <div id="htmlId"></div>
	        </div>
	        
	        <div class="form-group" style="display:inline-block">
	          <label for="password01" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">비밀번호</label>
	          <div class="col-sm-4">
	            <input type="password" style="padding:10px; width:250px" class="form-control password01 addUerlayoutInput" id="password01" name="password01" placeholder="비밀번호"/>
	          </div>
	          <div id="htmlId"></div>
	        </div>
	        
	        <div class="form-group">
	          <label for="password2" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">비밀번호 확인</label>
	          <div class="col-sm-4">
	            <input type="password" class="form-control password02 addUerlayoutInput" id="password02" name="password02" placeholder="비밀번호 확인" oninput="checkPwd();"/>
	          </div>
	        </div>
	         <div class="form-group">
	          <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label addUerlayout">이메일</label>
	          <div class="col-sm-4">
	            <input type="text" class="form-control addUerlayoutInput" id="email" name="email" placeholder="이메일" oninput="emailValid();"/>
	            <input type="button" value="인증발송" class="btn btn-primary btn-sm" id="btn_submit" onClick="checkSend();">
	            <input type="text" style="display:none;" class="form-contorl" id="confirmNum" name="confirmNum"/>
	            <input value="인증" style="display:none;" class="btn btn-primary icon fa- circled" id="btn_chkSuccess" onClick="checkSuccess();"/>
	          </div>
	        </div> 
	        
	        <div class="form-group" style="margin-top:25px;">
	          <div class="col-sm-offset-4  col-sm-4 text-center">
	            <button type="button" id="signUp" class="btn btn-success cancelbtn signupCheck signupbtn icon fa- circled" style="width:70px; height:70px; background:#610B21; padding:0; margin-left: 100px; position: absolute;"><div style="margin-top:-5px; font-size:24px;">가입</div></button>
	           <a class="btn btn-primary btn icon fa- circled" href="#" style="width:70px; height:70px; padding:0; margin-left:205px; position: absolute; background:#0B615E;"><div style="font-size:24px; margin-top:-3px">취소</div></a>
	           <!-- <button type="button" class="btn btn-success cancelbtn signupCheck signupbtn icon fa- circled" style="margin-left:290px; padding:0;"><div class="">restTest</div></button>	 -->
	          </div>
	        </div>
     	 </form>
      </div>
      
			<!-- Carousel -->
				<section class="carousel">
					<div class="reel">

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic01.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Pulvinar sagittis congue</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic02.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Fermentum sagittis proin</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic03.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Sed quis rhoncus placerat</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic04.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Ultrices urna sit lobortis</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic05.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Varius magnis sollicitudin</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic01.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Pulvinar sagittis congue</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic02.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Fermentum sagittis proin</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic03.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Sed quis rhoncus placerat</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic04.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Ultrices urna sit lobortis</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

						<article>
							<a href="#" class="image featured"><img src="/resources/helios/images/pic05.jpg" alt="" /></a>
							<header>
								<h3><a href="#">Varius magnis sollicitudin</a></h3>
							</header>
							<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
						</article>

					</div>
				</section>

			<!-- Main -->
				<div class="wrapper style2">

					<article id="main" class="container special">
						<a href="#" class="image featured"><img src="/resources/helios/images/pic06.jpg" alt="" /></a>
						<header>
							<h2><a href="#">Sed massa imperdiet magnis</a></h2>
							<p>
								Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim
								pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.
							</p>
						</header>
						<p>
							Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa
							posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus
							sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam
							mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan
							lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue
							interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia
							natoque aenean scelerisque.
						</p>
						<footer>
							<a href="#" class="button">Continue Reading</a>
						</footer>
					</article>

				</div>

			<!-- Features -->
				<div class="wrapper style1">

					<section id="features" class="container special">
						<header>
							<h2>Morbi ullamcorper et varius leo lacus</h2>
							<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>
						</header>
						<div class="row">
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="/resources/helios/images/pic07.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Gravida aliquam penatibus</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="/resources/helios/images/pic08.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Sed quis rhoncus placerat</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="/resources/helios/images/pic09.jpg" alt="" /></a>
								<header>
									<h3><a href="#">Magna laoreet et aliquam</a></h3>
								</header>
								<p>
									Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
								</p>
							</article>
						</div>
					</section>

				</div>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">

							<!-- Tweets -->
								<section class="4u 12u(mobile)">
									<header>
										<h2 class="icon fa-twitter circled"><span class="label">Tweets</span></h2>
									</header>
									<ul class="divided">
										<li>
											<article class="tweet">
												Amet nullam fringilla nibh nulla convallis tique ante sociis accumsan.
												<span class="timestamp">5 minutes ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Hendrerit rutrum quisque.
												<span class="timestamp">30 minutes ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Curabitur donec nulla massa laoreet nibh. Lorem praesent montes.
												<span class="timestamp">3 hours ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Lacus natoque cras rhoncus curae dignissim ultricies. Convallis orci aliquet.
												<span class="timestamp">5 hours ago</span>
											</article>
										</li>
									</ul>
								</section>

							<!-- Posts -->
								<section class="4u 12u(mobile)">
									<header>
										<h2 class="icon fa-file circled"><span class="label">Posts</span></h2>
									</header>
									<ul class="divided">
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Nisl fermentum integer</a></h3>
												</header>
												<span class="timestamp">3 hours ago</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Phasellus portitor lorem</a></h3>
												</header>
												<span class="timestamp">6 hours ago</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Magna tempus consequat</a></h3>
												</header>
												<span class="timestamp">Yesterday</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Feugiat lorem ipsum</a></h3>
												</header>
												<span class="timestamp">2 days ago</span>
											</article>
										</li>
									</ul>
								</section>

							<!-- Photos -->
								<section class="4u 12u(mobile)">
									<header>
										<h2 class="icon fa-camera circled"><span class="label">Photos</span></h2>
									</header>
									<div class="row 25%">
										<div class="6u">
											<a href="#" class="image fit"><img src="/resources/helios/images/pic10.jpg" alt="" /></a>
										</div>
										<div class="6u$">
											<a href="#" class="image fit"><img src="/resources/helios/images/pic11.jpg" alt="" /></a>
										</div>
										<div class="6u">
											<a href="#" class="image fit"><img src="/resources/helios/images/pic12.jpg" alt="" /></a>
										</div>
										<div class="6u$">
											<a href="#" class="image fit"><img src="/resources/helios/images/pic13.jpg" alt="" /></a>
										</div>
										<div class="6u">
											<a href="#" class="image fit"><img src="/resources/helios/images/pic14.jpg" alt="" /></a>
										</div>
										<div class="6u$">
											<a href="#" class="image fit"><img src="/resources/helios/images/pic15.jpg" alt="" /></a>
										</div>
									</div>
								</section>

						</div>
						<hr />
						<div class="row">
							<div class="12u">

								<!-- Contact -->
									<section class="contact">
										<header>
											<h3>Nisl turpis nascetur interdum?</h3>
										</header>
										<p>Urna nisl non quis interdum mus ornare ridiculus egestas ridiculus lobortis vivamus tempor aliquet.</p>
										<ul class="icons">
											<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
											<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
											<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
											<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
											<li><a href="#" class="icon fa-linkedin"><span class="label">Linkedin</span></a></li>
										</ul>
									</section>

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
										</ul>
									</div>

							</div>

						</div>
					</div>
				</div>

		</div>
=======

	<head>
		<title>Helios by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script src="/resources/js/tripLocation.js"></script>
		
		<style>
			#header{
			background-image: url(/resources/images/tripIcon/knocker-2163643_1920.jpg);
			background-color: #3a2748;
			}
			
			#nav{
			background-color: #3b2b48;
			opacity: 0.7;
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

			<!-- Banner -->
				<section id="banner">
					<header>
						<h2>Hi. You're looking at <strong>Helios</strong>.</h2>
						<p>
							A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.
							Built on <strong>skel</strong> and released under the <a href="http://html5up.net/license">CCA</a> license.
						</p>
					</header>
				</section>

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
							<a href="/ticket/listTicket" class="image featured"><img src="/resources/images/tripIcon/admission-2974645_1920.jpg" alt="" /></a>
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

			<!-- Main -->
				<div class="wrapper style2">

					<article id="main" class="container special">
						<a href="#" class="image featured"><img src="/resources/helios/images/pic06.jpg" alt="" /></a>
						<header>
							<h2><a href="#">Sed massa imperdiet magnis</a></h2>
							<p>
								Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim
								pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.
							</p>
						</header>
						<p>
							Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa
							posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus
							sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam
							mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan
							lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue
							interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia
							natoque aenean scelerisque.
						</p>
						<footer>
							<a href="#" class="button">Continue Reading</a>
						</footer>
					</article>

				</div>

			
		</div>

		<!-- Scripts -->
			<script src="/resources/helios/assets/js/jquery.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
			<script src="/resources/helios/assets/js/skel.min.js"></script>
			<script src="/resources/helios/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/helios/assets/js/main.js"></script>


	</body>
</html>