<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>장바구니 목록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

	<!-- //////////////////// CSS //////////////////// -->

	<style>
		body {
            padding-top : 50px;
        }
        
        .media {
        	background-color: #d1e2c9;
        }
        
	</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listBasket").submit();
	
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
				<p class="bg-success"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 장바구니</p>
			</h3>
			<h5 class="text-muted">
				<strong class="text-success">${ user.userName }</strong> 회원님의  <strong class="text-danger">장바구니</strong> 목록 입니다.
			</h5>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<div class="row">
				<c:forEach var="list" items="${list}" varStatus="num">

					<input type="hidden" name="contentId" value="${ list.contentid }">
					<input type="hidden" name="contentTypeId" value="${ list.contenttypeid }">

					<div class="col-sm-6">

						<div class="media">

							<span class="input-group-addon"> 
								<input type="checkbox" aria-label="...">
							</span>

							<div class="media-left media-middle">
								<a href="#"> 
									<img class="media-object" src="${ list.ticketImage }" alt="There is no image" >
								</a>
							</div>
							
							<div class="media-body">
								<h4 class="media-heading">${ list.ticketTitle }</h4>
								<hr>
								<h5>● 예매일자 : ${ list.bookingDate }</h5>
								<h5>● 취소 가능일자 : ${ list.cancelDate } 까지</h5>
								<h5>● 구매한 티켓 : ${ list.ticketPriceAll }</h5>
							</div>
							
						</div>
						<!-- div class="media" -->
					</div>
					<!-- /.col-lg-6 -->
				</c:forEach>
			</div>
			
			





			<hr>
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<input type="hidden" id="pageNo" name="pageNo" value=""/>
	
		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>