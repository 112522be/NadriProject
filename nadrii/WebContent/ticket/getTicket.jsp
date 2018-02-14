<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>나들이 티켓 상세조회</title>

<meta charset="UTF-8">


<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
    var jqOld = jQuery.noConflict();
    jqOld(function() {
        jqOld("#datepicker" ).datepicker();
    })
	</script>
	
	
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

<body class="no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<div class="inner">
				<header>
					<h1><a href="/index.jsp" id="logo">N A D R I I</a></h1>
				</header>
			</div>
					
				<jsp:include page="/layout/toolbar.jsp" />

		</div>

			
		<!-- Main -->
		<div class="wrapper style1">
		
		<input type="hidden" name="title" value="${ tourTicket.title }">
		<input type="hidden" name="originimgurl" value="${ detailImage.originimgurl }">
		<input type="hidden" name="contenttypeid" value="${ detailIntro.contenttypeid }">
		<input type="hidden" name="usetimefestival" value="${ detailIntro.usetimefestival }">
		
			<div class="container">
				<article id="main" class="special">
					<header>
						<h2>
							<a href="#">${ tourTicket.title }</a>
						</h2>
						<p>
							관람등급 : ${ detailIntro.agelimit }
						</p>
					</header>
					<a href="#" class="image featured">
						<img src="${ detailImage.originimgurl }" alt="" style="height: 642.83px;"/>
					</a>
					
					<section>
						<header><h3>행사정보</h3></header>
						<p>행사기간 : ${ detailIntro.playtime }</p>
						<p>행사장소 : ${ detailIntro.eventplace }</p>
						<p>축제등급 : ${ detailIntro.festivalgrade }</p>
						<p>행사장 위치 : ${ detailIntro.placeinfo }</p>
						<p>관람 소요시간 : ${ detailIntro.spendtimefestival }</p>
						<br>
						<header><h3>부대행사</h3></header>
						<p>${ detailIntro.subevent }</p>
						<p>행사 홈페이지 : ${ detailIntro.eventhomepage }</p>
						<br>
						<header><h3>주 최</h3></header>
						<p>1. ${ detailIntro.sponsor1 } : ${ detailIntro.sponsor1tel }</p>
						<p>2. ${ detailIntro.sponsor2 } : ${ detailIntro.sponsor2tel }</p>
						<br>
						<header><h3>요금정보</h3></header>
						<p>할인정보 : ${ detailIntro.discountinfofestival }</p>
						<p>이용요금 : ${ detailIntro.usetimefestival }</p>
						
					</section>
				</article>
				<hr />
				
				<div class="row">
					<article class="4u 12u(mobile) special">
						<header>
							<h3>
							<c:if test="${ detailIntro.usetimefestival ne '무료' }">
								<div id="datepicker">
									<input type="hidden" name="bookingDate" />
								</div>
							</c:if>	
							</h3>
						</header>
					</article>
					<article class="4u 12u(mobile) special">
						<header>
							<h3>
								<a href="#" class="button">
									<c:if test="${ detailIntro.usetimefestival ne '무료' }">
										예매하기 / 장바구니 담기
									</c:if>
									<c:if test="${ detailIntro.usetimefestival eq '무료' }">
	  									무료입장가능
									</c:if>
								</a>
							</h3>
						</header>	
					</article>
					<article class="4u 12u(mobile) special">
						<header>
							<h3>
								<a href="#" class="button">
	  								취 소
								</a>
							</h3>
						</header>
					</article>
				</div>
			</div>

		</div>

		<!-- Footer -->
		<div id="footer">
			<div class="container">
				
				<div class="row">
					
				</div>
				
				<hr />
				
				<div class="row">
					<div class="12u">

						<!-- Contact -->
						<section class="contact">
							<header>
								<h3>Nisl turpis nascetur interdum?</h3>
							</header>
							<p>Urna nisl non quis interdum mus ornare ridiculus egestas
								ridiculus lobortis vivamus tempor aliquet.</p>
							<ul class="icons">
								<li><a href="#" class="icon fa-twitter"><span
										class="label">Twitter</span></a></li>
								<li><a href="#" class="icon fa-facebook"><span
										class="label">Facebook</span></a></li>
								<li><a href="#" class="icon fa-instagram"><span
										class="label">Instagram</span></a></li>
								<li><a href="#" class="icon fa-pinterest"><span
										class="label">Pinterest</span></a></li>
								<li><a href="#" class="icon fa-dribbble"><span
										class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon fa-linkedin"><span
										class="label">Linkedin</span></a></li>
							</ul>
						</section>

						<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved.</li>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

					</div>

				</div>
				
				
				
			</div>
		</div>

	</div>

	<!-- Scripts -->
		<script src="/resources/helios/assets/js/jquery.min.js"></script>
		<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
		<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
		<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script>
		<script src="/resources/helios/assets/js/skel.min.js"></script>
		<script src="/resources/helios/assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="/resources/helios/assets/js/main.js"></script>

</body>


</html>