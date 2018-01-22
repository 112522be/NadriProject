<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>testTicketView.jsp</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!-- //////////////////// CSS //////////////////// -->

	<style>
		body {
            padding-top : 50px;
        }
	</style>


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

	//=================== "��ȸ" Event ���� =================== 
	$(function() {
		$(".btn.btn-primary#option1").bind("click", function() {
			//			alert("��ư [1] :: OK")
			//			alert("����� :: " + $("input[name='title']").val())
			console.log("����� :: " + $("input[name='title']").val())
		});

		$(".btn.btn-primary#option2").bind("click", function() {
			//			alert("��ư [2] :: OK")
			//			alert("��ȸ�� :: " + $("input[name='click']").val())
			console.log("��ȸ�� :: " + $("input[name='click']").val())
		});

		$("#option3").bind("click", function() {
			//			alert("��ư [3] :: OK")
			//			alert("�����ϼ� :: " + $("input[name='modify']").val())
			console.log("�����ϼ� :: " + $("input[name='modify']").val())
		});

		$("#option4").bind("click", function() {
			//			alert("��ư [4] :: OK")
			//			alert("�����ϼ� :: " + $("input[name='create']").val())
			console.log("�����ϼ� :: " + $("input[name='create']").val())
		});

	});

	//=================== "��ȸ" Event ���� =================== 
	$(function() {
		$("button.btn.btn-primary").bind("click", function() {
			fncGetTicket();
		});
	});

	//=================== "���" Event ���� =================== 
	$(function() {
		$("a[href='#' ]").bind("click", function() {
			$("form")[0].reset();
		});
	});

	//=================== "����ȸ" Event ���� =================== 
	$(function() {
		$("a[href='#' ]:contains('����ȸ')").bind("click", function() {
			alert("����ȸ Ŭ��")
			
		});
	});
	
	
	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/testTicket")
				.submit();
	}
</script>

</head>

<body>
	<!-- ToolBar Start ////////////////////////////////////
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class="text-info">������Ƽ�� �׽�Ʈ</h3>
			<h5 class="text-muted text-left">
				��ȸ�Ͻ� Ƽ�� ������ <strong class="text-danger">����</strong>�� �ּ���.
			</h5>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

<!-- 
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-primary" id="option1"> 
					<input type="radio" name="title" value="A" autocomplete="off">
					�����
				</label> 
				
				<label class="btn btn-primary active" id="option2"> 
					<input type="radio" name="click" value="B" autocomplete="off" checked>
					��ȸ��
				</label> 
				
				<label class="btn btn-primary" id="option3"> 
					<input type="radio" name="modify" value="Q" autocomplete="off">
					�����ϼ�
				</label> 
				
				<label class="btn btn-primary" id="option4"> 
					<input type="radio" name="create" value="R" autocomplete="off">
					�����ϼ�
				</label>
			</div>
-->		

			<hr />

			<div class="row">
				<c:set var="i" value="0" />
				<c:forEach var="ticketList" items="${searchFestival}">
					<div class="col-sm-3">
						<h4>
							<span class="label label-success"> 
								${ searchFestival.get(i).title }
							</span>
						</h4>
						<div class="thumbnail">
							<c:if test="${ empty searchFestival.get(i).firstimage }">
								<img src="http://placehold.it/350X230" />
							</c:if>
							<img src="${ searchFestival.get(i).firstimage }" />
							<div class="caption">
								��&nbsp;�� : ${ searchFestival.get(i).eventstartdate } ~ ${ searchFestival.get(i).eventenddate }<br>
								��ȸ�� : ${ searchFestival.get(i).readcount }
								<p class="text-right">
									<a href="#" class="btn btn-warning" role="button">����ȸ</a>
								</p>
							</div>
						</div>
					</div>
					<c:set var="i" value="${ i + 1 }" />
				</c:forEach>
				<br>
			</div>

			<hr />
<!-- 			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">��&nbsp;ȸ</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>
 -->	
			
		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... 
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->

</body>

</html>