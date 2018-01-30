<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>나들이 티켓 상세조회</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	$("button:contains('장바구니 담기')").bind("click", function(){
		alert("장바구니 담기")
//		self.location = "/purchase/addPurchase?prod_no=${ product.prodNo }"
//			$("form").attr("method", "POST")	
	});
});

// ========== '예매하기' Event 연결 ==========
$(function(){
	$("a[href='#']:contains('예매하기')").bind("click", function(){
		fncAddBooking();
	});
});

// ========== "DatePicker" Event 연결  ==========
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
		alert("예매일자를 선택해 주세요");
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
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class=" text-info text-center">
				<p class="bg-warning">나들이 티켓 상세조회</p>
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

				<!-- 1st :: 사진 -->
				<div class="col-sm-4">
					<img src="${ detailImage.originimgurl }" alt="There is no image" class="img-responsive img-rounded">
				</div>

				<!-- 2rd :: 상세정보 -->
				<div class="col-sm-4">
					contentId : ${ detailIntro.contentid }<br>
					contentTypeId : ${ detailIntro.contenttypeid }
					<hr>
					관람연령 : ${ detailIntro.agelimit }<br>
					예매처 : ${ detailIntro.bookingplace }<br>
					할인정보 : ${ detailIntro.discountinfofestival }<br> 
					행사기간 : ${ detailIntro.eventstartdate }
					~ ${ detailIntro.eventenddate }<br> 
					행사 홈페이지 : ${ detailIntro.eventhomepage }<br>
					행사장소 : ${ detailIntro.eventplace }<br> 
					축제등급 : ${ detailIntro.festivalgrade }<br>
					행사장 위치 안내 : ${ detailIntro.placeinfo }<br> 
					관람시간 : ${ detailIntro.playtime }<br>
					관람 소요시간 : ${ detailIntro.spendtimefestival }<br> 
					주최 : ${ detailIntro.sponsor1 }<br>
					주관사 연락처 : ${ detailIntro.sponsor1tel }<br> 
					부대행사 : ${ detailIntro.subevent }<br>
					<hr>
					이용요금 : ${ detailIntro.usetimefestival }
				</div>

				<!-- 3nd :: 예매일자 입력 -->
				<div class="col-sm-4">
					<p>예매일자 선택</p>
					<div id="datepicker" >
						<input type="hidden" name="bookingDate"/>
					</div>
				</div>

			</div>
			
			<div class="col-md-12 text-right ">
	  			<button type="button" class="btn btn-danger">
	  				장바구니 담기
	  			</button>
	  			<a class="btn btn-danger btn" href="#" role="button">
	  				예매하기
	  			</a>
	  		</div>
	  		
		<hr/>
		
		<div class="row">
		</div>
		
		<br/>
		
		</form>
		<!-- form End /////////////////////////////////////-->
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>