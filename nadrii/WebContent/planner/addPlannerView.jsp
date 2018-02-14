<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<link href="../resources/css/keywordSearch.css?version=1"
	rel="stylesheet">


<script type="text/javascript">

	$(function() {
		$("#save").on("click",function() {
			save();
			$("input[name='lat']").val(lat);
			$("input[name='lng']").val(lng);

			$("form[name='addPlanner']").attr("method", "POST").attr("action", "/planner/addPlanner").submit();
		})
	})
	
	$(function() {
		$("#update").on("click",function() {
			save();
			$("input[name='lat']").val(lat);
			$("input[name='lng']").val(lng);

			$("form[name='addPlanner']").attr("method", "POST").attr("action", "/planner/updatePlanner").submit();
		})
	})
	
</script>

<style type="text/css">
h4 {
	color: #506fed !important;
}
.panel-heading{
	display: none; 
	border-style: solid; 
	border-width: 3px;
	border-color: #adbdf9;;
}
</style>

</head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div style="width: 70%; height: 800px; float: left; border-top:1px solid black;">

		<div class="map_wrap">

			<div id="map"
				style="width: 100%; height: 800px; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="" id="keyword" size="15">
							<button type="submit" id="searchListSubmit">검색하기</button>
						</form>
						<ul id="placesList" style="display: none;"></ul>
						<text id="button">▼</text>
					</div>
				</div>
				<div id="pagination"></div>
			</div>

			<div id="clickLatlng"></div>

		</div>
	</div>

	<div style="width: 30%; height: 800px; float: left; overflow-x:hidden; overflow-y: auto;border-top:1px solid black; border-left: 1px solid black;">
		<form name="addPlanner">
			<div class="container-fulid" style="margin:15px;">

				<div class="row">
					<div class="col-md-12">
						플래너 제목 : <input type="text" name="title" value="${planner.title }" />
						<c:if test="${status == 'normal'}">
							<input type="button" id="save" value="플래너 저장" style="float: right;" />
						</c:if>
						<c:if test="${status == 'update'}">
							<input type="button" id="update" value="플래너 수정" style="float: right;" />
						</c:if>
							
						<hr>
					</div>

					<div class="col-md-12" id=exButtonCreate style="margin-bottom:10px; float:right;"></div>
					<div class="col-md-2" id="subPointer"></div>

					<div class="col-md-10">
						<ul id="sortable" class="pointer" style="width: 300px">
						</ul>
					</div>

					<div class="col-md-12">
						<input type="button" value="경로탐색" style="float:right;" onclick="javascript:search1(1)">
						<br><hr>
					</div>

					<div id="roadContent" class="col-md-12">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel-heading" role="tab" id="head1">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse1"
										aria-expanded="true" aria-controls="collapse1"> <span
										class="glyphicon glyphicon-flag"></span>&nbsp;경로1
									</a>
								</h4>
							</div>
							<div id="collapse1" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="head1">
								<div class="panel-body">
									<div id="roadStartContent"></div>
								</div>
							</div>
							<div class="panel-heading" role="tab" id="head2">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse2"
										aria-expanded="false" aria-controls="collapse2"> <span
										class="glyphicon glyphicon-flag"></span>&nbsp;경로2
									</a>
								</h4>
							</div>
							<div id="collapse2" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="head2">
								<div class="panel-body">
									<div id="roadPass1Content"></div>
								</div>
							</div>
							<div class="panel-heading" role="tab" id="head3">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse3"
										aria-expanded="false" aria-controls="collapse3"> <span
										class="glyphicon glyphicon-flag"></span>&nbsp;경로3
									</a>
								</h4>
							</div>
							<div id="collapse3" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="head3">
								<div class="panel-body">
									<div id="roadPass2Content"></div>
								</div>
							</div>
							<div class="panel-heading" role="tab" id="head4">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse4"
										aria-expanded="false" aria-controls="collapse4"> <span
										class="glyphicon glyphicon-flag"></span>&nbsp;경로4
									</a>
								</h4>
							</div>
							<div id="collapse4" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="head4">
								<div class="panel-body">
									<div id="roadPass3Content"></div>
								</div>
							</div>
							<div class="panel-heading" role="tab" id="head5">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse5"
										aria-expanded="false" aria-controls="collapse5"> <span
										class="glyphicon glyphicon-flag"></span>&nbsp;경로5
									</a>
								</h4>
							</div>
							<div id="collapse5" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="head5">
								<div class="panel-body">
									<div id="roadPass4Content"></div>
								</div>
							</div>
							<div class="panel-heading" role="tab" id="head6">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse6"
										aria-expanded="false" aria-controls="collapse6"> <span
										class="glyphicon glyphicon-flag"></span>&nbsp;경로6
									</a>
								</h4>
							</div>
							<div id="collapse6" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="head6">
								<div class="panel-body">
									<div id="roadPass5Content"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<textarea class="form-control" rows="25" cols="blue" name="text">${planner.text}</textarea>
					</div>

					<input type="hidden" name="lat" value=""> 
					<input type="hidden" name="lng" value="">
					<c:if test="${status == 'update'}">
						<input type="hidden" name="postNo" value="${planner.postNo }">
					</c:if>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>

	<jsp:include page="../planner/plannerSub/mapAndRoadSearch.jsp" />
	
	<c:forEach items="${ dbLat }" varStatus="num">
		<input type="hidden" class="lat" name="lat" value="${ dbLat[num.index] }">
		<input type="hidden" class="lng" name="lng" value="${ dbLng[num.index] }">
	</c:forEach>
	

</body>
</html>