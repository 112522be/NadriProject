<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">

<title>���������Է�</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

function fncAddPurchase() {
	$("form").attr("method", "POST").attr('action', '/purchase/kakaoPay').submit();
}

$( function(){
	$(".kakaoPay").bind("click", function(){
//		alert("Kakao")
		fncAddPurchase(); 
//		$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
	});
});

//=================== "���" Event ���� =================== 
function goBack() {
	window.history.back();
}


</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class="text-info">���������Է�</h3>
				<h5 class="text-muted text-left">
					�����Ͻ� Ƽ���� ������ ���� <strong class="text-danger">���Ŀ� �°� </strong>�ۼ��� �ּ���.
				</h5>  
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<!-- KakaoPay API Request -->
		<input type="hidden" name="cid" 				value="TC0ONETIME">
		<input type="hidden" name="partner_order_id" 	value="���帮Ƽ�Ͻý���">
		<input type="hidden" name="partner_user_id" 	value="${ user.userId }">
		<input type="hidden" name="item_name" 			value="${ purchase.ticketTitle }">
		<input type="hidden" name="quantity" 			value="1">
		<input type="hidden" name="total_amount" 		value=${ purchase.totalTicketPrice }>
		<input type="hidden" name="tax_free_amount" 	value="${ purchase.taxFree }">
		<input type="hidden" name="approval_url" 		value="http://127.0.0.1:8080/purchase/kakaoPayComplete">
		<input type="hidden" name="cancel_url" 			value="http://127.0.0.1:8080/index.jsp">
		<input type="hidden" name="fail_url" 			value="http://127.0.0.1:8080/index.jsp">

		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h4 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						Ƽ������
	  					</h4>
	  				</strong>
	  			</div>
	  			
	  		<h4>[Ƽ�ϸ�]</h4>
	  		<h4>&nbsp;<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> ${ purchase.ticketTitle }</h4>
	  		
	  		<h4>[������]</h4>
	  		<h4>&nbsp;<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> ${ purchase.bookingDate }</h4>

	  		</div>
		</div>

		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  		
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h4 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						����������
	  					</h4>
	  				</strong>
	  			</div>
  			</div>
	  			
	  		<div class="col-xs-12 col-md-6">
	  			<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">���̵�</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" value="${ purchase.buyerId }" readonly>
				</div>
	  			<br>
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">�� ��</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" value="${ purchase.buyerName }" readonly>
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">����ó</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" value="${ purchase.buyerPhone }" readonly>
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">E-mail</span> 
					<input type="text" class="form-control" 
						aria-describedby="sizing-addon1" value="${ purchase.buyerEmail }" readonly>
				</div>
				
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h4 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						��������
	  					</h4>
	  				</strong>
	  			</div>
				<h4>[������ Ƽ��]</h4>
	  			<c:forEach items="${ purchase.ticketCount }" varStatus="status">
	  				<h4>&nbsp;�� ${ purchase.ticketPrice[status.index] } : ${ purchase.ticketCount[status.index] } ��</h4>
	  			</c:forEach>
	  			<hr>
	  			<h4 class="text-right">[�� �����ݾ�]</h4>
	  			<h4 class="text-right">Ƽ�Ϻ�� : �� ${ purchase.totalTicketPrice }</h4>
	  			<h4 class="text-right">����� : �� ${ purchase.taxFree }</h4>
	  			<hr>
	  			<h4 class="text-right text-danger">�� ${ purchase.ticketPayment }</h4>
	  			
	
	  		</div>
		</div>

		<div class="modal-footer">
			
			<button type="button" class="kakaoPay" data-dismiss="modal">
				<img src="http://img.yonhapnews.co.kr/etc/inner/EN/2015/09/15/AEN20150915005751320_01_i.jpg" height=30px/>
			</button>
			<button type="button" class="btn btn-default btn-lg" data-dismiss="modal" onclick="goBack()">�� ��</button>
		</div>	
			

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>