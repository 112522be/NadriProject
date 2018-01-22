<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>testTicketView.jsp</title>

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
	</style>


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

	//=================== "조회" Event 연결 =================== 
	$(function() {
		$(".btn.btn-primary#option1").bind("click", function() {
			//			alert("버튼 [1] :: OK")
			//			alert("제목순 :: " + $("input[name='title']").val())
			console.log("제목순 :: " + $("input[name='title']").val())
		});

		$(".btn.btn-primary#option2").bind("click", function() {
			//			alert("버튼 [2] :: OK")
			//			alert("조회순 :: " + $("input[name='click']").val())
			console.log("조회순 :: " + $("input[name='click']").val())
		});

		$("#option3").bind("click", function() {
			//			alert("버튼 [3] :: OK")
			//			alert("수정일순 :: " + $("input[name='modify']").val())
			console.log("수정일순 :: " + $("input[name='modify']").val())
		});

		$("#option4").bind("click", function() {
			//			alert("버튼 [4] :: OK")
			//			alert("생성일순 :: " + $("input[name='create']").val())
			console.log("생성일순 :: " + $("input[name='create']").val())
		});

	});

	//=================== "조회" Event 연결 =================== 
	$(function() {
		$("button.btn.btn-primary").bind("click", function() {
			fncGetTicket();
		});
	});

	//=================== "취소" Event 연결 =================== 
	$(function() {
		$("a[href='#' ]").bind("click", function() {
			$("form")[0].reset();
		});
	});

	//=================== "상세조회" Event 연결 =================== 
	$(function() {
		$("a[href='#' ]:contains('상세조회')").bind("click", function() {
			alert("상세조회 클릭")
			
		});
	});
	
	
	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/testTicket")
				.submit();
	}
</script>

</head>

<body>
	<!-- ToolBar Start ////////////////////////////////////
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class="text-info">나들이티켓 테스트</h3>
			<h5 class="text-muted text-left">
				조회하실 티켓 정보를 <strong class="text-danger">선택</strong>해 주세요.
			</h5>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

<!-- 
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-primary" id="option1"> 
					<input type="radio" name="title" value="A" autocomplete="off">
					제목순
				</label> 
				
				<label class="btn btn-primary active" id="option2"> 
					<input type="radio" name="click" value="B" autocomplete="off" checked>
					조회순
				</label> 
				
				<label class="btn btn-primary" id="option3"> 
					<input type="radio" name="modify" value="Q" autocomplete="off">
					수정일순
				</label> 
				
				<label class="btn btn-primary" id="option4"> 
					<input type="radio" name="create" value="R" autocomplete="off">
					생성일순
				</label>
			</div>
-->		

			<hr />

			<div class="row">
				<c:set var="i" value="0" />
				<c:forEach var="ticketList" items="${searchFestival}">
					<div class="col-sm-3">
						<h4>
							<span class="label label-success"> 
								${ searchFestival.get(i).title }
							</span>
						</h4>
						<div class="thumbnail">
							<c:if test="${ empty searchFestival.get(i).firstimage }">
								<img src="http://placehold.it/350X230" />
							</c:if>
							<img src="${ searchFestival.get(i).firstimage }" />
							<div class="caption">
								기&nbsp;간 : ${ searchFestival.get(i).eventstartdate } ~ ${ searchFestival.get(i).eventenddate }<br>
								조회수 : ${ searchFestival.get(i).readcount }
								<p class="text-right">
									<a href="#" class="btn btn-warning" role="button">상세조회</a>
								</p>
							</div>
						</div>
					</div>
					<c:set var="i" value="${ i + 1 }" />
				</c:forEach>
				<br>
			</div>

			<hr />
<!-- 			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">조&nbsp;회</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
 -->	
			
		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... 
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->

</body>

</html>