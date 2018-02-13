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
		$(function(){
			$("input[name='submit']").on("click",function(){
				alert("뭐야이게");
				$("form").attr("method","POST").attr("action","/user/findIdPg").submit();
			});
			
			$("input[name='password']").on("click",function(){
				alert("비밀번호");
				$("form").attr("method","POST").attr("action","/user/findPasswordPg").submit();
			});
		});
			
	</script>		
	
</head>

<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<form>
			이메일 : <input type="text" id="email" name="email" value=""/>
			아이디 : <input type="text" id="userId" name="userId" value=""/>			
		</form>
		
		<input type="button" name="submit" value ="확인"/>
		<input type="button" name="password" value ="비밀번호"/>
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>