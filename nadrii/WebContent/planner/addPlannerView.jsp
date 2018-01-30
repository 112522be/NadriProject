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
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link href="../resources/css/keywordSearch.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
			$( "#sortable" ).sortable();
			$( "#sortable" ).disableSelection();
		});
		
		$( function() {
			
			$("#searchListSubmit").on("click", function(){
				$("#placesList").css("display","block");
			});
			
		    // run the currently selected effect
		    function runEffect() {
		    
		      // Run the effect
		      $( "#placesList" ).toggle( "blind", 300 );
		    };
		 
		    // Set effect from select menu value
		    $( "#button" ).on( "click", function() {
		      runEffect();
		    });
		  } );
		
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
	                    <button id="searchListSubmit" type="submit">검색하기</button> 
	                </form>
	                <ul id="placesList" style="display: none;"></ul>
	        		<text id="button">▼</text>
	            </div>
	            
	        </div>
	        
	        <div id="pagination"></div>
	    </div>
	    <p><em>지도를 클릭해주세요!</em></p> 
	<div id="clickLatlng"></div>
	<form name = "test" method="post">
		<input type="button" value="경로탐색" onclick="javascript:search1(1)">
		
		<input type ="button" value="시외버스" onClick="javascript:search1(1)">
		<input type ="button" value="고속버스" onClick="javascript:search1(2)">
		<input type ="button" value="기차" onClick="javascript:search1(3)">
		
		<hr/>
		
		<input type ="button" value="바운더리1" onClick="javascript:showBoundary(0)">
		<input type ="button" value="바운더리2" onClick="javascript:showBoundary(1)">
		<input type ="button" value="바운더리3" onClick="javascript:showBoundary(2)">
		<input type ="button" value="바운더리4" onClick="javascript:showBoundary(3)">
		<input type ="button" value="바운더리5" onClick="javascript:showBoundary(4)">
		
			
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
		var boundaryArray;
		
		var sx;
		var sy;
		var ex;
		var ey;
	
		function search1(flag){
			
			if(STNpolyline != null ){
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
							
				sx = first.getLng();
				sy = first.getLat();
				ex = last.getLng();
				ey = last.getLat();
				
				
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
							
							var markerSrc = '../resources/images/marker/mint.png', // 출발 마커이미지의 주소입니다    
							markerSize = new daum.maps.Size(30, 45), // 출발 마커이미지의 크기입니다 
							markerOption = { 
												    offset: new daum.maps.Point(15, 15) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
												};
												
							var markerImage = new daum.maps.MarkerImage(markerSrc, markerSize, markerOption);
							
							startSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.sy, returnData.sx),
							    image: markerImage
							});
							endSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.ey, returnData.ex),
							    image: markerImage
							});
							
							var outStartInfowindow = new daum.maps.InfoWindow({
							    map: map, 
							    position : startSTN.getPosition(), 
							    content : '<div style="padding:5px;"><span style="font-weight:bold;">'+returnData.startSTN+'</span></br>'
							    			+'예상 소요 시간 : '+returnData.time+'분</br>'
							    			+'요금 : '+returnData.payment+'원</br></div>',
							    removable : true
							});
							
							var outEndInfowindow = new daum.maps.InfoWindow({
							    map: map, 
							    position : endSTN.getPosition(), 
							    content : '<div style="padding:5px;"><span style="font-weight:bold;">'+returnData.endSTN+'</span></br></div>',
							    removable : true
							});
							
							outStartInfowindow.open(map, startSTN); 
							outEndInfowindow.open(map, endSTN); 
									                    
							rk.insert(k+1, startSTN.getPosition());
							rk.insert(k+2, endSTN.getPosition());
							
							function line2(){
								STNpolyline = new daum.maps.Polyline({
								    path: [
								    	startSTN.getPosition(), endSTN.getPosition()
								    ],
								    strokeWeight: 2,
								    strokeColor: '#FF00FF',
								    strokeOpacity: 0.8,
								    strokeStyle: 'dashed'
								});	
								
								STNpolyline.setMap(map);
								
							}
							line2();
							
						}//success
					});
				}// getOBJ 끝
				
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
				
				sx = first.getLng();
				sy = first.getLat();
				ex = last.getLng();
				ey = last.getLat();

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
								callMapObjApiAJAX(returnData.info.mapObj);

								
								var pathSize = new daum.maps.Size(18, 30), // 출발 마커이미지의 크기입니다 
									 pathOption;
								var pathImage = new daum.maps.MarkerImage('http://www.clker.com/cliparts/I/l/L/S/W/9/map-marker-hi.png', pathSize, pathOption);
								
								var iwContent;
								var traffic;
								
								
								for( var i=0; i<returnData.subPathList.length ; i++){
									
									if(i%2==0){
										
										if(returnData.subPathList[i+1].trafficType == 1){
											traffic = '역까지 도보 ';
										}else{
											traffic = '정류장까지 도보 ';
										}
									
										iwContent = returnData.subPathList[i].sectionTime+'분 '+returnData.subPathList[i].distance+'m<br/><br/></div>';
										alert("iwContent :: "+iwContent);
										
										if(i==0){
											
											var startInfowindow = new daum.maps.InfoWindow({
											    position : startMarker.getPosition(), 
											    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
											    ,removable : true
											});
																		
										} 	
										
										//startInfowindow.open(map, startMarker);
										
										/*
										daum.maps.event.addListener(startMarker, 'mouseover', function() {
											startInfowindow.open(map, startMarker);
										});
										
										daum.maps.event.addListener(startMarker, 'mouseout', function() {
											startInfowindow.close();
										});
										*/
									
									
									}else{//도보 제외 지하철, 버스
										
										var pathStartSTN = new daum.maps.Marker({
										    map: map,
										    position: new daum.maps.LatLng(returnData.subPathList[i].startY, returnData.subPathList[i].startX),
										    image: pathImage
										});
										var pathEndSTN = new daum.maps.Marker({
										    map: map,
										    position: new daum.maps.LatLng(returnData.subPathList[i].endY, returnData.subPathList[i].endX),
											image: pathImage
										});
										
										var laneName;
										var stationFlag;
										
										if(returnData.subPathList[i].trafficType == 1){
											laneName = '역에서 '+returnData.laneList[Math.floor(i/2)].name+' 승차';
											stationFlag = '역';
										}else{
											laneName = '정류장에서 '+returnData.laneList[Math.floor(i/2)].busNo+'번 버스 승차';
											stationFlag = '정류장';
										}

										var startContent ='<div style="padding:5px;">'
															+returnData.subPathList[i].startName+laneName+'<br/>'
															+returnData.subPathList[i].stationCount+' 정거장 이동 후 '
															+returnData.subPathList[i].endName+stationFlag+' 하차<br/><br/>'
															+'</div>';
															
										var endInfo;
										if(i+2 != returnData.subPathList.length){
											if(returnData.laneList[Math.floor(i/2)+1].busNo != null){
												endInfo = returnData.subPathList[i+2].startName+'정류장';
											}else{
												endInfo = returnData.subPathList[i+2].startName+'역';
											}										
										}else{
											endInfo = '도착지';
										}
										
										var endContent ='<div style="padding:5px;"> '+endInfo+'까지 도보 '
															+returnData.subPathList[i+1].sectionTime+'분 '+returnData.subPathList[i+1].distance+'m<br/><br/></div>';
															
										var pathStartInfowindow = new daum.maps.InfoWindow({
										    position : pathStartSTN.getPosition(), 
										    content : startContent
										    ,removable : true
										});
										
										var pathEndInfowindow = new daum.maps.InfoWindow({
										    position : pathEndSTN.getPosition(), 
										    content : endContent
										    ,removable : true
										    
										});
									
										/*
										pathStartInfowindow.open(map, pathStartSTN);
										pathEndInfowindow.open(map, pathEndSTN);
										*/
										
										/*
										daum.maps.event.addListener(pathStartSTN, 'mouseover', function() {
										    pathStartInfowindow.open(map, pathStartSTN);
										});
										
										daum.maps.event.addListener(pathStartSTN, 'mouseout', function() {
										    pathStartInfowindow.close();
										});
										
										daum.maps.event.addListener(pathEndSTN, 'mouseover', function() {
											pathEndInfowindow.open(map, pathEndSTN);
										});
										
										daum.maps.event.addListener(pathEndSTN, 'mouseout', function() {
											pathEndInfowindow.close();
										});		
										*/
										
									}
									
								}//for문
								
							}
						}
					});
				}// getInfo 끝
				
				getInfo();
				
			//	markerInfoWindow();
				
			}//for문 끝
			
			function callMapObjApiAJAX(mabObj){
								
				/****************폴리라인배열 선언 및 초기화****************/
				polylineArray = [];
				boundaryArray = [];

				for(var i=0; i<polylineArray.length; i++){
					polylineArray[i]=null;
				}
				
		//		for(var i=0; i<boundaryArray.length; i++){
		//			boundaryArray[i]=null;
		//		}
							
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
							
							boundary = new daum.maps.LatLngBounds(
								                new daum.maps.LatLng(returnData.boundary.top, returnData.boundary.left),
								                new daum.maps.LatLng(returnData.boundary.bottom, returnData.boundary.right)
								          	);
							
							boundaryArray.push(boundary);
							
							alert("boundaryArray.length : "+boundaryArray.length);
							alert("boundaryArray : "+boundaryArray);
							
							alert("폴리라인 success");
							
						}
					}
				});				
			} //callMapObjApiAJAX 끝
			
		} // search끝

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
		
		function showBoundary(i){
			console.log("boundaryArray["+i+"] 보여주는중");
			map.setBounds(boundaryArray[i]);
		}
	</script>
</body>		