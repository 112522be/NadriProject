<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>������ Ƽ�� ���</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- ���ѽ�ũ�� -->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- //////////////////// CSS //////////////////// -->

	<style>
		body {
            padding-top : 50px;
        }
        
        .col-sm-3 {
        	height: 500px;
        }
	</style>


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listTicket").submit();
	
}

	//=================== "4 kind of sorting" Event ���� =================== 
	$(function() {
		$("a[href='#']:contains('�����')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "A";
			fncGetTicketSort(searchCondition);
		})
	});
	
	$(function() {
		$("a[href='#']:contains('��ȸ��')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "B";
			fncGetTicketSort(searchCondition);
		})
	});
	
	$(function() {
		$("a[href='#']:contains('�����ϼ�')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "C";
			fncGetTicketSort(searchCondition);
		})
	});
	
	$(function() {
		$("a[href='#']:contains('�����ϼ�')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "D";
			fncGetTicketSort(searchCondition);
		})
	});
	
	function fncGetTicketSort(searchCondition) {
		
//		alert("[value check] ==> " + searchCondition)
		
		var data = {
				"searchCondition" : searchCondition ,
			}
		
		var jsonData = JSON.stringify(data);

		$.ajax (
				{
					url : "/ticket/json/listTicket/",
					method : "POST",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : jsonData,
					success : function() {
					}
				});		
	}

	//=================== "����ȸ" Event ���� ===================
	$(function() {
		$("a[href='#' ]:contains('����ȸ')").bind("click", function(event) {
//			alert("����ȸ")
			
			event.preventDefault();

			var contentId = $( $('input[name="contentId"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var contentTypeId = $( $('input[name="contentTypeId"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var title = $( $('input[name="title"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var encodeTitle = encodeURI(encodeURIComponent(title));
			console.log('contentId : ' + contentId)
			console.log('contentTypeId : ' + contentTypeId)
			console.log('title : ' + title)
			console.log('encodeTitle : ' + encodeTitle)
			
			self.location ="/ticket/getTicket?"
					+ "contentId=" + contentId 
					+ "&contentTypeId=" + contentTypeId
					+ "&title=" + encodeTitle;
			
		});
	});
	
	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/getTicket").submit();
	}
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-right">
			<h3 class="text-info">
				<p class="bg-success">������Ƽ��</p>
			</h3>
			<h5 class="text-muted">
				��ȸ�Ͻ� Ƽ�� ������ <strong class="text-danger">����</strong>�� �ּ���.
			</h5>
		</div>

	<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

	<!-- JQUERY nav-pills Start -->
		<div>
			<!-- Nav tabs -->
			<ul class="nav nav-pills">
				<li role="presentation"><a href="#">�����</a></li>
				<li role="presentation"><a href="#">��ȸ��</a></li>
				<li role="presentation"><a href="#">�����ϼ�</a></li>
				<li role="presentation"><a href="#">�����ϼ�</a></li>
			</ul>

		</div>
	<!-- JQUERY nav-pills End -->

		<div class="col-md-12 text-right">
			<p class="text-primary">
				<code>
				&lt; ���� ${ resultPage.pageNo } ������ / ��ü ${ resultPage.totalCount } �Ǽ� &gt;
				</code>
			</p>
		</div>

			<hr />

			<div class="row">
			<c:forEach var="tt" items="${tourTicket}" varStatus="num">
					<div class="col-sm-3">
					
						<div class="col-sm-12">
							<p>
								<span class="label label-success"> ${ num.count } </span>
							</p>
							<h5>&nbsp;${ tt.title }</h5>
						</div>	
					
						<div class="thumbnail">
						
							<p class="text-right">��ȸ�� : ${ tt.readcount }</p>
							
							<img src="${ tt.firstimage }" class="img-responsive" />
							
							<div class="caption">
								<h5>
								<!-- 
									����� :
									<c:forEach items="${ tt.usetimefestival }" varStatus="status">
									${ tt.usetimefestival[status.index] }
									</c:forEach>
								 -->	
								<hr />
								
								��&nbsp;�� : ${ tt.eventstartdate } ~ ${ tt.eventenddate }<br>
								��&nbsp;�� : ${ tt.eventplace } <br>
								</h5>
								<br>
								<p class="text-right">
									<a href="#" class="btn btn-success btn-lg" role="button"> ����ȸ 
									<!-- PageNavigation�� ���� ���� ������ �κ�  -->
										<input type="hidden" name="contentId" value="${ tt.contentid }"> 
										<input type="hidden" name="contentTypeId" value="${ tt.contenttypeid }"> 
										<input type="hidden" name="title" value="${ tt.title }"> 
										<input type="hidden" name="eventstartdate" value="${ tt.eventstartdate }"> 
										<input type="hidden" name="eventenddate" value="${ tt.eventenddate }">
									</a>
								</p>
							</div>
						</div>

					</div>
			</c:forEach>
			</div>

			<hr />
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<input type="hidden" id="pageNo" name="pageNo" value=""/>
			
		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->

</body>

</html>