<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>��ٱ��� ���</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

	<!-- //////////////////// CSS //////////////////// -->

	<style>
        
	</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listBasket").submit();
}


//=================== "��üƼ�ϰ���" ��ư Event ���� =================== 
$(function() {
	$("button:contains('��üƼ�ϰ���')").bind("click", function() {

		$("input[name='postNo']").prop("checked", true);

		var postCount = $("input[name='postNo']:checked").length;
		var sumPostNo = "";
		
		for (var i = 0; i < postCount; i++) {
			if (i != postCount - 1) {
				var postNo = $( $("input[name='postNo']")[i] ).val() + ",";
			} else {
				var postNo = $( $("input[name='postNo']")[i] ).val();
			}
			sumPostNo += postNo;
		}
//		alert(sumPostNo)		
		})
	});
	
//=================== "����Ƽ�ϰ���" ��ư Event ���� ===================
	$(function() { 
		$("button:contains('����Ƽ�ϰ���')").bind("click", function() {
			
			
			var postCount = $("input[name='postNo']:checked").length;
			if (postCount == 0 ) {
				alert("���õ� Ƽ���� �����ϴ�.")
			}
			
			var sumPostNo = "";
			
			for (var i = 0; i < postCount; i++) {
				if (i != postCount - 1) {
					var postNo = $( $("input[name='postNo']")[i] ).val() + ",";
				} else {
					var postNo = $( $("input[name='postNo']")[i] ).val();
				}
				sumPostNo += postNo;
			}
//			alert(sumPostNo)
			$("span[name='ticketCount']").append(postCount)
		})
	});
	
	//=================== "����Ƽ�ϰ���" ��ư Event ���� ===================
	$(function() { 
		$("button:contains('������������ �������� �̵�')").bind("click", function() {
			fncAddPurchasList(); 
		})
	});
	
	//=================== "����Ƽ�ϰ���" ��ư Event ���� ===================	
	function fncAddPurchasList() {
		$("form")
		.attr("method", "POST")
		.attr("action", "/purchase/addPurchaseList/")
		.submit();
	}
	
	
</script>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<div class="container">

		<div class="page-header text-right">
			<h3 class="text-info">
				<p class="bg-success"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> ��ٱ���</p>
			</h3>
			<h5 class="text-muted">
				<strong class="text-success">
				<c:if test="${ user.userName eq null }">
					${ user.userId }
				</c:if>
					${ user.userName }
				</strong> ȸ������  <strong class="text-danger">��ٱ���</strong> ��� �Դϴ�.
			</h5>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<table class="table table-hover">
				<thead>
					<tr>
						<th>��ȣ</th>
						<th>Ƽ���̹���</th>
						<th>Ƽ�ϸ�</th>
						<th>������</th>
					</tr>
				</thead>
				
				<c:forEach var="list" items="${list}" varStatus="num">
				<tbody>
					<tr>
						<th scope="row">
							<h4>${ num.count }</h4>
							
								<label class="btn btn-info">
									<input type="checkbox" name="postNo" value="${ list.postNo }"> 
									�����ϱ�
								</label>
							
							</th>
						<td><img class="media-object" src="${ list.ticketImage }" alt="There is no image" ></td>
						<td>
							<h3>${ list.ticketTitle }</h3>
							<input type="hidden" name="contentId" value="${ list.contentid }">
							<input type="hidden" name="contentTypeId" value="${ list.contenttypeid }">
						</td>
						<td>
							<h5>�� �������� : ${ list.bookingDate }</h5>
							<h5>�� ��� �������� : ${ list.cancelDate } ����</h5>
							<button type="button" class="btn btn-default btn-lg btn-block">
								<h3>����Ƽ�Ϻ���</h3>
							</button>
						</td>
				</tbody>
				</c:forEach>
			</table>

			<hr>
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6 text-right">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#allTicketPayment">��üƼ�ϰ���</button>
					<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#selectedTicketPayment">����Ƽ�ϰ���</button>
					<button type="button" class="btn btn-info">����Ƽ�ϻ���</button>
					<button type="button" class="btn btn-danger">Success</button>

				</div>
			</div>
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<input type="hidden" id="pageNo" name="pageNo" value=""/>

			<!-- '��üƼ�ϰ���' Modal -->
			<div class="modal fade" id="allTicketPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">��ü����</h4>
						</div>
						<div class="modal-body">
							<h2 class="text-center">��ٱ��Ͽ� �ִ� ��� Ƽ����</h2> 
							<h2 class="text-center text-danger">���� �Ͻðڽ��ϱ�?</h2>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								�� ��
							</button>
							<button type="button" class="btn btn-danger">
								������������ �������� �̵�
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- '��üƼ�ϰ���' Modal -->
			<div class="modal fade" id="selectedTicketPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">���ð���</h4>
						</div>
						<div class="modal-body">
							<h2 class="text-center">�����Ͻ� <span class="label label-warning" name='ticketCount'></span> ���� Ƽ����</h2> 
							<h2 class="text-center text-danger">���� �Ͻðڽ��ϱ�?</h2>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								�� ��
							</button>
							<button type="button" class="btn btn-danger">
								������������ �������� �̵�
							</button>
						</div>
					</div>
				</div>
			</div>

		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>