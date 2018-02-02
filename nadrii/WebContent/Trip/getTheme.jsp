<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	$( function() {
		$("button[type='button' ]:contains('�ڹ���')").on("click" , function() {
			self.location = "../trip/listMuseum?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button'  ]:contains('���ð�')").on("click" , function() {
			self.location = "../trip/listExhibit?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button' ]:contains('�̼���')").on("click" , function() {
			self.location = "../trip/listGallery?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button'  ]:contains('ü���')").on("click" , function() {
			self.location = "../trip/listExperience?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button'  ]:contains('�μӸ���')").on("click" , function() {
			self.location = "../trip/listTradition?pageNo=1&area=local"
		});
	});
	

</script>

</head>
<body>
<jsp:include page="../layout/toolbar.jsp"/>
<div class="container">
	
	
	<!-- Contextual button for informational alert messages -->
	<button type="button" class="btn btn-info">�ڹ���</button>
	<!-- 
	<button type="button" class="btn btn-info"><a href="#">�ڹ���</a></button>
	 -->
	<!-- Indicates a successful or positive action -->
	<button type="button" class="btn btn-success">���ð�</button>
	
	<!-- Indicates caution should be taken with this action -->
	<button type="button" class="btn btn-warning">�̼���</button>
	
	<!-- Indicates a dangerous or potentially negative action -->
	<button type="button" class="btn btn-danger">ü���</button>
	
	<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
	<button type="button" class="btn btn-default">�μӸ���</button>

</div>
</body>

</html>