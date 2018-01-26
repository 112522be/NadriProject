<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<title>Insert title here</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link href="../resources/css/keywordSearch.css" rel="stylesheet">
	<style>
	  	#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
		#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
		#sortable li span { position: absolute; margin-left: -1.3em; }
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
			$( "#sortable" ).sortable();
			$( "#sortable" ).disableSelection();
		});
	</script>
	
</head>
<body>

<div class = "container-fulid">
<!-- 
	<div class="row">
		<div class = "col-lg-11"></div>
		<div class = "col-lg-1">
			<input type = "button" value ="저장">
		</div>
		<div class = "col-lg-8" id="map" style="width:65%;height:750px;"></div>
		<div class = "col-lg-4">
		
			<ul id="sortable">
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
			</ul>
			
			<hr>
			
			<textarea class="form-control" rows="27" cols="blue"></textarea>
		
		</div>
	</div>
 -->
<div class="row">
		<div class = "col-lg-11"></div>
		<div class = "col-lg-1">
			<input type = "button" value ="저장">
		</div>
		
		<div class = "col-lg-8">
		 
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:750px;position:relative;overflow:hidden;"></div>
	
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" value="" id="keyword" size="15"> 
	                    <button type="submit">검색하기</button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	    <p><em>지도를 클릭해주세요!</em></p> 
	<div id="clickLatlng"></div>
	<form name = "test" method="post">
		<input type="button" value="경로탐색" onclick="javascript:search1(1)">
		
		<input type ="button" value="시외버스" onClick="javascript:search1(1)">
		<input type ="button" value="고속버스" onClick="javascript:search1(2)">
		<input type ="button" value="기차" onClick="javascript:search1(3)">
			
	</form>
	</div>
	</div>
	
	
	<div class = "col-lg-4">
		
			<ul id="sortable">
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
			</ul>
			
			<hr>
			
			<textarea class="form-control" rows="27" cols="blue"></textarea>
		
		</div>
	
	
