<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<title>예매정보입력</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	<!-- Scripts -->
	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script> 
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	<script src="/resources/helios/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

	var totalTicketCount = "";
	var ticketPrice = "";
	var ticketCount = "";
	var totalTicketPrice = "";

	//=================== "장바구니 담기" Event 연결 =================== 
	$(function() {
		$("button:contains('장바구니 담기')").bind('click', function() {
			fncBasketList();
		})
	});

	function fncBasketList() {
		 
		$(".label.label-warning[name='titleB']").append('${ tourTicket.title }');

		for (var i = 0; i < $(".ticketPrice").length; i++) {
			ticketPrice = $(".ticketPrice").eq(i).val();
			ticketCount = $(".ticketCount").eq(i).val();

			totalTicketCount += ticketCount * 1;

			if (ticketCount != 0) {
				var sumPriceTicket = (ticketPrice * 1) * ticketCount;
				totalTicketPrice = (totalTicketPrice * 1)
						+ (sumPriceTicket * 1);
				$(".modal-body").append("<h2>&nbsp;&nbsp;<code>￦ "
										+ ticketPrice
										+ "</code> : <span class='label label-info'>"
										+ ticketCount + "</span>&nbsp;장</h2>");
			}
		}
		$(".label.label-success").append("￦ " + totalTicketPrice);
	}
	
