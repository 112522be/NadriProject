<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

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

	//=================== "��ٱ��� ���" Event ���� =================== 
	$(function() {
		$("input.btn.btn-success").bind("click", function() {
			alert("��ٱ���")
		//	fncAddPurchase();
		});
	});

	//=================== "���" Event ���� =================== 
	$(function() {
		$("input.btn.btn-default").bind("click", function() {
			alert("���")
		});
	});
	
	//=================== "����" Event ���� =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
			alert("����")
			fncAddPurchase();
		});
	});
	
	//==================== "��������" Event ���� =================== 
	
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
			console.log("[Ƽ�� ������ 0 ���� ����]")
		}
		
	}

	//==================== + / - ��ư ó�� ====================

	$(function() {

		$("button[name='minus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("button[name='minus']").index(this);
			console.log("- �ε��� �� : " + indexVal)

			var countVal = 'minus';
			console.log("- ī��Ʈ �� : " + countVal)

			var currentVal = $(".ticketCount").eq(indexVal).val();
			console.log("- ���� �� : " + currentVal)

			if (currentVal <= 0) {
				alert("Ƽ�� ������ Ȯ�� �Ͻñ� �ٶ��ϴ�.")
			}

			fncTicketCount(indexVal, currentVal, countVal);

			console.log("----------")

		});

		$("a[name='plus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("a[name='plus']").index(this);
			console.log("+ �ε��� �� : " + indexVal)

			var countVal = 'plus';
			console.log("+ ī��Ʈ �� : " + countVal)

			var currentVal = $(".ticketCount").eq(indexVal).val();
			console.log("+ ���� �� : " + currentVal)

			fncTicketCount(indexVal, currentVal, countVal);

			console.log("++++++++++")

		});

	});

	// ===== Form ��ȿ�� ���� =====
	function fncAddPurchase() {
		
		
		var name = $("input[name='name']").val();
		var phone = $("input[name='phone']").val();
//		var ticketCount = $(".ticketCount").eq(index).val();

		console.log('�ε��� Ȯ�� : ' + index)
		console.log('Ƽ�� ���� Ȯ�� : ' + ticketCount)
		
		if (name == null || name.length < 1) {
			alert("�̸��� �ݵ�� �Է��ؾ� �մϴ�.");
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("����ó�� �ݵ�� �Է��ؾ� �մϴ�.");
			return;
		}
/*
		if (ticketCount == null || ticketCount.length < 1) {
			alert("Ƽ�� ������ Ȯ�� �Ͻñ� �ٶ��ϴ�.");
			return;
		}
//*/
		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		$(function() {

			$("input[name='email']").bind( "change", function() {
				var email = $("input[name='email']").val();
				if (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
					alert("�̸��� ������ �ƴմϴ�.");
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

	<div class="page-header">
		<h3 class="text-info text-center">���������Է�</h3>
		<h5 class="text-muted text-center">
			�����Ͻ� Ƽ�Ͽ� ���� ���������� <strong class="text-danger">���Ŀ� �°� </strong>�Է��� �ּ���.
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
					�� <strong>��������</strong><br> 
					&nbsp;- �����Ͻ� �������ڸ� Ȯ���Ͻñ� �ٶ��ϴ�.
				</div>
					<p>${ bookingDate }</p><br>
					
				<!-- #2 -->
				<div class="alert alert-warning" role="alert">
					�� <strong>�̿���</strong><br> 
					&nbsp;- �Ʒ� �̿����� Ȯ���Ͻñ� �ٶ��ϴ�.
				</div>
					<p>${ detailIntro.usetimefestival }</p><br>
					
				<!-- #3 -->
				<div class="alert alert-danger" role="alert">
					�� <strong>����� ���� �ȳ�</strong><br> 
					&nbsp;- ���� ������ �����Ͻñ� �ٶ��ϴ�.
				</div>
				
				<c:forEach items="${ priceList }" varStatus="status">
				
					<input type="hidden" class="ticketCount" name="ticketCount" value=0>
				
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href="#"	value="${ priceList[status.index] }"> 
								<span class="glyphicon glyphicon-barcode" aria-hidden="true"> </span>&nbsp;
										${ priceList[status.index] } �� <span class="badge">0</span> 
							</a>
						</li>
				
						<!-- �������� ��ư -->
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
					�� <strong>�������� �Է�</strong>
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="name">�� ��</span> 
					<input type="text" class="form-control" placeholder="�ʼ��Է�"
						aria-describedby="basic-addon1" name="name" value="���Ŀ� ������ ��ü ����">
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon" id="phone">����ó</span> 
					<input type="text" class="form-control" placeholder="' - ' ���� ��ȣ�� �Է�"
						aria-describedby="basic-addon1" name="phone" value="���Ŀ� ������ ��ü ����">
				</div>
				<br>

				<div class="input-group">
					<span class="input-group-addon" id="email">@</span> 
					<input type="text" class="form-control" placeholder="E-mail"
						aria-describedby="basic-addon1" name="email" value="���Ŀ� ������ ��ü ����">
				</div>

				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<br> 
						<input class="btn btn-success" type="button" value="��ٱ��� ���"> 
					
						<input class="btn btn-default" type="button" value="��&nbsp;��">
						
						<button type="button" class="btn btn-danger">��&nbsp;��</button>
					</div>
				</div>
			</div>







		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
		<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>