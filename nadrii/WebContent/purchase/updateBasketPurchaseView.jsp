<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">

<title>결제정보입력</title>

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
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncUpdateBasketPurchase() {
	$("form").attr("method", "POST").attr('action', '/purchase/kakaoPay').submit();
}

$( function(){
	$(".kakaoPay").bind("click", function(){
//		alert("Kakao")
		fncUpdateBasketPurchase(); 
//		$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
	});
});

//=================== "취소" Event 연결 =================== 
function goBack() {
	window.history.back();
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
			<h3 class="text-info">결제정보입력</h3>
				<h5 class="text-muted text-left">
					선택하신 티켓의 결제를 위해 <strong class="text-danger">형식에 맞게 </strong>작성해 주세요.
				</h5>  
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<input type="hidden" name="sumPostNo" value="${ purchase.sumPostNo }">
		
		<!-- Purchase Info 
		<input type="hidden" name="contentId" 			value="${ purchase.contentId }">
		<input type="hidden" name="contentTypeId" 		value="${ purchase.contentTypeId }">
		<input type="hidden" name="ticketTitle"			value="${ purchase.ticketTitle }">
		<input type="hidden" name="ticketImage" 		value="${ purchase.ticketImage }">
		<input type="hidden" name="bookingDate" 		value="${ purchase.bookingDate }">
		<input type="hidden" name="flag" 				value="${ purchase.flag }">
		<input type="hidden" name="totalTicketPrice" 	value="${ purchase.totalTicketPrice }">
		<input type="hidden" name="taxFree"				value="${ purchase.taxFree }">
		<input type="hidden" name="ticketPayment" 		value="${ purchase.ticketPayment }">
		<c:forEach items="${ purchase.ticketPrice }" varStatus="status">
			<input type="hidden" name="ticketCount" value="${ purchase.ticketCount[status.index] }">
			<input type="hidden" name="ticketPrice" value="${ purchase.ticketPrice[status.index] }">
		</c:forEach>
		-->
		
		<!-- KakaoPay API Request -->
		<input type="hidden" name="cid" 				value="TC0ONETIME">
		<input type="hidden" name="partner_order_id" 	value="㈜나들이">
		<input type="hidden" name="partner_user_id" 	value="${ list[0].buyer.userId }">
		<input type="hidden" name="item_name" 			value="${ purchase.ticketTitle }">
		<input type="hidden" name="quantity" 			value="1">
		<input type="hidden" name="total_amount" 		value=${ purchase.totalTicketPrice }>
		<input type="hidden" name="tax_free_amount" 	value="${ purchase.taxFree }">
		<input type="hidden" name="approval_url" 		value="http://127.0.0.1:8080/purchase/kakaoPayCompleteB">
		<input type="hidden" name="cancel_url" 			value="http://127.0.0.1:8080/index.jsp">
		<input type="hidden" name="fail_url" 			value="http://127.0.0.1:8080/index.jsp">

		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h4 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						티켓정보
	  					</h4>
	  				</strong>
	  			</div>
  			</div>
		</div>

		<div class="row">
  			<c:forEach var="list" items="${list}" varStatus="num">
		  		<div class="col-xs-4 col-md-4">
	  				<h4 class="text-left">[${ num.count }] ${ list.postNo }</h4>
	  				<h4>[티켓명]</h4>
	  				<h4>&nbsp;<span class="glyphicon glyphicon-ok" aria-hidden="true" ></span> ${ list.ticketTitle }</h4>
	  		
	  				<h4>[예매일]</h4>
	  				<h4>&nbsp;<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> ${ list.bookingDate }</h4>
		  		</div>
			</c:forEach>
		</div>

		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  		
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h4 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						구매자정보
	  					</h4>
	  				</strong>
	  			</div>
  			</div>
	  			
	  		<div class="col-xs-12 col-md-6">
	  			<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">아이디</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" name="buyerId" value="${ list[0].buyer.userId }" readonly>
				</div>
	  			<br>
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">이 름</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" name="buyerName" value="${ list[0].buyer.userName }" readonly>
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">연락처</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" name="buyerPhone" value="${ list[0].buyer.phone }" readonly>
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">E-mail</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" name="buyerEmail" value="${ list[0].buyer.email }" readonly>
				</div>
				
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h4 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						결제정보
	  					</h4>
	  				</strong>
	  			</div>
				<h4>[선택한 티켓]</h4>
	  				<c:forEach var="list" items="${list}" varStatus="num">
	  					<h4>&nbsp;<span class="glyphicon glyphicon-ok" aria-hidden="true" ></span> ${ list.ticketTitle }</h4>
		  				<c:forEach var="ticket" items="${list.ticketP}" varStatus="num">
	  						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;￦ ${ ticket } : ${ list.ticketC[num.index] } 장</h5>
	  					</c:forEach>
	  					<h4 class="text-warning">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-arrow-right" aria-hidden="true" ></span> 
	  					해당티켓 총 결제금액 : ￦ ${ list.totalTicketPrice }</h4>
	  				</c:forEach>
	  			<hr>
	  			<h4 class="text-right">[총 결제금액]</h4>
	  			<h4 class="text-right">티켓비용 : ￦ ${ purchase.totalTicketPrice }</h4>
	  			<h4 class="text-right">결제대행비 : ￦ ${ purchase.taxFree }</h4>
	  			<hr>
	  			<h4 class="text-right text-danger">￦ ${ purchase.ticketPayment }</h4>
	  			
	
	  		</div>
		</div>

		<div class="modal-footer">
			
			<button type="button" class="kakaoPay" data-dismiss="modal">
				<img src="/resources/images/ticket/kakaoPay_image1.jpg" height=30px/>
			</button>
			<button type="button" class="btn btn-default btn-lg" data-dismiss="modal" onclick="goBack()">취 소</button>
		</div>	
			

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>