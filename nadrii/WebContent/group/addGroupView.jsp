<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="../resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../resources/helios/assets/css/bootstrap.min.css" />	
<link rel="stylesheet" href="../resources/helios/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="../resources/helios/assets/css/ie8.css" /><![endif]-->
		
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../resources/helios/assets/js/jquery.min.js"></script>
<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
<script src="../resources/helios/assets/js/skel.min.js"></script>
<script src="../resources/helios/assets/js/util.js"></script>
<!--[if lte IE 8]><script src="../resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../resources/helios/assets/js/main.js"></script>

				
<script type="text/javascript">
	$(function() {
		$('a#submit').bind(
				'click',
				function() {
					$('form[name="postData"]').attr("action", "addGroup").attr(
							"method", "POST").submit();
				})
	})
</script>
<style type="text/css">
button[data-original-title='More Color']{
	width: 20px !important;
}
.panel-heading{
	text-align: center !important;
}
</style>

</head>
<body class="no-sidebar">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header">
			<!-- Inner -->
			<div class="inner">
				<header>
				<h1>나들이 모임</h1>
				</header>
			</div>
			<jsp:include page="../layout/toolbar.jsp" />
		</div>

		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special">
					<div>
					<span>
						<select name="categoryCode" style="font-size: 13pt; width: 15%; padding: 6px;">
							<option value="">- Category -</option>
							<option value="1">카테1</option>
							<option value="2">카테2</option>
							<option value="3">카테3</option>
							<option value="4">카테4</option>
						</select>
					</span>
					<span>
						<input type="text" class="form" style="font-size: 13pt; width: 83.9%; padding-left: 8px; margin-left: 11px;" name="title" value="" placeholder="제목" />
					</span>
					</div>					
					<div style="padding-top: 10px">
						<jsp:include page="noteEditor.jsp"></jsp:include>
					</div>
									
					<div class="box-bottom" >
						<a id="submit">저장하기</a>
					</div>
				</article>
			</div>
		</div>
	</div>
</body>
</html>