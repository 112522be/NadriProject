<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		$(function(){
			$("#save").on("click",function(){
				save();
				$("input[name='lat']").val(lat);
				$("input[name='lng']").val(lng);
				
				$("form[name='addPlanner']").attr("method", "POST").attr("action", "/planner/addPlanner").submit();
				
			})
		})
	</script>




</head>
<body>
<div class="container-fulid">

				<div class="row">
	<div class="col-md-9">

		<div class="map_wrap">

			<div id="map"
				style="width: 100%; height: 750px; position: relative; overflow: hidden;"></div>

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
			<form name="test" method="post">
				<input type="button" value="경로탐색" onclick="javascript:search1(1)">
				<input type="button" value="시외버스" onClick="javascript:search1(1)">
				<input type="button" value="고속버스" onClick="javascript:search1(2)">
				<input type="button" value="기차" onClick="javascript:search1(3)">
			</form>
		</div>
	</div>
	<form name="addPlanner">
		<div class="col-md-3" >
			<div class="container-fulid" style="overflow-y:auto">

				<div class="row">
					<div class="col-md-12">
						플래너 제목 : <input type="text" name="title" value="" />
						<hr>
					</div>
					<div class="col-md-2" id="subPointer"></div>

					<div class="col-md-10">
						<ul id="sortable" class="pointer">

						</ul>
					</div>


					<div id="roadContent" class="col-md-12">
						<hr>
						<div id="roadStartContent"></div>
						<div id="roadPass1Content"></div>
						<div id="roadPass2Content"></div>
						<div id="roadPass3Content"></div>
						<div id="roadPass4Content"></div>
						<div id="roadPass5Content"></div>
						<hr>
					</div>


					<div class="col-md-12">
						<textarea class="form-control" rows="27" cols="blue"></textarea>
					</div>
					<input type="hidden" name="lat" value=""> <input
						type="hidden" name="lng" value="">
				</div>
			</div>
		</div>
	</form>
</div></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>

	<script language="JavaScript"
		src="../resources/js/map.js?version=180202.4250"></script>


</body>