</script>
<script>
	
	//=================== "장바구니 내에서 저장하기" Event 연결 =================== 
	$(function() {
		$("button:contains('저장하기')").bind("click", function() {
			var flag = 'basket';
			fncAddPurchase(flag);
//			alert("저장하기 완료")
			return;
			
		});
	});

	
	//=================== "취소" Event 연결 =================== 
	function goBack() {
    	window.history.back();
	}
	
	
	//=================== "결제" Event 연결 =================== 
	$(function() {
		$("button.btn.btn-danger").bind("click", function() {
//			alert("결제")
			var flag = 'purchase';
			fncAddPurchase(flag);
		});
	});
	
	//=================== "로그인" Event 연결 =================== 
	$(function() {
		$("button:contains('로그인')").bind("click", function() {
			self.location = "/user/login"
		});
	});
	
	
	//==================== "수량증감" Event 연결 =================== 
	
	function fncTicketCount(indexVal, currentVal, countVal) {

//		console.log("[fncTicketCount START]")

		var inputVal = $(".ticketCount").eq(indexVal).val();
		var textVal = $(".badge").eq(indexVal).text();
/*
		console.log("[1] inputVal : " + inputVal)
		console.log("[2] textVal : " + textVal)
//*/
		if (countVal == 'plus') {
//			console.log("[Plus]")
			inputVal = $(".ticketCount").eq(indexVal).val(currentVal * 1 + 1);
			textVal = $(".badge").eq(indexVal).text(currentVal * 1 + 1);
		}

		if (countVal == 'minus' && currentVal >= 1) {
//			console.log("[Minus]")
			inputVal = $(".ticketCount").eq(indexVal).val(currentVal * 1 - 1);
			textVal = $(".badge").eq(indexVal).text(currentVal * 1 - 1);
		} else if (countVal == 'minus' && currentVal <= 0) {
			console.log("[티켓 수량이 0 보다 작음]")
		}
		
	}

	//==================== + / - 버튼 처리 ====================

	$(function() {

		$("button[name='minus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("button[name='minus']").index(this);
			var countVal = 'minus';
			var currentVal = $(".ticketCount").eq(indexVal).val();

			/*
			console.log("- 인덱스 값 : " + indexVal)
			console.log("- 카운트 값 : " + countVal)
			console.log("- 현재 값 : " + currentVal)
			//*/
			
			if (currentVal <= 0) {
				alert("티켓 수량을 확인 하시기 바랍니다.")
			}

			fncTicketCount(indexVal, currentVal, countVal);

		});

		$("a[name='plus']").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("a[name='plus']").index(this);
			var countVal = 'plus';
			var currentVal = $(".ticketCount").eq(indexVal).val();

			/*
			console.log("+ 인덱스 값 : " + indexVal)
			console.log("+ 카운트 값 : " + countVal)
			console.log("+ 현재 값 : " + currentVal)
			//*/

			fncTicketCount(indexVal, currentVal, countVal);
		});

	});

	
	// ===== Form 유효성 검증 후 Navigation =====
	function fncAddPurchase(flag) {
		var name = $("input[name='buyerName']").val();
		var phone = $("input[name='buyerPhone']").val();
		
		for (var i = 0; i < $(".ticketPrice").length; i++) {		
			ticketPrice = $(".ticketPrice").eq(i).val();
			ticketCount = $(".ticketCount").eq(i).val();
			console.log('2. 티켓 구매수량 확인 : ' + ticketPrice + " = " + ticketCount)
			totalTicketCount += ticketCount * 1;
		}
		
//		console.log("티켓 몇장 구매 했니? " + totalTicketPrice)
		
		if (totalTicketCount == 0 || totalTicketCount == "") {
			alert("티켓 수량을 확인하시기 바랍니다.")
/*			
			history.go(0);
			$(".label.label-warning[name='titleB']").empty();
			$(".modal-body").empty();
			$(".label.label-success").empty();
//*/			
			return;
		}
		if (name == null || name.length < 1) {
			alert("이름은 반드시 입력해야 합니다.");
/*
			$(".label.label-warning[name='titleB']").empty();
			$(".modal-body").empty();
			$(".label.label-success").empty();
//*/			
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("연락처는 반드시 입력해야 합니다.");
/*	
			$(".label.label-warning[name='titleB']").empty();
			$(".modal-body").empty();
			$(".label.label-success").empty();
//*/			
			return;
		}
		//==>"이메일" 유효성 Check Event 처리 및 연결
		$(function() {
			$("input[name='email']").bind( "change", function() {
				var email = $("input[name='email']").val();
				if (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
					alert("이메일 형식이 아닙니다.");
				}
			});
		});
		
		if (flag == 'basket') {

			var ticketPriceAll = "";
			for (var i = 0; i < $(".ticketPrice").length; i++) {	
				ticketPrice = $(".ticketPrice").eq(i).val();
				ticketCount = $(".ticketCount").eq(i).val();
				
				if (ticketCount != 0) {
					ticketPriceAll += ticketPrice + "=" + ticketCount + "&";
				}
			}
			
			var basketData = {
					"ticketTitle" : '${ tourTicket.title }' ,
					"ticketImage" : '${ detailImage.originimgurl }' , 
					"bookingDate" : '${ bookingDate }' ,
					"ticketPriceAll" : ticketPriceAll ,
					"contentId" : '${ tourTicket.contentid }' ,
					"contentTypeId" : '${ tourTicket.contenttypeid }' ,
					"flag" : flag,
					"buyerId" : $("input[name='buyerId']").val() ,
					"buyerName" : $("input[name='buyerName']").val() ,
					"buyerPhone" : $("input[name='buyerPhone']").val() ,
					"buyerEmail" : $("input[name='buyerEmail']").val() ,
				}
			
			var jsonData = JSON.stringify(basketData);
			
			
			$.ajax (
					{
						url : "/purchase/json/addBasket",
						method : "POST",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data:jsonData,
						success : function() {
					//		alert("들어온거 확인");
						}
					});		
					alert("저장하기 완료");
					location.reload();
		} else {
			
//			alert("flag 값 확인 : " + flag)
			
			$("form")
			.attr("method", "POST")
			.attr("action", "/purchase/addPurchase/" + flag)
			.submit();
		}
	}

</script>
	
</head>

