<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        
	</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listBasket").submit();
}


//=================== "전체티켓결제" 버튼 Event 연결 =================== 
$(function() {
	$("button:contains('전체티켓결제')").bind("click", function() {

		$("input[name='postNo']").prop("checked", true);

		var postCount = $("input[name='postNo']:checked").length;
		var sumPostNo = "";
		
		for (var i = 0; i < postCount; i++) {
			if (i != postCount - 1) {
				var postNo = $( $("input[name='postNo']")[i] ).val() + ",";
			} else {
				var postNo = $( $("input[name='postNo']")[i] ).val();
			}
			sumPostNo += postNo;
		}
//		alert(sumPostNo)		
		})
	});
	
//=================== "선택티켓결제" 버튼 Event 연결 ===================
	$(function() { 
		$("button:contains('선택티켓결제')").bind("click", function() {
			
			
			var postCount = $("input[name='postNo']:checked").length;
			if (postCount == 0 ) {
				alert("선택된 티켓이 없습니다.")
			}
			
			var sumPostNo = "";
			
			for (var i = 0; i < postCount; i++) {
				if (i != postCount - 1) {
					var postNo = $( $("input[name='postNo']")[i] ).val() + ",";
				} else {
					var postNo = $( $("input[name='postNo']")[i] ).val();
				}
				sumPostNo += postNo;
			}
//			alert(sumPostNo)
			$("span[name='ticketCount']").append(postCount)
		})
	});
	
	//=================== "선택티켓삭제" 버튼 Event 연결 ===================
	$(function() { 
		$("button:contains('선택티켓삭제')").bind("click", function() {
			
			var postCount = $("input[name='postNo']:checked").length;
			if (postCount == 0 ) {
				alert("선택된 티켓이 없습니다.")
			}
			
			var sumPostNo = "";
			
			for (var i = 0; i < postCount; i++) {
				if (i != postCount - 1) {
					var postNo = $( $("input[name='postNo']")[i] ).val() + ",";
				} else {
					var postNo = $( $("input[name='postNo']")[i] ).val();
				}
				sumPostNo += postNo;
			}
			alert(sumPostNo + "선택티켓삭제 콜?")
//			alert(sumPostNo)
		})
	});
	
	
	//=================== "결제예매정보 페이지로 이동" 버튼 Event 연결 ===================
	$(function() { 
		$("button:contains('결제예매정보 페이지로 이동')").bind("click", function() {
			fncAddPurchasList(); 
		})
	});
	
	//=================== "취소" 버튼 Event 연결 ===================
	$(function() { 
		$("button:contains('취 소')").bind("click", function() {
			$("span[name='ticketCount']").empty();
		})
	});
	
	//=================== "fncAddPurchasList()" 버튼 Event 연결 ===================	
	function fncAddPurchasList() {
		$("form")
		.attr("method", "POST")
		.attr("action", "/purchase/addPurchaseList/")
		.submit();
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
				<strong class="text-success">
				<c:if test="${ user.userName eq null }">
					${ user.userId }
				</c:if>
					${ user.userName }
				</strong> 회원님의  <strong class="text-danger">장바구니</strong> 목록 입니다.
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
							<h4>${ num.count }</h4>
							
								<label class="btn btn-info">
									<input type="checkbox" name="postNo" value="${ list.postNo }"> 
									선택하기
								</label>
							
							</th>
						<td><img class="media-object" src="${ list.ticketImage }" alt="There is no image" ></td>
						<td>
							<h3>${ list.ticketTitle }</h3>
							<input type="hidden" name="contentId" value="${ list.contentid }">
							<input type="hidden" name="contentTypeId" value="${ list.contenttypeid }">
						</td>
						<td>
							<h5>● 예매일자 : ${ list.bookingDate }</h5>
							<h5>● 취소 가능일자 : ${ list.cancelDate } 까지</h5>
							<button type="button" class="btn btn-default btn-lg btn-block">
								<h3>예매티켓보기</h3>
							</button>
						</td>
				</tbody>
				</c:forEach>
			</table>

			<hr>
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6 text-right">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#allTicketPayment">전체티켓결제</button>
					<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#selectedTicketPayment">선택티켓결제</button>
					<button type="button" class="btn btn-info">선택티켓삭제</button>
					<button type="button" class="btn btn-danger">Success</button>

				</div>
			</div>
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<input type="hidden" id="pageNo" name="pageNo" value=""/>

			<!-- '전체티켓결제' Modal -->
			<div class="modal fade" id="allTicketPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">전체결제</h4>
						</div>
						<div class="modal-body">
							<h2 class="text-center">장바구니에 있는 모든 티켓을</h2> 
							<h2 class="text-center text-danger">결제 하시겠습니까?</h2>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								취 소
							</button>
							<button type="button" class="btn btn-danger">
								결제예매정보 페이지로 이동
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- '전체티켓결제' Modal -->
			<div class="modal fade" id="selectedTicketPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">선택결제</h4>
						</div>
						<div class="modal-body">
							<h2 class="text-center">선택하신 <span class="label label-warning" name='ticketCount'></span> 장의 티켓을</h2> 
							<h2 class="text-center text-danger">결제 하시겠습니까?</h2>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								취 소
							</button>
							<button type="button" class="btn btn-danger">
								결제예매정보 페이지로 이동
							</button>
						</div>
					</div>
				</div>
			</div>

		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>