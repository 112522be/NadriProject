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

	//=================== "��ٱ��� ���" Event ���� =================== 
	$(function() {
		$("button:contains('��ٱ��� ���')").bind('click', function() {
			
				$( ".label.label-warning[name='titleB']" ).append('${ tourTicket.title }');
			
				for (var i = 0; i < $(".ticketPrice").length; i++) {	
					ticketPrice = $(".ticketPrice").eq(i).val();
					ticketCount = $(".ticketCount").eq(i).val();
					
					totalTicketCount += ticketCount * 1;
					
					if (ticketCount != 0) {
						var sumPriceTicket = (ticketPrice * 1) *  ticketCount;
						totalTicketPrice = (totalTicketPrice * 1) + (sumPriceTicket * 1);
						$( ".modal-body" ).append("<h2>&nbsp;&nbsp;<code>�� "+ticketPrice+"</code> : <span class='label label-info'>"+ticketCount+"</span>&nbsp;��</h2>");
					}
				}
				$( ".label.label-success" ).append("�� " + totalTicketPrice);
			})
		});
</script>
<script>
	
	//=================== "��ٱ��� ������ �����ϱ�" Event ���� =================== 
	$(function() {
		$("button:contains('�����ϱ�')").bind("click", function() {
			var flag = 'basket';
			fncAddPurchase(flag);
//			alert("�����ϱ� �Ϸ�")
			return;
			
		});
	});

	
	//=================== "���" Event ���� =================== 
	function goBack() {
    	window.history.back();
	}
	
	
	//=================== "����" Event ���� =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
//			alert("����")
			var flag = 'purchase';
			fncAddPurchase(flag);
		});
	});
	
	
	//==================== "��������" Event ���� =================== 
	
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
			console.log("[Ƽ�� ������ 0 ���� ����]")
		}
		
	}

	//==================== + / - ��ư ó�� ====================

	$(function() {

		$("button[name='minus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("button[name='minus']").index(this);
			var countVal = 'minus';
			var currentVal = $(".ticketCount").eq(indexVal).val();

			/*
			console.log("- �ε��� �� : " + indexVal)
			console.log("- ī��Ʈ �� : " + countVal)
			console.log("- ���� �� : " + currentVal)
			//*/
			
			if (currentVal <= 0) {
				alert("Ƽ�� ������ Ȯ�� �Ͻñ� �ٶ��ϴ�.")
			}

			fncTicketCount(indexVal, currentVal, countVal);

		});

		$("a[name='plus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("a[name='plus']").index(this);
			var countVal = 'plus';
			var currentVal = $(".ticketCount").eq(indexVal).val();

			/*
			console.log("+ �ε��� �� : " + indexVal)
			console.log("+ ī��Ʈ �� : " + countVal)
			console.log("+ ���� �� : " + currentVal)
			//*/

			fncTicketCount(indexVal, currentVal, countVal);
		});

	});

	
	// ===== Form ��ȿ�� ���� �� Navigation =====
	function fncAddPurchase(flag) {
/*		
		var name = $("input[name='name']").val();
		var phone = $("input[name='phone']").val();
		
		for (var i = 0; i < $(".ticketPrice").length; i++) {		
			ticketPrice = $(".ticketPrice").eq(i).val();
			ticketCount = $(".ticketCount").eq(i).val();
			console.log('2. Ƽ�� ���ż��� Ȯ�� : ' + ticketPrice + " = " + ticketCount)
			totalTicketCount += ticketCount * 1;
		}
		
		console.log("Ƽ�� ���� ���� �ߴ�? " + totalTicketPrice)
		
		if (totalTicketCount == 0 || totalTicketCount == "") {
			alert("Ƽ�� ������ Ȯ���Ͻñ� �ٶ��ϴ�.")
			return;
		}
		if (name == null || name.length < 1) {
			alert("�̸��� �ݵ�� �Է��ؾ� �մϴ�.");
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("����ó�� �ݵ�� �Է��ؾ� �մϴ�.");
			return;
		}
		//==>"�̸���" ��ȿ�� Check Event ó�� �� ����
		$(function() {
			$("input[name='email']").bind( "change", function() {
				var email = $("input[name='email']").val();
				if (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
					alert("�̸��� ������ �ƴմϴ�.");
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
				"cancelDate" : "tempCancelDate" ,
				"ticketPriceAll" : ticketPriceAll ,
				"contentId" : '${ tourTicket.contentid }' ,
				"contentTypeId" : '${ tourTicket.contenttypeid }' ,
				"flag" : flag
			}
			
			var jsonData = JSON.stringify(basketData);
			
			$.ajax (
					{
						url : "/purchase/json/addPurchase/" + flag,
						method : "POST",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						
						
					//	ContentType : "application/json" ,
						data:jsonData,
						success : function() {
							alert("�����ϱ� �Ϸ�")
						}
					});		
		} else {
			
//			alert("flag �� Ȯ�� : " + flag)
			
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

		<input type="hidden" name="contentid" value="${ tourTicket.contentid }">
		<input type="hidden" name="contenttypeid" value="${ tourTicket.contenttypeid }">

		<input type="hidden" name="title" value="${ tourTicket.title }">
		<input type="hidden" name="eventstartdate" value="${ tourTicket.eventstartdate }">
		<input type="hidden" name="eventenddate" value="${ tourTicket.eventenddate }">
		<input type="hidden" name="bookingDate" value="${ bookingDate }">
		<input type="hidden" name="eventplace" value="${ tourTicket.eventplace }">
		<input type="hidden" name="originimgurl" value="${ detailImage.originimgurl }">

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
					<input type="hidden" class="ticketPrice" name="ticketPrice" value="${ priceList[status.index] }">
				
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href="#"	value="${ priceList[status.index] }"> 
								<span class="glyphicon glyphicon-barcode" aria-hidden="true"> </span>&nbsp;
										${ priceList[status.index] } �� <span class="badge">0</span> 
							</a>
						</li>
						&nbsp;&nbsp;
						<!-- �������� ��ư -->
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
						aria-describedby="basic-addon1" name="name" value="">
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon" id="phone">����ó</span> 
					<input type="text" class="form-control" placeholder="' - ' ���� ��ȣ�� �Է�"
						aria-describedby="basic-addon1" name="phone" value="">
				</div>
				<br>

				<div class="input-group">
					<span class="input-group-addon" id="email">@</span> 
					<input type="text" class="form-control" placeholder="E-mail"
						aria-describedby="basic-addon1" name="email" value="">
				</div>

				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<br>
						
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">  
  							��ٱ��� ���
						</button>
						 
						<input class="btn btn-default" type="button" value="��&nbsp;��" onclick="goBack()">
						
						<button type="button" class="btn btn-danger">�����ϱ�</button>
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
						��ٱ��Ͽ� ���� �Ͻðڽ��ϱ�?
					</h4>
				</div>
			
				<div class="modal-body">
					<h1 class="text-center"><span class="label label-warning" name='titleB'></span></h1><br>
					<h2>�� ������ �������� : <span class="label label-info">${ bookingDate }</span></h2>
					<h2>�� �� ������� : <span class="label label-success"></span>&nbsp;��</h2>
				
				</div>
			
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">�����ϱ�</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">�� ��</button>
				</div>
			</div>
		</div>
	</div>



		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
		<!--  ȭ�鱸�� div end /////////////////////////////////////-->

	

</body>

</html>