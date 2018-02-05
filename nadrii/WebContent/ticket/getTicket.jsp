<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>������ Ƽ�� ����ȸ</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- DatePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
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

// ========== '�����ϱ� / ��ٱ��� ���' Event ���� ==========
$(function(){
	$("a[href='#']:contains('�����ϱ�')").bind("click", function(){
		fncAddBooking();
	});
});

//========== '�����ϱ� / ��ٱ��� ���' Event ���� ==========
$(function(){
	$("button:contains('�� ��')").bind("click", function(){
		self.location = "/ticket/listTicket"
	});
});

// ========== "DatePicker" Event ����  ==========
$(function() {
	$("#datepicker").datepicker({
		
		dateFormat: "yymmdd",
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"],
		monthNamesShort: ["1��", "2��", "3��", "4��", "5��", "6��", "7��", "8��", "9��", "10��", "11��", "12��"],
		showMonthAfterYear: true,
		
		minDate: '${ detailIntro.eventstartdate }',
		maxDate: '${ detailIntro.eventenddate }', 
	
		onSelect: function(){
			var bookingDate = $.datepicker.formatDate("yy�� mm�� dd��", $(this).datepicker('getDate'));
  			$('input[name="bookingDate"]').val(bookingDate);
		}
	})
});

function fncAddBooking() {
	var bookingDate = $('input[name="bookingDate"]').val();
	
	if (bookingDate == null || bookingDate.length < 1) {
		alert("�������ڸ� ������ �ּ���");
		return;
	}
	
	$("form")
	.attr("method", "POST")
	.attr("action", "/ticket/addBooking")
	.submit();
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
			<h3 class=" text-info text-center bg-warning">
				������ Ƽ�� ����ȸ
			</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">

			<input type="hidden" name="title" value="${ tourTicket.title }">
			<input type="hidden" name="originimgurl" value="${ detailImage.originimgurl }">
			<input type="hidden" name="contentid" value="${ detailIntro.contentid }">
			<input type="hidden" name="contenttypeid" value="${ detailIntro.contenttypeid }">
			<input type="hidden" name="usetimefestival" value="${ detailIntro.usetimefestival }">

<!-- 
			<input type="hidden" name="agelimit" value="${ detailIntro.agelimit }">
			<input type="hidden" name="playtime" value="${ detailIntro.playtime }">
			<input type="hidden" name="eventplace" value="${ detailIntro.eventplace }">
			<input type="hidden" name="festivalgrade" value="${ detailIntro.festivalgrade }">
			<input type="hidden" name="placeinfo" value="${ detailIntro.placeinfo }">
			<input type="hidden" name="spendtimefestival" value="${ detailIntro.spendtimefestival }">
			<input type="hidden" name="subevent" value="${ detailIntro.subevent }">
			<input type="hidden" name="sponsor1" value="${ detailIntro.sponsor1 }">
			<input type="hidden" name="sponsor2" value="${ detailIntro.sponsor2 }">
			<input type="hidden" name="sponsor1tel" value="${ detailIntro.sponsor1tel }">
			<input type="hidden" name="sponsor2tel" value="${ detailIntro.sponsor2tel }">
			<input type="hidden" name="eventhomepage" value="${ detailIntro.eventhomepage }">
			<input type="hidden" name="discountinfofestival" value="${ detailIntro.discountinfofestival }">
			<input type="hidden" name="eventstartdate" value="${ detailIntro.eventstartdate }">
			<input type="hidden" name="eventenddate" value="${ detailIntro.eventenddate }">
-->
			<div class="form-group">
				<h1>
					<span class="label label-warning text-left"> ${ tourTicket.title }</span>
				</h1>
				<br>
			</div>

			<div class="form-inline row">

				<!-- 1st :: ���� -->
				<div class="col-sm-4">
					<img src="${ detailImage.originimgurl }" alt="There is no image" class="img-responsive img-rounded">
				</div>

				<!-- 2rd :: ������ -->
				<div class="col-sm-4">
					�� �������� : ${ detailIntro.agelimit }<br>
					<hr>
					�� ���Ⱓ : ${ detailIntro.playtime }<br>
					�� ������ : ${ detailIntro.eventplace }<br> 
					�� ������� : ${ detailIntro.festivalgrade }<br>
					�� ����� ��ġ �ȳ� : ${ detailIntro.placeinfo }<br> 
					�� ���� �ҿ�ð� : ${ detailIntro.spendtimefestival }<br> 
					�� �δ���� : ${ detailIntro.subevent }<br>
					<hr>
					�� ���� : ${ detailIntro.sponsor1 } / ${ detailIntro.sponsor2 }<br>
					�� �ְ��� ����ó �� : ${ detailIntro.sponsor1tel }<br> 
					�� �ְ��� ����ó �� : ${ detailIntro.sponsor2tel }<br> 
					<hr>
					�� ��� Ȩ������ : ${ detailIntro.eventhomepage }<br>
					<hr>
					�� �������� : ${ detailIntro.discountinfofestival }<br> 
					�� �̿��� : ${ detailIntro.usetimefestival }
				</div>

				<!-- 3nd :: �������� �Է� -->
				<div class="col-sm-4">
					<p>�������� ����</p>
					<div id="datepicker" >
						<input type="hidden" name="bookingDate"/>
					</div><br>
				
	  			<button type="button" class="btn btn-success">
	  				�� ��
	  			</button>
	  			<c:if test="${ detailIntro.usetimefestival eq '����' }">
	  			<a class="btn btn-info btn" href="#" role="button">
	  				�������尡��
	  			</a>
				</c:if>
				
				<c:if test="${ detailIntro.usetimefestival ne '����' }">
				<a class="btn btn-danger btn" href="#" role="button">
	  				�����ϱ� <span class="glyphicon glyphicon-star-empty" aria-hidden="true"> </span> ��ٱ��� ���
	  			</a>	
				</c:if>
				</div>

			</div>
			
			<div class="col-md-12 text-right ">
	  		</div>
	  		
		<hr/>
		
		<div class="row">
		</div>
		
		<br/>
		
		</form>
		<!-- form End /////////////////////////////////////-->
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>