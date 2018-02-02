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
		$("button[type='button' ]:contains('박물관')").on("click" , function() {
			self.location = "../trip/listMuseum?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button'  ]:contains('전시관')").on("click" , function() {
			self.location = "../trip/listExhibit?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button' ]:contains('미술관')").on("click" , function() {
			self.location = "../trip/listGallery?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button'  ]:contains('체험관')").on("click" , function() {
			self.location = "../trip/listExperience?pageNo=1&area=local"
		});
	});
	
	$( function() {
		$("button[type='button'  ]:contains('민속마을')").on("click" , function() {
			self.location = "../trip/listTradition?pageNo=1&area=local"
		});
	});
	

</script>

</head>
<body>
<jsp:include page="../layout/toolbar.jsp"/>
<div class="container">
	
	
	<!-- Contextual button for informational alert messages -->
	<button type="button" class="btn btn-info">박물관</button>
	<!-- 
	<button type="button" class="btn btn-info"><a href="#">박물관</a></button>
	 -->
	<!-- Indicates a successful or positive action -->
	<button type="button" class="btn btn-success">전시관</button>
	
	<!-- Indicates caution should be taken with this action -->
	<button type="button" class="btn btn-warning">미술관</button>
	
	<!-- Indicates a dangerous or potentially negative action -->
	<button type="button" class="btn btn-danger">체험관</button>
	
	<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
	<button type="button" class="btn btn-default">민속마을</button>

</div>
</body>

</html>