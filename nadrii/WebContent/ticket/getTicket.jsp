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

$(function(){
	$("button:contains('��ٱ��� ���')").bind("click", function(){
		alert("��ٱ��� ���")
//		self.location = "/purchase/addPurchase?prod_no=${ product.prodNo }"
//			$("form").attr("method", "POST")	
	});
});

// ========== '�����ϱ�' Event ���� ==========
$(function(){
	$("a[href='#']:contains('�����ϱ�')").bind("click", function(){
		fncAddBooking();
	});
});

// ========== "DatePicker" Event ����  ==========
$(function() {
	$("#datepicker").datepicker({
		
		dateFormat: "yymmdd",
		changeMonth: true,
		changeYear: true,
		
		minDate: '${ detailIntro.eventstartdate }',
		maxDate: '${ detailIntro.eventenddate }', 
	
		onSelect: function(){
			var bookingDate = $.datepicker.formatDate("yymmdd", $(this).datepicker('getDate'));
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
			<h3 class=" text-info text-center">
				<p class="bg-warning">������ Ƽ�� ����ȸ</p>
			</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">

			<div class="form-group">
				<h1>
					<span class="label label-warning"> ${ tourTicket.title } </span>
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
					contentId : ${ detailIntro.contentid }<br>
					contentTypeId : ${ detailIntro.contenttypeid }
					<hr>
					�������� : ${ detailIntro.agelimit }<br>
					����ó : ${ detailIntro.bookingplace }<br>
					�������� : ${ detailIntro.discountinfofestival }<br> 
					���Ⱓ : ${ detailIntro.eventstartdate }
					~ ${ detailIntro.eventenddate }<br> 
					��� Ȩ������ : ${ detailIntro.eventhomepage }<br>
					������ : ${ detailIntro.eventplace }<br> 
					������� : ${ detailIntro.festivalgrade }<br>
					����� ��ġ �ȳ� : ${ detailIntro.placeinfo }<br> 
					�����ð� : ${ detailIntro.playtime }<br>
					���� �ҿ�ð� : ${ detailIntro.spendtimefestival }<br> 
					���� : ${ detailIntro.sponsor1 }<br>
					�ְ��� ����ó : ${ detailIntro.sponsor1tel }<br> 
					�δ���� : ${ detailIntro.subevent }<br>
					<hr>
					�̿��� : ${ detailIntro.usetimefestival }
				</div>

				<!-- 3nd :: �������� �Է� -->
				<div class="col-sm-4">
					<p>�������� ����</p>
					<div id="datepicker" >
						<input type="hidden" name="bookingDate"/>
					</div>
				</div>

			</div>
			
			<div class="col-md-12 text-right ">
	  			<button type="button" class="btn btn-danger">
	  				��ٱ��� ���
	  			</button>
	  			<a class="btn btn-danger btn" href="#" role="button">
	  				�����ϱ�
	  			</a>
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