<body class="left-sidebar">
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
				
				<input type="hidden" name="contentId" value="${ tourTicket.contentid }">
				<input type="hidden" name="contentTypeId" value="${ tourTicket.contenttypeid }">

				<input type="hidden" name="ticketTitle" value="${ tourTicket.title }">
				<input type="hidden" name="eventstartdate" value="${ tourTicket.eventstartdate }">
				<input type="hidden" name="eventenddate" value="${ tourTicket.eventenddate }">
				<input type="hidden" name="bookingDate" value="${ bookingDate }">
				<input type="hidden" name="eventplace" value="${ tourTicket.eventplace }">
				<input type="hidden" name="ticketImage" value="${ detailImage.originimgurl }">

					<div class="container">
						<div class="row 200%">
							<div class="4u 12u(mobile)" id="sidebar">
								<hr class="first" />
								<section>
									<header>
										<h3 class="icon fa-user">
											<a href="#">예매정보입력</a>
										</h3>
									</header>
									<p>
										구매하실 티켓에 대한 개인정보를 <strong class="text-danger">형식에 맞게 </strong>입력해 주세요.
									</p>
								</section>
								<hr />
								
								<section>
									<header>
										<h3><a href="#">개인정보 입력</a></h3>
									</header>
									<p>
										<strong class="text-danger">개인 정보</strong>를 확인하시기 바랍니다.
									</p>
									
									<div class="row 50%">
										
										<div class="4u">
											<h2 class="icon fa-user circled"><span class="label">user</span></h2>
										</div>
										
										<div class="8u">
											<input type="text" name="buyerId" id="demo-name" value="${ user.userId }" placeholder=" ID" readonly>
										</div>
										
										<div class="8u">
											<c:if test="${ user.userName eq null }">
												<input type="text" name="buyerName" id="demo-name" value="${ user.userName }" placeholder=" Name">
											</c:if>
											<c:if test="${ user.userName ne null }">	
												<input type="text" name="buyerName" id="demo-name" value="${ user.userName }" placeholder=" Name" readonly>
											</c:if>
										</div>

									</div>
								</section>
								
								
								<section>		
									<div class="row 50%">
									
										<div class="4u">
											<h2 class="icon fa-phone circled"><span class="label">user</span></h2>
										</div>
										
										<div class="8u">
											<c:if test="${ user.phone eq null }">
												<input type="text" name="buyerPhone" id="demo-name" value="${ user.phone }" placeholder=" Phone">
											</c:if>	
											<c:if test="${ user.phone ne null }">
												<input type="text" name="buyerPhone" id="demo-name" value="${ user.phone }" placeholder=" Phone" readonly>
											</c:if>
										</div>
										<div class="8u">
											<input type="text" name="buyerEmail" id="demo-name" value="${ user.email }" placeholder=" Email" readonly>
										</div>

									</div>
									
								</section>
									<hr>
								
								<section>
									<header>
										<h3><a href="#">입장권 구매</a></h3>
									</header>
									<p>
										<strong class="text-danger">구매 수량</strong>을 선택하시기 바랍니다.
									</p>
									
									<c:forEach items="${ priceList }" varStatus="status">
									<div class="row 50%">
										
										<input type="hidden" class="ticketCount" name="ticketCount" value=0>
										<input type="hidden" class="ticketPrice" name="ticketPrice" value="${ priceList[status.index] }">
									
										<div class="4u">
											<h2 class="icon fa-ticket circled"><span class="label">Ticket</span></h2>
										</div>
										
										<div class="4u">
											<h4>￦ ${ priceList[status.index] }</h4>
										</div>
										<div class="4u">
											<h3 class="icon fa-plus"></h3>
										</div>
										
										<div class="4u">
											<h3 class="icon">0</h3>
										</div>
										<div class="4u">
											<h3 class="icon fa-minus"></h3>
										</div>

									</div>
									</c:forEach>
								</section>
								
							</div>
							
							<div class="8u 12u(mobile) important(mobile)" id="content">
								<article id="main">
									<header>
										<h2><a href="#">${ tourTicket.title }</a></h2>
									</header>
									<a href="#" class="image featured">
										<img src="${ detailImage.originimgurl }" alt="" style="height: 413.86px;"/>
									</a>
									
									<section>
										<header>
											<h3>선택한 예매일자</h3>
										</header>
										<p>
											${ bookingDate }
										</p>
									</section>
									<section>
										<header>
											<h3>이용요금</h3>
										</header>
										<p>
											${ detailIntro.usetimefestival }
										</p>
									</section>
								</article>
							</div>
							<footer>
								<a href="#" name="cancel" class="button">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</a>
								<a href="#" name="basket" class="button">장바구니</a>
								<a href="#" name="purchase" class="button">결제하기</a>
							</footer>
							
						</div><!-- row 200% end -->
						
					</div><!-- container -->

				</div>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						
						<hr />
						<div class="row">
							<div class="12u">

								<!-- Contact -->
									<section class="contact">
										<header>
											<h3>Nisl turpis nascetur interdum?</h3>
										</header>
										<p>Urna nisl non quis interdum mus ornare ridiculus egestas ridiculus lobortis vivamus tempor aliquet.</p>
										<ul class="icons">
											<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
											<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
											<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
											<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
											<li><a href="#" class="icon fa-linkedin"><span class="label">Linkedin</span></a></li>
										</ul>
									</section>

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
										</ul>
									</div>

							</div>

						</div>
					</div>
				</div>

		</div>

	</body>

</html>