</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>
<script language="JavaScript" src="../resources/js/map.js"></script>
	<script type="text/javascript">
	
		/*******************Array insert 사용**********************/
		Array.prototype.insert = function ( index, item ) {
	    		this.splice( index, 0, item );
		};
		
		/********************************************************/	

		var polyline;
		var STNpolyline;
		var startSTN;
		var endSTN;
		var polylineArray;


		function search1(flag){
			
			if(STNpolyline != null){
				deleteExSearch();
			}
			if(STNpolyline != null || polylineArray != null){
				deleteInSearch();
			}

			ak=[];
			rk=[];
			
			ak.push(startMarker.getPosition());
			rk.push(startMarker.getPosition());
			if(passMarker[1].getMap() != null){
				ak.push(passMarker[1].getPosition());
				rk.push(passMarker[1].getPosition());
			}
			if(passMarker[2].getMap() != null){
				ak.push(passMarker[2].getPosition());
				rk.push(passMarker[2].getPosition());
			}
			if(passMarker[3].getMap() != null){
				ak.push(passMarker[3].getPosition());
				rk.push(passMarker[3].getPosition());
			}
			if(passMarker[4].getMap() != null){
				ak.push(passMarker[4].getPosition());
				rk.push(passMarker[4].getPosition());
			}
			if(passMarker[5].getMap() != null){
				ak.push(passMarker[5].getPosition());
				rk.push(passMarker[5].getPosition());
			}
			
			ak.push(endMarker.getPosition());
			rk.push(endMarker.getPosition());
			
			for(k=0;k<ak.length;k++){
				if(k==0){
					first = ak[k];
				}else{
					first=temp;
				}
				last = ak[k+1];
				temp = last;
				if(k+1 == ak.length){
					break;
				}
							
				var sx = first.getLng();
				var sy = first.getLat();
				var ex = last.getLng();
				var ey = last.getLat();
				
				
				function getOBJ(){
					$.ajax({
						url : "../odsay/json/getOBJ",
						method : "GET",
						dataType : "json",
						data : {"sx" : sx, "sy" : sy, "ex" : ex, "ey" : ey, "flag" : flag},
						async : false,
						headers : {
							"Accept" : "application/json",
							"Content-type" : "application/json"
						},
						success:function(returnData){
							alert("시외 success 터미널 마커 생성");
							
							startSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.sy, returnData.sx)
							});
							endSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.ey, returnData.ex)
							});
							
							var startStnPosition = new daum.maps.LatLng(returnData.sy,returnData.sx);
							var endStnPosition = new daum.maps.LatLng(returnData.ey,returnData.ex)
		                    
							rk.insert(k+1, startStnPosition);
							rk.insert(k+2, endStnPosition);
							
							function line2(){
								STNpolyline = new daum.maps.Polyline({
								    path: [
								       startStnPosition, endStnPosition
								    ],
								    strokeWeight: 2,
								    strokeColor: '#FF00FF',
								    strokeOpacity: 0.8,
								    strokeStyle: 'dashed'
								});	
								
								STNpolyline.setMap(map);
								
							}
							line2();
							
						},
						error:function(){
							alert("시내");	
						}
					});
				}
				
				getOBJ();
				
			}
			
			for(k=0;k<rk.length;k++){
				if(k==0){
					first = rk[k];
				}else{
					first=temp;
				}
				last = rk[k+1];
				temp = last;
				if(k+1 == rk.length){
					break;
				}
				
				var sx = first.getLng();
				var sy = first.getLat();
				var ex = last.getLng();
				var ey = last.getLat();

				function getInfo(){
					$.ajax({
						url : "../odsay/json/getInfo",
						method : "GET",
						dataType : "json",
						data : {"sx" : sx, "sy" : sy, "ex" : ex, "ey" : ey},
						headers : {
							"Accept" : "application/json",
							"Content-type" : "application/json"
						},
						success:function(returnData){
							
							var code = returnData.code;
							
							if(code != null){
								
								if(code == 500){
									swal({
										text: "서버 내부 오류",
										icon: "warning"
									});
								}else if(code == -98){
									swal({
										text: "필수 입력값이 누락되었습니다.",
										icon: "warning"
									});
								}else if (code == -99){
									swal({
										text: "검색 결과가 없습니다",
										icon: "warning"
									});
								}
								
							}else{
								
								alert("시내 success");
								callMapObjApiAJAX(returnData.mapObj);
							}
						}
					});
				}
				
				getInfo();
				
			}
			
			function callMapObjApiAJAX(mabObj){
				/****************폴리라인배열 선언 및 초기화****************/
				polylineArray = [];
				
				for(var i=0; i<polylineArray.length; i++){
					polylineArray[i]=null;
				}
				
				var lineArray;
				
				$.ajax({
					url : "../odsay/json/getGraph",
					method : "GET",
					dataType : "json",
					data : {"mapObj": mabObj},
					headers : {
						"Accept" : "application/json",
						"Content-type" : "application/json"
					},
					success:function(returnData){

						var error = returnData.error;
						
						if(error != null){
							
							alert("polyline을 그리던 중 "+error.message);
							
						}else{
							
							console.log( "returnData.listX[0] " + returnData.listX[0] );
							console.log( "returnData.listY[0] " + returnData.listY[0] );
							console.log( "returnData.listX.length " + returnData.listX.length );
							console.log( "returnData.listY.length " + returnData.listY.length );
					
							lineArray = null;
							lineArray = new Array();
	
							for (var k = 0; k < returnData.listY.length; k++) {
								lineArray.push(new daum.maps.LatLng(returnData.listY[k], returnData.listX[k]));
							}
	
							polyline = new daum.maps.Polyline({
								path : lineArray,
								strokeWeight : 3
							});
	
							polylineArray.push(polyline);
	
							if (polyline.getMap() == null) {
								for (var i = 0; i < polylineArray.length; i++) {
									polylineArray[i].setMap(map);
								}
							}
							
							alert("폴리라인 success");
							
						}
					}
				});

			}
		}

		function deleteExSearch() {
			if (STNpolyline.getMap() != null) {
				STNpolyline.setMap(null);
				startSTN.setMap(null);
				endSTN.setMap(null);
			}

			for (var i = 0; i < polylineArray.length; i++) {
				polylineArray[i].setMap(null);
			}
		}

		function deleteInSearch() {
			for (var i = 0; i < polylineArray.length; i++) {
				polylineArray[i].setMap(null);
			}
		}
	</script>
</body>		