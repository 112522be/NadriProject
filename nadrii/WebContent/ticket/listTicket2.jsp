<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<title>나들이 티켓 목록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<!-- 무한스크롤 -->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- //////////////////// CSS //////////////////// -->

	<style>
	.col-sm-3 {
		height: 500px;
	}
	</style>


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listTicket").submit();
	
}

	//=================== "4 kind of sorting" Event 연결 =================== 
	$(function() {

		$("a[href='#']:contains('제목순')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "A";
			fncGetTicketSort(searchCondition);
		})
	});

	$(function() {
		$("a[href='#']:contains('조회순')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "B";
			fncGetTicketSort(searchCondition);
		})
	});

	$(function() {
		$("a[href='#']:contains('수정일순')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "C";
			fncGetTicketSort(searchCondition);
		})
	});

	$(function() {

		$("a[href='#']:contains('생성일순')").bind("click", function(event) {
			event.preventDefault();
			var searchCondition = "D";
			fncGetTicketSort(searchCondition);
		})
	});
	
	function fncGetTicketSort(searchCondition) {
		
//		alert("[value check] ==> " + searchCondition)
		
		var data = {
				"searchCondition" : searchCondition ,
			}
		
		var jsonData = JSON.stringify(data);

		$.ajax (
				{
					url : "/ticket/json/listTicket/",
					method : "POST",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : jsonData,
					success : function() {
					}
				});		
	}

	//=================== "상세조회" Event 연결 ===================
	$(function() {
		$("a[href='#' ]:contains('상세조회')").bind("click", function(event) {
//			alert("상세조회")
			
			event.preventDefault();

			var contentId = $( $('input[name="contentId"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var contentTypeId = $( $('input[name="contentTypeId"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var title = $( $('input[name="title"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var encodeTitle = encodeURI(encodeURIComponent(title));
			console.log('contentId : ' + contentId)
			console.log('contentTypeId : ' + contentTypeId)
			console.log('title : ' + title)
			console.log('encodeTitle : ' + encodeTitle)
			
			self.location ="/ticket/getTicket?"
					+ "contentId=" + contentId 
					+ "&contentTypeId=" + contentTypeId
					+ "&title=" + encodeTitle;
			
		});
	});
	
	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/getTicket").submit();
	}
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-right">
			<h3 class="text-info">

				<p class="bg-success">나들이티켓</p>
			</h3>

			<h5 class="text-muted">
				조회하실 티켓 정보를 <strong class="text-danger">선택</strong>해 주세요.
			</h5>
		</div>

	<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

	<!-- JQUERY nav-pills Start -->
		<div>
			<!-- Nav tabs -->
			<ul class="nav nav-pills">
				<li role="presentation"><a href="#">제목순</a></li>
				<li role="presentation"><a href="#">조회순</a></li>
				<li role="presentation"><a href="#">수정일순</a></li>
				<li role="presentation"><a href="#">생성일순</a></li>
			</ul>

		</div>
	<!-- JQUERY nav-pills End -->

		<div class="col-md-12 text-right">
			<p class="text-primary">
				<code>
				&lt; 현재 ${ resultPage.pageNo } 페이지 / 전체 ${ resultPage.totalCount } 건수 &gt;
				</code>
			</p>
		</div>

			<hr />

			<div class="row">
			<c:forEach var="tt" items="${tourTicket}" varStatus="num">
					<div class="col-sm-3">
					
						<div class="col-sm-12">
							<p>
								<span class="label label-success"> ${ num.count } </span>
							</p>
							<h5>&nbsp;${ tt.title }</h5>
						</div>	
					
						<div class="thumbnail">

						
							<p class="text-right">조회수 : ${ tt.readcount }</p>
							
							<img src="${ tt.firstimage }" />

							<div class="caption">

								<h5>
								<!-- 
									입장권 :
									<c:forEach items="${ tt.usetimefestival }" varStatus="status">
									${ tt.usetimefestival[status.index] }
									</c:forEach>
								 -->	
								<hr />
								
								기&nbsp;간 : ${ tt.eventstartdate } ~ ${ tt.eventenddate }<br>
								장&nbsp;소 : ${ tt.eventplace } <br>
								</h5>
								<br>
								<p class="text-right">

									<a href="#" class="btn btn-success btn-lg" role="button"> 상세조회 
									<!-- PageNavigation을 위한 값을 보내는 부분  -->
										<input type="hidden" name="contentId" value="${ tt.contentid }"> 
										<input type="hidden" name="contentTypeId" value="${ tt.contenttypeid }"> 
										<input type="hidden" name="title" value="${ tt.title }"> 
										<input type="hidden" name="eventstartdate" value="${ tt.eventstartdate }"> 
										<input type="hidden" name="eventenddate" value="${ tt.eventenddate }">
									</a>
								</p>
							</div>
						</div>

					</div>
			</c:forEach>
			</div>

			<hr />
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