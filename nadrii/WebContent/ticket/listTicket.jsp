<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>나들이 티켓 목록</title>
<meta charset="UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

	<!-- Optional theme -->
	<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> -->

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

	<!-- Latest compiled and minified JavaScript -->
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">
	function fncGetList(pageNo) {
//		alert("pageNo")
		$("#pageNo").val(pageNo);
		$("form").attr("method", "POST").attr("action", "/ticket/listTicket")
				.submit();

	}

	//=================== "4 kind of sorting" Event 연결 =================== 
	$(function() {

		$("a[href='#']:contains('제목순')").bind("click", function(event) {
			//alert("제목순")
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=A";
		})
	});

	$(function() {
		$("a[href='#']:contains('조회순')").bind("click", function(event) {
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=B";
		})
	});

	$(function() {
		$("a[href='#']:contains('수정일순')").bind("click", function(event) {
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=C";
		})
	});

	$(function() {

		$("a[href='#']:contains('생성일순')").bind("click", function(event) {
			event.preventDefault();
			self.location = "/ticket/listTicket?searchCondition=D";
		})
	});

	function fncGetTicketSort(searchCondition) {

		alert("[value check] ==> " + searchCondition)

		self.location = "/ticket/listTicket"

	}

	//=================== "상세조회" Event 연결 ===================
	$(function() {
		$("a[href='#']:contains('상세조회')").bind("click", function(event) {
//					alert("상세조회")

					event.preventDefault();

					var contentId = $(
							$('input[name="contentId"]')[$("a[href='#']:contains('상세조회')").index(this)]).val();
					var contentTypeId = $(
							$('input[name="contentTypeId"]')[$("a[href='#']:contains('상세조회')").index(this)]).val();
					var title = $(
							$('input[name="title"]')[$("a[href='#']:contains('상세조회')").index(this)]).val();
					var encodeTitle = encodeURI(encodeURIComponent(title));
					
					console.log('contentId : ' + contentId)
					console.log('contentTypeId : ' + contentTypeId)
					console.log('title : ' + title)
					console.log('encodeTitle : ' + encodeTitle)

					self.location = "/ticket/getTicket?" + "contentId="
							+ contentId + "&contentTypeId=" + contentTypeId
							+ "&title=" + encodeTitle;

				});
	});

	function fncGetTicket() {
		$(".page-wrapper").attr("method", "POST").attr("action", "/ticket/getTicket")
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
<form action="navigation">
			<!-- Features -->
				<div class="wrapper style1">

					<section id="features" class="container special">
						<header>
							<h2>나들이 티켓</h2>
							<p>조회하실 티켓 정보를 <strong class="text-danger">선택</strong>해 주세요.</p>
						</header>
						<footer>
							<a href="#" class="button">제목순</a>&nbsp;&nbsp;
							<a href="#" class="button">조회순</a>&nbsp;&nbsp;
							<a href="#" class="button">수정일순</a>&nbsp;&nbsp;
							<a href="#" class="button">생성일순</a>
						</footer>
						<br>
						<p> 현재 ${ resultPage.pageNo } 페이지 / 전체 ${ resultPage.totalCount } 건 </p>
						
						<div class="row">
						
							<c:forEach var="tt" items="${tourTicket}" varStatus="num">
								<article class="4u 12u(mobile) special">
								<span class="timestamp">조회수 : ${ tt.readcount }</span>
									<a href="#" class="image featured">
										<img src="${ tt.firstimage }" alt="" style="height: 302.36px;"/>
									</a>
									<header style="height: 70px;">
										<h3><a href="#">${ num.count }. ${ tt.title }</a></h3>
									</header>
									<p>
										기&nbsp;간 : ${ tt.eventstartdate } ~ ${ tt.eventenddate }
									</p>
									<a href="#" class="button">상세조회</a>
									
								</article>
								
								<!-- PageNavigation을 위한 값을 보내는 부분  -->
								<input type="hidden" name="contentId" value="${ tt.contentid }">
								<input type="hidden" name="contentTypeId" value="${ tt.contenttypeid }">
								<input type="hidden" name="title" value="${ tt.title }">
								<input type="hidden" name="eventstartdate" value="${ tt.eventstartdate }">
								<input type="hidden" name="eventenddate" value="${ tt.eventenddate }">
								
							</c:forEach>
								
						</div>
						
					</section>
					
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="pageNo" name="pageNo" value="" /> 
					<input type="hidden" name="searchCondition" id="searchCondition" value="">
				<hr/>			
				<jsp:include page="../common/pageNavigator_openApi.jsp"/>
				</div>
				
</form>
		
		<jsp:include page="/layout/footer.jsp" />



	</div>

		

	</body>
</html>