<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	<!-- ///////////////////////// jQuery Spinner ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>  -->
	 
	<!--  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 -->

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
		$("input.btn.btn-default").bind("click", function() {
			alert("취소")
		});
	});
	
	//=================== "결제" Event 연결 =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
			alert("결제")
			fncAddPurchase();
		});
	});
	
	//==================== "수량증감" Event 연결 =================== 
	
	function fncTicketCount(indexVal, currentVal, countVal) {

		console.log("[fncTicketCount START]")

		var inputVal = $(".ticketCount").eq(indexVal).val();
		console.log("[1] inputVal : " + inputVal)

		var textVal = $(".badge").eq(indexVal).text();
		console.log("[2] textVal : " + textVal)

		if (countVal == 'plus') {
			console.log("[Plus]")
			inputVal = $(".ticketCount").eq(indexVal).val(currentVal * 1 + 1);
			textVal = $(".badge").eq(indexVal).text(currentVal * 1 + 1);
		}

		if (countVal == 'minus' && currentVal >= 1) {
			console.log("[Minus]")
			inputVal = $(".ticketCount").eq(indexVal).val(currentVal * 1 - 1);
			textVal = $(".badge").eq(indexVal).text(currentVal * 1 - 1);
		} else if (countVal == 'minus' && currentVal <= 0) {
			console.log("[티켓 수량이 0 보다 작음]")
		}
		
	}

	//==================== + / - 버튼 처리 ====================

	$(function() {

		$("button[name='minus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("button[name='minus']").index(this);
			console.log("- 인덱스 값 : " + indexVal)

			var countVal = 'minus';
			console.log("- 카운트 값 : " + countVal)

			var currentVal = $(".ticketCount").eq(indexVal).val();
			console.log("- 현재 값 : " + currentVal)

			if (currentVal <= 0) {
				alert("티켓 수량을 확인 하시기 바랍니다.")
			}

			fncTicketCount(indexVal, currentVal, countVal);

			console.log("----------")

		});

		$("a[name='plus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("a[name='plus']").index(this);
			console.log("+ 인덱스 값 : " + indexVal)

			var countVal = 'plus';
			console.log("+ 카운트 값 : " + countVal)

			var currentVal = $(".ticketCount").eq(indexVal).val();
			console.log("+ 현재 값 : " + currentVal)

			fncTicketCount(indexVal, currentVal, countVal);

			console.log("++++++++++")

		});

	});

	// ===== Form 유효성 검증 =====
	function fncAddPurchase() {
		
		
		var name = $("input[name='name']").val();
		var phone = $("input[name='phone']").val();
//		var ticketCount = $(".ticketCount").eq(index).val();

		console.log('인덱스 확인 : ' + index)
		console.log('티켓 수량 확인 : ' + ticketCount)
		
		if (name == null || name.length < 1) {
			alert("이름은 반드시 입력해야 합니다.");
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("연락처는 반드시 입력해야 합니다.");
			return;
		}
/*
		if (ticketCount == null || ticketCount.length < 1) {
			alert("티켓 수량을 확인 하시기 바랍니다.");
			return;
		}
//*/
		//==>"이메일" 유효성Check  Event 처리 및 연결
		$(function() {

			$("input[name='email']").bind( "change", function() {
				var email = $("input[name='email']").val();
				if (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
					alert("이메일 형식이 아닙니다.");
				}
			});
		});
	
		/*
		$("form")
		.attr("method", "POST")
		.attr("action", "/purchase/addPurchase")
		.submit();
		//*/
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
		<h3 class="text-info text-center">예매정보입력</h3>
		<h5 class="text-muted text-center">
			구매하실 티켓에 대한 개인정보를 <strong class="text-danger">형식에 맞게 </strong>입력해 주세요.
		</h5>
	</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="col-sm-6">
				<div class="form-group text-center">
					<h1>
						<span class="label label-warning text-center"> ${ tourTicket.title }</span>
					</h1>
				</div>
				<hr />
				
				<!-- #1 -->
				<div class="alert alert-success" role="alert">
					● <strong>예매일자</strong><br> 
					&nbsp;- 선택하신 예매일자를 확인하시기 바랍니다.
				</div>
					<p>${ bookingDate }</p><br>
					
				<!-- #2 -->
				<div class="alert alert-warning" role="alert">
					● <strong>이용요금</strong><br> 
					&nbsp;- 아래 이용요금을 확인하시기 바랍니다.
				</div>
					<p>${ detailIntro.usetimefestival }</p><br>
					
				<!-- #3 -->
				<div class="alert alert-danger" role="alert">
					● <strong>입장권 구매 안내</strong><br> 
					&nbsp;- 구매 수량을 선택하시기 바랍니다.
				</div>
				
				<c:forEach items="${ priceList }" varStatus="status">
				
					<input type="hidden" class="ticketCount" name="ticketCount" value=0>
				
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href="#"	value="${ priceList[status.index] }"> 
								<span class="glyphicon glyphicon-barcode" aria-hidden="true"> </span>&nbsp;
										${ priceList[status.index] } ￦ <span class="badge">0</span> 
							</a>
						</li>
				
						<!-- 수량증감 버튼 -->
						&nbsp;&nbsp;
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" name="minus" value="minus">
								<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
							</button>

							<a class="btn btn-default" href="#" role="button" name="plus" value="plus">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				  			</a>
						</div>
					</ul>
					
					<br>
				</c:forEach>

			</div>

			<div class="col-sm-6">
				<img src="${ detailImage.originimgurl }" alt="There is no image"
					class="img-responsive img-rounded"> <br>

				<div class="alert alert-info" role="alert">
					● <strong>개인정보 입력</strong>
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="name">이 름</span> 
					<input type="text" class="form-control" placeholder="필수입력"
						aria-describedby="basic-addon1" name="name" value="추후에 도메인 객체 설정">
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon" id="phone">연락처</span> 
					<input type="text" class="form-control" placeholder="' - ' 없이 번호만 입력"
						aria-describedby="basic-addon1" name="phone" value="추후에 도메인 객체 설정">
				</div>
				<br>

				<div class="input-group">
					<span class="input-group-addon" id="email">@</span> 
					<input type="text" class="form-control" placeholder="E-mail"
						aria-describedby="basic-addon1" name="email" value="추후에 도메인 객체 설정">
				</div>

				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<br> 
						<input class="btn btn-success" type="button" value="장바구니 담기"> 
					
						<input class="btn btn-default" type="button" value="취&nbsp;소">
						
						<button type="button" class="btn btn-danger">결&nbsp;제</button>
					</div>
				</div>
			</div>







		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
		<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>