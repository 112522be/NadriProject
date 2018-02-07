<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

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
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 

<!-- //////////////////// CSS //////////////////// -->

	<style>
		body {
            padding-top : 50px;
        }
        
        
	</style>

<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

	var totalTicketCount = "";
	var ticketPrice = "";
	var ticketCount = "";
	var totalTicketPrice = "";

	//=================== "장바구니 담기" Event 연결 =================== 
	$(function() {
		$("button:contains('장바구니 담기')").bind('click', function() {
			
				$( ".label.label-warning[name='titleB']" ).append('${ tourTicket.title }');
			
				for (var i = 0; i < $(".ticketPrice").length; i++) {	
					ticketPrice = $(".ticketPrice").eq(i).val();
					ticketCount = $(".ticketCount").eq(i).val();
					
					totalTicketCount += ticketCount * 1;
					
					if (ticketCount != 0) {
						var sumPriceTicket = (ticketPrice * 1) *  ticketCount;
						totalTicketPrice = (totalTicketPrice * 1) + (sumPriceTicket * 1);
						$( ".modal-body" ).append("<h2>&nbsp;&nbsp;<code>￦ "+ticketPrice+"</code> : <span class='label label-info'>"+ticketCount+"</span>&nbsp;장</h2>");
					}
				}
				$( ".label.label-success" ).append("￦ " + totalTicketPrice);
			})
		});
</script>
<script>
	
	//=================== "장바구니 내에서 저장하기" Event 연결 =================== 
	$(function() {
		$("button:contains('저장하기')").bind("click", function() {
			var flag = 'basket';
			fncAddPurchase(flag);
//			alert("저장하기 완료")
			return;
			
		});
	});

	
	//=================== "취소" Event 연결 =================== 
	function goBack() {
    	window.history.back();
	}
	
	
	//=================== "결제" Event 연결 =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
