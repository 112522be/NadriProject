<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta charset="UTF-8">

<title>구매한 티켓 목록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	

	<!-- //////////////////// CSS //////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}



	//=================== "메인으로" 버튼 Event 연결 =================== 
	$(function() {
		$("button:contains('메인으로')").bind("click", function() {
			self.location = "/index.jsp"
		})
	});

	
	
</script>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<div class="container">

		<div class="page-header text-right">
			<h3 class="text-info">
				<p class="bg-success"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 구매한티켓목록</p>
			</h3>
			<h5 class="text-muted">
				<strong class="text-success">
				<c:if test="${ user.userName eq null }">
					${ user.userId }
				</c:if>
					${ user.userName }
				</strong> 회원님의  <strong class="text-danger">구매한 티켓</strong> 목록 입니다.
			</h5>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>티켓이미지</th>
						<th>티켓명</th>
						<th>상세정보</th>
					</tr>
				</thead>
				
				<c:forEach var="list" items="${list}" varStatus="num">
				<tbody>
					<tr>
						<th scope="row">
							<h4>${ num.count }. [NO:${ list.postNo }]</h4>
							
								<label class="btn btn-info">
									<input type="checkbox" name="postNo" value="${ list.postNo }"> 
									선택하기
								</label>
							
							</th>
						<td><img class="media-object" src="${ list.ticketImage }" alt="There is no image" ></td>
						<td>
							<h3>${ list.ticketTitle }</h3>
						</td>
						<td>
							<h5>● 예매일자 : ${ list.bookingDate }</h5>
							<h5>● 취소 가능일자 : ${ list.cancelDate } 까지</h5>
							<a class="btn btn-default btn-lg btn-block" role="button" data-toggle="collapse"
								href="#${ num.index }" aria-expanded="false" aria-controls="collapseExample">
									<h4>티켓정보</h4>
							</a>
							<div class="collapse" id="${ num.index }">
								<div class="well text-center">
								<c:forEach var="ticketInfo" items="${list.ticketP}" varStatus="num">
									<h5 class="text-danger">￦ ${ ticketInfo } = ${ list.ticketC[num.index] } 장</h5>								
								</c:forEach>
								</div>
							</div>
						</td>
				</tbody>
				</c:forEach>
			</table>
			
			<input type="hidden" name="sumPostNo">
			
			<hr>
			<div class="row">
				<div class="col-xs-6 text-left">
				<!-- <button type="button" class="btn btn-danger">전체선택취소</button> --> 
				</div>
				<div class="col-xs-6 text-right">
					<button type="button" class="btn btn-success" >메인으로</button>
				</div>
			</div>
			
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