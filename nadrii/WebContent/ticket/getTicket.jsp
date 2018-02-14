<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<title>나들이 티켓 상세조회</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// imperfect templete ////////////////////////// -->
	<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
	 <link rel="stylesheet" href="/resources/imperfect/assets/css/main.css" /> 
	<!--[if lte IE 9]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie8.css" /><![endif]-->
	
	<!-- Scripts -->
	<script src="/resources/imperfect/assets/js/jquery.min.js"></script>
	<script src="/resources/imperfect/assets/js/skel.min.js"></script>
	<script src="/resources/imperfect/assets/js/util.js"></script> 
	<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/imperfect/assets/js/main.js"></script> 
	
	<!--  ///////////////////////// DatePicker ////////////////////////// --> 
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->

	
	
	
	
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style type="text/css">
	
	</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

// ========== '예매하기 / 장바구니 담기' Event 연결 ==========
$(function(){
	$("a[href='#']:contains('예매하기')").bind("click", function(){
		fncAddBooking();
	});
});

//========== '예매하기 / 장바구니 담기' Event 연결 ==========
$(function(){
	$("button:contains('취 소')").bind("click", function(){
		self.location = "/ticket/listTicket"
	});
});

// ========== "DatePicker" Event 연결  ==========
$(function() {
	$("#datepicker").datepicker({
		
		dateFormat: "yymmdd",
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ["월", "화", "수", "목", "금", "토", "일"],
		monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		showMonthAfterYear: true,
		
		minDate: '${ detailIntro.eventstartdate }',
		maxDate: '${ detailIntro.eventenddate }', 
	
		onSelect: function(){
			var bookingDate = $.datepicker.formatDate("yy년 mm월 dd일", $(this).datepicker('getDate'));
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

<body class>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div id="wrapper">
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div id="main">

		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">

			<input type="hidden" name="title" value="${ tourTicket.title }">
			<input type="hidden" name="originimgurl" value="${ detailImage.originimgurl }">
			<input type="hidden" name="contenttypeid" value="${ detailIntro.contenttypeid }">
			<input type="hidden" name="usetimefestival" value="${ detailIntro.usetimefestival }">

			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">${ tourTicket.title }</a>
						</h2>
						<p>관람등급 : ${ detailIntro.agelimit }</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">
							November 1,	2015
						</time>
						<a href="#" class="author">
							<span class="name">
								${ user.userName } 
							<c:if test="${ user.userName eq null }">
								${ user.userId }
								<c:if test="${ user.userId eq null }">
									Guest 
								</c:if>	
							</c:if>	
							&nbsp;님
							</span>
							<img src="/resources/imperfect/images/avatar.jpg" alt="" />
						</a>
					</div>
				</header>
				<span class="image right"><img src="${ detailImage.originimgurl }" alt=""></span>
				<!-- 
				<a href="#" class="image"><img src="${ detailImage.originimgurl }" alt=""></a>
				 -->	
					<ul>
						<li>행사기간 : ${ detailIntro.playtime }</li>
						<li>행사장소 : ${ detailIntro.eventplace }</li>
						<li>축제등급 : ${ detailIntro.festivalgrade }</li>
						<li>행사장 위치 안내 : ${ detailIntro.placeinfo }</li>
						<li>관람 소요시간 : ${ detailIntro.spendtimefestival }</li>
						<li>부대행사 : ${ detailIntro.subevent }</li>
						<hr>
						<li>주 최 ① : ${ detailIntro.sponsor1 } : ${ detailIntro.sponsor1tel }</li>
						<li>주 최 ② : ${ detailIntro.sponsor2 } : ${ detailIntro.sponsor2tel }</li>
						<hr>
						<li>행사 홈페이지 : ${ detailIntro.eventhomepage }</li>
						<li>할인정보 : ${ detailIntro.discountinfofestival }</li>
						<hr>
						<li>이용요금 : ${ detailIntro.usetimefestival }</li>
						<c:if test="${ detailIntro.usetimefestival ne '무료' }">
							<li>예매일자 선택</li>
								<div id="datepicker">
									<input type="hidden" name="bookingDate" />
								</div>
						</c:if>
					</ul>

				<footerB>
					<ul class="actions">
						<li><a href="#" class="button big">
						<c:if test="${ detailIntro.usetimefestival ne '무료' }">
							예매하기 / 장바구니 담기
						</c:if>
						<c:if test="${ detailIntro.usetimefestival eq '무료' }">
	  							무료입장가능
						</c:if>
						</a></li>
					</ul>
					<ul class="stats">
						<li>
							<a href="#">
								취 소
							</a>
						</li>
						<!-- <li><a href="#" class="icon fa-heart">28</a></li>
						<li><a href="#" class="icon fa-comment">128</a></li> -->
					</ul>
				</footerB>
			</article>


				
	  		
		<hr/>
		
		<br/>
		
		</form>
		<!-- form End /////////////////////////////////////-->
	
		</div>
		</div>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	
	


</body>

</html>