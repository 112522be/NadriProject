<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>addPurchaseView.jsp</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   <!-- Calendar Event -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   

<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncAddPurchase() {
	$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
}

$( function(){
	$('button').bind("click", function(){
		fncAddPurchase();
	});
});

$( function(){
	$('div a[href="#"]').bind("click", function(){
		//history.go(-1);
		self.location = "/product/getProduct?prodNo=${ product.prodNo }&menu=search"
	});
});

//=================== "희망배송일자" Event 연결 ===================
$(function() {
	$("#dlvyDate").datepicker({
		dateFormat: "yymmdd",
		minDate: 1,
		changeMonth: true,
		changeYear: true 
	});
});


</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class="text-info">구매상품 상세조회</h3>
		<!-- <h5 class="text-muted text-left">
				판매하실 상품을 <strong class="text-danger">형식에 맞게 </strong>등록해 주세요.
			</h5>  -->
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodNo }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodName }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${ product.manuDate }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${ product.price }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${ product.regDate }</div>
		</div><hr/>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<input type="hidden" name="prodNo" value="${ product.prodNo }" />
			
			<div class="form-group">
				<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="buyerId" name="buyerId" value="${ user.userId }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<select class="form-control" name="paymentOption">
						<option value="1">현금구매</option>
						<option value="2">신용구매</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">받으실분 이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" value="${ user.userName }" placeholder="필수입력">
				</div>
			</div>

			<div class="form-group">
				<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">받으실분 연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ user.phone }" placeholder="필수입력">
				</div>
			</div>

			<div class="form-group">
				<label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">받으실분 주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ user.addr }" placeholder="필수입력">
				</div>
			</div>
			
			<div class="form-group">
				<label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매시 요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" >
				</div>
			</div>
			
			<div class="form-group">
				<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyDate" name="dlvyDate" placeholder="미 기입시 입금 확인 후 바로 출고합니다.">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">구&nbsp;매</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>