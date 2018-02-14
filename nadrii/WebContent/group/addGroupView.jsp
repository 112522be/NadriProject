<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<script type="text/javascript" src=""></script>
	<link rel="stylesheet" href="/resources/css/style.css"/>
	<link rel="stylesheet" href="/resources/skins/default.css"/>
	<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(function() {
		$('a#submit').bind('click', function() {
			$('form[name="postData"]').attr("action", "addGroup").attr("method", "POST").submit();
		})
	})
	</script>
	<style type="text/css">
.row > * {
    padding: 20px 0 0 10px;
}
.navbar {
    margin-bottom: 0px !important;
	}
@media screen and (min-width: 1681px) and (max-width: 1880px) {
		body, input, textarea, select {
				font-size: 15pt !important;
			}
	}	
	
	</style>

</head>
	<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>
	<div id="main">
	<section class="two">
	<div class="container" align="center">
		<form name="postData">
			<div class="row">
				<div class="3u 6u$(xsmall)">
					<div class="select-wrapper">
						<select name="categoryCode" style="font-size: 13pt;">
							<option value="">- Category -</option>
							<option value="1">카테1</option>
							<option value="2">카테2</option>
							<option value="3">카테3</option>
							<option value="4">카테4</option>
						</select>
					</div>
				</div>
				<div class="9u 12u$(xsmall)">
					<input type="text" class="form" style="font-size: 13pt;" name="title" id="title" value="" placeholder="제목" />
				</div>
			 </div>
			 <div style="padding-top: 10px">
			  	<jsp:include page="noteEditor.jsp"></jsp:include>
			 </div>
		</form> 
		<div class="box-bottom" >
			<a id="submit">저장하기</a>
		</div>
	</div>	
	</section>
	</div>
	</body>
	<link rel="stylesheet" href="../resources/assets/css/main.css?version=0206455" />
</html>