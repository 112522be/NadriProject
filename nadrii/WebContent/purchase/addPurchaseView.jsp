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
	$(".btn:contains('�����ϱ�')").bind("click", function(){
		alert("�����ϱ�")
		//fncAddPurchase();
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

		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h3 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						Ƽ������
	  					</h3>
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
	  					<h3 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						����������
	  					</h3>
	  				</strong>
	  			</div>
	  			
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">�� ��</span> 
					<input type="text" class="form-control" placeholder="�̸��� �Է��� �ּ���"
						aria-describedby="sizing-addon1">
				</div>
				
				<br>
				
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">����ó</span> 
					<input type="text" class="form-control" placeholder="����ó�� �Է��� �ּ���"
						aria-describedby="sizing-addon1">
				</div>
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-12 col-md-12">
	  			<div class="alert alert-info" role="alert">
	  				<strong>
	  					<h3 class="text-right">
	  						<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
	  						��������
	  					</h3>
	  				</strong>
	  			</div>
				<h4>[������ Ƽ��]</h4>
	  			<c:forEach items="${ purchase.ticketCount }" varStatus="status">
	  				<h4>&nbsp;�� ${ purchase.ticketPrice[status.index] } : ${ purchase.ticketCount[status.index] } ��</h4>
	  			</c:forEach>
	  			<hr>
	  			<h4 class="text-right">[�� �����ݾ�]</h4>
	  			<h4 class="text-right">�� ${ purchase.totalTicketPrice }</h4>
	
	  		</div>
		</div>

		<div class="modal-footer">
			<button type="button" class="btn btn-info btn-lg" data-dismiss="modal">�����ϱ�</button>
			<button type="button" class="btn btn-default btn-lg" data-dismiss="modal" onclick="goBack()">�� ��</button>
		</div>	
			

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>