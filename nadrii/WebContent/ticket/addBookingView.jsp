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

	//=================== "���" Event ���� =================== 
	$(function() {
		$("button.btn.btn-primary").bind("click", function() {
			fncAddProduct();
		});
	});

	//=================== "���" Event ���� =================== 
	$(function() {
		$("a[href='#' ]").bind("click", function() {
			$("form")[0].reset();
		});
	});
	
	//=================== "��ǰ��������" Event ���� ===================
	$(function() {
		$("#manuDate").datepicker({
			dateFormat: "yymmdd",
			changeMonth: true,
			changeYear: true 
		});
	});

	function fncAddProduct() {
		//Form ��ȿ�� ����

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
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

		$("form").attr("method", "POST").attr("action", "/product/addProduct")
			.attr("enctype", "multipart/form-data").submit();

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
			�����Ͻ� Ƽ�Ͽ� ���� ���������� <strong class="text-danger">���Ŀ� �°� </strong>�Է��� �ּ���.
		</h5>
	</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" placeholder="�ʼ��Է�">
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="�ʼ��Է�">
				</div>
			</div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="�ʼ��Է�">
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" placeholder="�ʼ��Է�">
				</div>
			</div>

			<div class="form-group">
				<label for="fileNames"
					class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fileNames" name="fileNames">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">��&nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>