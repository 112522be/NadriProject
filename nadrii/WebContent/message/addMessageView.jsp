<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
	<body>
		<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-2">
						

						<div id="sendmessage"></div>
						<div id="errormessage"></div>
						<form action="" method="post" role="form" class="contactForm">
							<div class="alert alert-info" role="alert" style="padding-top: 5px;padding-bottom: 5px;">
							    <strong>보내는 사람 : </strong>
							    	${message.senderId}
							    	
							<!-- 
								<button class="btn btn-primary" type="button">
  									<span class="badge">보내는 사람 : </span>
								</button>
							 -->	
    						</div>
							
							<div class="form-group">
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<div class="alert alert-warning" role="alert" style="padding-top: 5px;padding-bottom: 5px;">
							    <strong>받는 사람 : </strong>
							    	${message.receiverId}
							<!-- 
								<button class="btn btn-primary" type="button">
  									<span class="badge">보내는 사람 : </span>
								</button>
							 -->	
    						</div>
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="title" id="subject" placeholder="제목" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<textarea class="form-control" name="text" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="메시지를 작성하세요"></textarea>
								<div class="validation"></div>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-theme">보내기</button>
								<button type="cancel" class="btn btn-theme">취소</button>
							</div>							
						</form>
					</div>
				</div>
			</div>
	</body>
</html>