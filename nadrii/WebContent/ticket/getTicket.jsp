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
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	-->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- DatePicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// imperfect templete ////////////////////////// -->
	<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->	
	<link rel="stylesheet" href="/resources/imperfect/assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/imperfect/assets/css/ie8.css" /><![endif]-->
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 	footer a {
		color: #656565;
	}
	
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

			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">${ tourTicket.title }</a>
						</h2>
						<p>관람등급 : ${ detailIntro.agelimit }</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">November 1,
							2015</time>
						<a href="#" class="author"><span class="name">Jane Doe</span><img
							src="/resources/imperfect/images/avatar.jpg" alt=""></a>
					</div>
				</header>
				<a href="#" class="image featured"><img
					src="/resources/imperfect/images/pic01.jpg" alt=""></a>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor
					magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies
					mi non congue ullam corper. Praesent tincidunt sed tellus ut
					rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies
					congue gravida diam non fringilla.</p>
				<footerB>
					<ul class="actions">
						<li><a href="#" class="button big">Continue Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon fa-heart">28</a></li>
						<li><a href="#" class="icon fa-comment">128</a></li>
					</ul>
				</footerB>
			</article>





			<div class="page-header">
			<h3 class=" text-info text-center bg-warning">
				나들이 티켓 상세조회
			</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">

			<input type="hidden" name="title" value="${ tourTicket.title }">
			<input type="hidden" name="originimgurl" value="${ detailImage.originimgurl }">
			<input type="hidden" name="contentid" value="${ detailIntro.contentid }">
			<input type="hidden" name="contenttypeid" value="${ detailIntro.contenttypeid }">
			<input type="hidden" name="usetimefestival" value="${ detailIntro.usetimefestival }">

			<div class="form-group">
				<h1>
					<span class="label label-warning text-left"> ${ tourTicket.title }</span>
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
					● 관람연령 : ${ detailIntro.agelimit }<br>
					<hr>
					● 행사기간 : ${ detailIntro.playtime }<br>
					● 행사장소 : ${ detailIntro.eventplace }<br> 
					● 축제등급 : ${ detailIntro.festivalgrade }<br>
					● 행사장 위치 안내 : ${ detailIntro.placeinfo }<br> 
					● 관람 소요시간 : ${ detailIntro.spendtimefestival }<br> 
					● 부대행사 : ${ detailIntro.subevent }<br>
					<hr>
					● 주최 : ${ detailIntro.sponsor1 } / ${ detailIntro.sponsor2 }<br>
					● 주관사 연락처 ① : ${ detailIntro.sponsor1tel }<br> 
					● 주관사 연락처 ② : ${ detailIntro.sponsor2tel }<br> 
					<hr>
					● 행사 홈페이지 : ${ detailIntro.eventhomepage }<br>
					<hr>
					● 할인정보 : ${ detailIntro.discountinfofestival }<br> 
					● 이용요금 : ${ detailIntro.usetimefestival }
				</div>

				<!-- 3nd :: 예매일자 입력 -->
				<div class="col-sm-4">
					<p>예매일자 선택</p>
					<div id="datepicker" >
						<input type="hidden" name="bookingDate"/>
					</div><br>
				
	  			<button type="button" class="btn btn-success">
	  				취 소
	  			</button>

	  			<c:if test="${ detailIntro.usetimefestival eq '무료' }">
	  			<a class="btn btn-info btn" href="#" role="button">
	  				무료입장가능
	  			</a>
				</c:if>
				
				<c:if test="${ detailIntro.usetimefestival ne '무료' }">
				<a class="btn btn-danger btn" href="#" role="button">
	  				예매하기 <span class="glyphicon glyphicon-star-empty" aria-hidden="true"> </span> 장바구니 담기
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
		</div>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<!-- Scripts -->
	<script src="/resources/imperfect/assets/js/jquery.min.js"></script>
	<script src="/resources/imperfect/assets/js/skel.min.js"></script>
	<script src="/resources/imperfect/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/imperfect/assets/js/main.js"></script>


</body>

</html>