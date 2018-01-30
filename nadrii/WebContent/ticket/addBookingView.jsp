<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>예매정보입력</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- 상품제조일자 Calendar Event -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- //////////////////// CSS //////////////////// -->

	<style>
		body {
            padding-top : 50px;
        }
	</style>

<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

	//=================== "등록" Event 연결 =================== 
	$(function() {
		$("button.btn.btn-primary").bind("click", function() {
			fncAddProduct();
		});
	});

	//=================== "취소" Event 연결 =================== 
	$(function() {
		$("a[href='#' ]").bind("click", function() {
			$("form")[0].reset();
		});
	});
	
	//=================== "상품제조일자" Event 연결 ===================
	$(function() {
		$("#manuDate").datepicker({
			dateFormat: "yymmdd",
			changeMonth: true,
			changeYear: true 
		});
	});

	function fncAddProduct() {
		//Form 유효성 검증

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/product/addProduct")
			.attr("enctype", "multipart/form-data").submit();

	}
</script>
	
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

	<div class="page-header">
		<h3 class="text-info">예매정보입력</h3>
		<h5 class="text-muted text-left">
			구매하실 티켓에 대한 개인정보를 <strong class="text-danger">형식에 맞게 </strong>입력해 주세요.
		</h5>
	</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" placeholder="필수입력">
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="필수입력">
				</div>
			</div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">상품제조일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="필수입력">
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" placeholder="필수입력">
				</div>
			</div>

			<div class="form-group">
				<label for="fileNames"
					class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fileNames" name="fileNames">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">등&nbsp;록</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>