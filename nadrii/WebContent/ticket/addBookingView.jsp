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
	
	<!-- ///////////////////////// jQuery Spinner //////////////////////////  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>

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
	
	//=================== "��������" Event ���� =================== 
	var num = 0;
	
	function fncCount(indexVal, countVal) {
	
		alert($("input[name='selectPrice']").val())
		
		if (countVal == "plus") {
			num += 1;
			$(document).ready(function() {
//				$("#" + indexVal).text(num);
				$(".badge").text(num);
			});
		}

		if (num == 0) {
			alert("Ƽ�� ������ �Է��� �ּ���.")
		} else if (countVal == "minus") {
			num -= 1
			$(document).ready(function() {
//				$("#" + indexVal).text(num);
				$(".badge").text(num);

			});
		}
	}

	// ===== [+/-] button =====	
	$(function() {

		$("button[name='minus']").bind("click", function() {
			
			var indexVal = $("button[name='minus']").index(this);
			var countVal = $("button[name='minus']").val();
			//			var count = $( $("button[name='minus']")[$("button[name='minus']").index(this)] ).val();
			//			alert($("button[name='minus']").index(this) + " / " + count)
						alert("[minus] : " + indexVal + " / " + countVal)
			fncCount(indexVal, countVal)
		});

		$("button[name='plus']").bind("click", function() {
			var indexVal = $("button[name='plus']").index(this);
			var countVal = $("button[name='plus']").val();
						alert("[plus] : " + indexVal + " / " + countVal)
			fncCount(indexVal, countVal)
		});

	});

	// ===== JQUERY �������� ���ͳ� ���� =====	
	$(function() {
		$('.bt_up').click(function() {
			var n = $('.bt_up').index(this);
			var num = $(".num:eq(" + n + ")").val();
			num = $(".num:eq(" + n + ")").val(num * 1 + 1);
		});
		$('.bt_down').click(function() {
			var n = $('.bt_down').index(this);
			var num = $(".num:eq(" + n + ")").val();
			num = $(".num:eq(" + n + ")").val(num * 1 - 1);
		});
	})

	// ===== Form ��ȿ�� ���� =====
	function fncAddPurchase() {

		var name = $("input[name='name']").val();
		var birthDate = $("input[name='birthDate']").val();
		var phone = $("input[name='phone']").val();
		var email = $("input[name='email']").val();

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

		$("form").attr("method", "POST")
				.attr("action", "/purchase/addPurchase").submit();

	}

	//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
	$(function() {

		$("#email")
				.bind(
						"change",
						function() {

							var email = $("#email").val();

							if (email != ""
									&& (email.indexOf('@') < 1 || email
											.indexOf('.') == -1)) {
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
					�� <strong>��������</strong> : �����Ͻ� �������ڸ� Ȯ���Ͻñ� �ٶ��ϴ�.
				</div>
					<p>${ bookingDate }</p><br>
					
				<!-- #2 -->
				<div class="alert alert-warning" role="alert">
					�� <strong>�̿���</strong> : �Ʒ� �̿����� Ȯ���Ͻñ� �ٶ��ϴ�.
				</div>
					<p>${ detailIntro.usetimefestival }</p><br>
					
				<!-- #3 -->
				<div class="alert alert-danger" role="alert">
					�� <strong>����� ���� �ȳ�</strong> : ���� ������ �����Ͻñ� �ٶ��ϴ�.
				</div>

				<c:forEach items="${ priceList }" varStatus="status">

					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href="#"	value="${ priceList[status.index] }"> 
								<span class="glyphicon glyphicon-barcode" aria-hidden="true"> </span>&nbsp;
									${ priceList[status.index] } �� <span class="badge" ></span> 
							</a>
						</li>
				
						<!-- �������� ��ư -->
						&nbsp;&nbsp;
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" id="count"
								name="minus" value="minus">
								<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
							</button>

							<button type="button" class="btn btn-default" id="count"
								name="plus" value="plus">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
							</button>
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
						aria-describedby="basic-addon1" value="���Ŀ� ������ ��ü ����">
				</div>
				<br>
				
				<div class="input-group">
					<span class="input-group-addon" id="phone">����ó</span> 
					<input type="text" class="form-control" placeholder="' - ' ���� ��ȣ�� �Է�"
						aria-describedby="basic-addon1" value="���Ŀ� ������ ��ü ����">
				</div>
				<br>

				<div class="input-group">
					<span class="input-group-addon" id="email">@</span> 
					<input type="text" class="form-control" placeholder="E-mail"
						aria-describedby="basic-addon1" value="���Ŀ� ������ ��ü ����">
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
			</div>







		</form>
		<!-- form Start /////////////////////////////////////-->
		<div id="goods_list ">
			<form>
				<table align='' border='1' cellspacing='0' cellpadding='0'>
					<tr>
						<td>����</td>
					</tr>
					<tr>
						<td>
							<table>
								<tr>
									<td><input type="text" name="num" value="1" id="" class="num" /></td>
									<td>
										<div>
											<img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_up" />
										</div>
										<div>
											<img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_down" />
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>

		</div>
		<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>