//			alert("결제")
			var flag = 'purchase';
			fncAddPurchase(flag);
		});
	});
	
	
	//==================== "수량증감" Event 연결 =================== 
	
	function fncTicketCount(indexVal, currentVal, countVal) {

//		console.log("[fncTicketCount START]")

		var inputVal = $(".ticketCount").eq(indexVal).val();
		var textVal = $(".badge").eq(indexVal).text();
/*
		console.log("[1] inputVal : " + inputVal)
		console.log("[2] textVal : " + textVal)
//*/
		if (countVal == 'plus') {
//			console.log("[Plus]")
			inputVal = $(".ticketCount").eq(indexVal).val(currentVal * 1 + 1);
			textVal = $(".badge").eq(indexVal).text(currentVal * 1 + 1);
		}

		if (countVal == 'minus' && currentVal >= 1) {
//			console.log("[Minus]")
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
			var countVal = 'minus';
			var currentVal = $(".ticketCount").eq(indexVal).val();

			/*
			console.log("- 인덱스 값 : " + indexVal)
			console.log("- 카운트 값 : " + countVal)
			console.log("- 현재 값 : " + currentVal)
			//*/
			
			if (currentVal <= 0) {
				alert("티켓 수량을 확인 하시기 바랍니다.")
			}

			fncTicketCount(indexVal, currentVal, countVal);

		});

		$("a[name='plus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("a[name='plus']").index(this);
			var countVal = 'plus';
			var currentVal = $(".ticketCount").eq(indexVal).val();

			/*
			console.log("+ 인덱스 값 : " + indexVal)
			console.log("+ 카운트 값 : " + countVal)
			console.log("+ 현재 값 : " + currentVal)
			//*/

			fncTicketCount(indexVal, currentVal, countVal);
		});

	});

	
	// ===== Form 유효성 검증 후 Navigation =====
	function fncAddPurchase(flag) {
/*		
		var name = $("input[name='name']").val();
		var phone = $("input[name='phone']").val();
		
		for (var i = 0; i < $(".ticketPrice").length; i++) {		
			ticketPrice = $(".ticketPrice").eq(i).val();
			ticketCount = $(".ticketCount").eq(i).val();
			console.log('2. 티켓 구매수량 확인 : ' + ticketPrice + " = " + ticketCount)
			totalTicketCount += ticketCount * 1;
		}
		
		console.log("티켓 몇장 구매 했니? " + totalTicketPrice)
		
		if (totalTicketCount == 0 || totalTicketCount == "") {
			alert("티켓 수량을 확인하시기 바랍니다.")
			return;
		}
		if (name == null || name.length < 1) {
			alert("이름은 반드시 입력해야 합니다.");
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("연락처는 반드시 입력해야 합니다.");
			return;
		}
		//==>"이메일" 유효성 Check Event 처리 및 연결
		$(function() {
			$("input[name='email']").bind( "change", function() {
				var email = $("input[name='email']").val();
				if (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
					alert("이메일 형식이 아닙니다.");
				}
			});
		});
//*/		
		if (flag == 'basket') {

			var ticketPriceAll = "";
			for (var i = 0; i < $(".ticketPrice").length; i++) {	
				ticketPrice = $(".ticketPrice").eq(i).val();
				ticketCount = $(".ticketCount").eq(i).val();
				
				if (ticketCount != 0) {
					ticketPriceAll += ticketPrice + "=" + ticketCount + "&";
				}
			}
			
			var basketData = {
					"ticketTitle" : '${ tourTicket.title }' ,
					"ticketImage" : '${ detailImage.originimgurl }' , 
					"bookingDate" : '${ bookingDate }' ,
					"ticketPriceAll" : ticketPriceAll ,
					"contentId" : '${ tourTicket.contentid }' ,
					"contentTypeId" : '${ tourTicket.contenttypeid }' ,
					"flag" : flag,
					"buyerId" : $("input[name='buyerId']").val() ,
					"buyerName" : $("input[name='buyerName']").val() ,
					"buyerPhone" : $("input[name='buyerPhone']").val() ,
					"buyerEmail" : $("input[name='buyerEmail']").val() ,
				}
			
			var jsonData = JSON.stringify(basketData);
			
			
			$.ajax (
					{
						url : "/purchase/json/addBasket",
						method : "POST",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data:jsonData,
						success : function() {
							alert("들어온거 확인");
						}
					});		
					alert("저장하기 완료");
		} else {
			
//			alert("flag 값 확인 : " + flag)
			
			$("form")
			.attr("method", "POST")
			.attr("action", "/purchase/addPurchase/" + flag)
			.submit();
		}
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

		<input type="hidden" name="contentId" value="${ tourTicket.contentid }">
		<input type="hidden" name="contentTypeId" value="${ tourTicket.contenttypeid }">

		<input type="hidden" name="ticketTitle" value="${ tourTicket.title }">
		<input type="hidden" name="eventstartdate" value="${ tourTicket.eventstartdate }">
		<input type="hidden" name="eventenddate" value="${ tourTicket.eventenddate }">
		<input type="hidden" name="bookingDate" value="${ bookingDate }">
		<input type="hidden" name="eventplace" value="${ tourTicket.eventplace }">
		<input type="hidden" name="ticketImage" value="${ detailImage.originimgurl }">

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
					<input type="hidden" class="ticketPrice" name="ticketPrice" value="${ priceList[status.index] }">
				
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href="#"	value="${ priceList[status.index] }"> 
								<span class="glyphicon glyphicon-barcode" aria-hidden="true"> </span>&nbsp;
										${ priceList[status.index] } ￦ <span class="badge">0</span> 
							</a>
						</li>
						&nbsp;&nbsp;
						<!-- 수량증감 버튼 -->
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
			<br>
			<br>
				<img src="${ detailImage.originimgurl }" alt="There is no image"
					class="img-responsive img-rounded"> <br>

				<div class="alert alert-info" role="alert">
					● <strong>개인정보 입력</strong>
				</div>

				<div class="input-group">
					<span class="input-group-addon">아이디</span> 
					<input type="text" class="form-control" placeholder="필수입력"
						aria-describedby="basic-addon1" name="buyerId" value="${ user.userId }" readonly>
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon">이 름</span> 
					<input type="text" class="form-control" placeholder="필수입력"
						aria-describedby="basic-addon1" name="buyerName" value="${ user.userName }" readonly>
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon">연락처</span> 
					<input type="text" class="form-control" placeholder="' - ' 없이 번호만 입력"
						aria-describedby="basic-addon1" name="buyerPhone" value="${ user.phone }" readonly>
				</div>
				<br>

				<div class="input-group">
					<span class="input-group-addon">@</span> 
					<input type="text" class="form-control" placeholder="E-mail"
						aria-describedby="basic-addon1" name="buyerEmail" value="${ user.email }" readonly>
				</div>

				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<br>
						
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">  
  							장바구니 담기
						</button>
						 
						<input class="btn btn-default" type="button" value="취&nbsp;소" onclick="goBack()">
						
						<button type="button" class="btn btn-danger">결제하기</button>
					</div>
				</div>
			</div>

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-copy" aria-hidden="true"> </span>
						장바구니에 저장 하시겠습니까?
					</h4>
				</div>
			
				<div class="modal-body">
					<h1 class="text-center"><span class="label label-warning" name='titleB'></span></h1><br>
					<h2>● 선택한 예매일자 : <span class="label label-info">${ bookingDate }</span></h2>
					<h2>● 총 결제요금 : <span class="label label-success"></span>&nbsp;원</h2>
				
				</div>
			
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">저장하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취 소</button>
				</div>
			</div>
		</div>
	</div>



		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
		<!--  화면구성 div end /////////////////////////////////////-->

	

</body>

</html>