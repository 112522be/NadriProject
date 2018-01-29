<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

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

	<!-- ��ǰ�������� Calendar Event -->
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

	//=================== "��ٱ��� ���" Event ���� =================== 
	$(function() {
		$("input.btn.btn-success").bind("click", function() {
			alert("��ٱ���")
		//	fncAddPurchase();
		});
	});

	//=================== "���" Event ���� =================== 
	$(function() {
		$("a[href='#' ].btn.btn-default").bind("click", function() {
			alert("���")
		});
	});
	
	//=================== "����" Event ���� =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
			alert("����")
		//	$("form")[0].reset();
		});
	});
	
	function fncAddPurchase() {
		//Form ��ȿ�� ����

		var name = $("input[name='name']").val();
		var birthDate = $("input[name='birthDate']").val();
		var phone = $("input[name='phone']").val();
		var email = $("input[name='email']").val();

		if (name == null || name.length < 1 ) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		$("form")
		.attr("method", "POST")
		.attr("action", "/purchase/addPurchase")
		.submit();

	}
	
	//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
	 $(function() {
		 
		 $("#email").bind("change" , function() {
			
			 var email = $("#email").val();
		    
			 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		    	alert("�̸��� ������ �ƴմϴ�.");
		     }
		});
	});	
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
			�����Ͻ� Ƽ�Ͽ� ���� ���������� <strong class="text-danger">���Ŀ� �°� </strong>�Է��� �ּ���.
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
					<span class="input-group-addon" id="name">�� ��</span> 
					<input type="text" class="form-control" placeholder="�ʼ��Է�" aria-describedby="basic-addon1">
				</div><br>

				<div class="input-group">
					<span class="input-group-addon" id="phone">����ó</span> 
					<input type="text" class="form-control" placeholder="' - ' ���� ��ȣ�� �Է�" aria-describedby="basic-addon1">
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
						<input class="btn btn-success" type="button" value="��ٱ��� ���">
						<a class="btn btn-default" href="#" role="button">��&nbsp;��</a>
						<button type="button" class="btn btn-danger">��&nbsp;��</button>
					</div>
				</div>


		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>