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

	//=================== "장바구니 담기" Event 연결 =================== 
	$(function() {
		$("input.btn.btn-success").bind("click", function() {
			alert("장바구니")
		//	fncAddPurchase();
		});
	});

	//=================== "취소" Event 연결 =================== 
	$(function() {
		$("a[href='#' ].btn.btn-default").bind("click", function() {
			alert("취소")
		});
	});
	
	//=================== "결제" Event 연결 =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
			alert("결제")
		//	$("form")[0].reset();
		});
	});
	
	function fncAddPurchase() {
		//Form 유효성 검증

		var name = $("input[name='name']").val();
		var birthDate = $("input[name='birthDate']").val();
		var phone = $("input[name='phone']").val();
		var email = $("input[name='email']").val();

		if (name == null || name.length < 1 ) {
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

		$("form")
		.attr("method", "POST")
		.attr("action", "/purchase/addPurchase")
		.submit();

	}
	
	//==>"이메일" 유효성Check  Event 처리 및 연결
	 $(function() {
		 
		 $("#email").bind("change" , function() {
			
			 var email = $("#email").val();
		    
			 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		    	alert("이메일 형식이 아닙니다.");
		     }
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
		<h3 class="text-info">예매정보입력</h3>
		<h5 class="text-muted text-left">
			구매하실 티켓에 대한 개인정보를 <strong class="text-danger">형식에 맞게 </strong>입력해 주세요.
		</h5>
	</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="col-sm-6">
				<img src="${ detailImage.originimgurl }" 
					alt="There is no image" class="img-responsive img-rounded">
			</div>

			<div class="col-sm-6">
				<div class="form-group text-right">
					<h1>
						<span class="label label-warning text-center"> ${ tourTicket.title }</span>
					</h1>
					<br>
				</div>
			</div>


			<div class="col-sm-6">

				<div class="input-group">
					<span class="input-group-addon" id="name">이 름</span> 
					<input type="text" class="form-control" placeholder="필수입력" aria-describedby="basic-addon1">
				</div><br>

				<div class="input-group">
					<span class="input-group-addon" id="phone">연락처</span> 
					<input type="text" class="form-control" placeholder="' - ' 없이 번호만 입력" aria-describedby="basic-addon1">
				</div><br>

				<div class="input-group">
					<span class="input-group-addon" id="email">@</span> 
					<input type="text" class="form-control" placeholder="E-mail" aria-describedby="basic-addon1">
				</div>

			</div>
			



			
				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<br>
						<input class="btn btn-success" type="button" value="장바구니 담기">
						<a class="btn btn-default" href="#" role="button">취&nbsp;소</a>
						<button type="button" class="btn btn-danger">결&nbsp;제</button>
					</div>
				</div>


		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>