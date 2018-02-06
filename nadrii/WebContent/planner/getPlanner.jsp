<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="../resources/css/keywordSearch.css?version=1"
	rel="stylesheet">
</head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3"></script>
	<script>
		
		/*******************Array insert 사용**********************/
		Array.prototype.insert = function ( index, item ) {
	    		this.splice( index, 0, item );
		};
		/*********************절대 지우지 말것************************/
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(37.50187873437067, 127), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
		    };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		
		//startMarker 생성 및 지도에 선언
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		markerSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		markerOption = { 
							    offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
							};
							
		var startImage = new daum.maps.MarkerImage(startSrc, markerSize, markerOption);
		var startPosition = new daum.maps.LatLng(${lat[0]},${lng[0]});	
		
		var startMarker = new daum.maps.Marker({
			position: startPosition,
			image: startImage
		});
		startMarker.setMap(map);
		
		
		
		//passMarker 생성 및 지도에 선언
		var passSrc = [];
		var passImage = [];
		var passPosition = [];
		var passMarker = [];
		
		//출발 도착지를 뺀 남은 갯수가 패스카운트
		var passCount = ${latLength}-2
		
		for(i=1; i<6; i++){
			
			passSrc[i] = 'http://t1.daumcdn.net/localimg/localimages/07/2013/img/green_b_'+i+'.png';
			passImage[i] = new daum.maps.MarkerImage(passSrc[i], markerSize, markerOption);
			passPosition[i] = new daum.maps.LatLng(37.50187873437067,127);	
			
			passMarker[i] = new daum.maps.Marker({
				
				position: passPosition[i],
				image: passImage[i]
			});
		}
	
		for(var i=1; i<=passCount; i++){
			passPosition[i] = new daum.maps.LatLng(${lat[i+1]}, ${lng[i+1]});	
				
			passMarker[i] = new daum.maps.Marker({

				position: passPosition[i],
				image: passImage[i]
			});
			
		}
	
		passMarker[1].setMap(map);
		
		
		
		//endMarker 생성 및 지도에 선언
		var endSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png'; // 도착 마커이미지의 주소입니다    

		var endImage = new daum.maps.MarkerImage(endSrc, markerSize, markerOption);
		var endPosition = new daum.maps.LatLng(${lat[latLength-1]}, ${lng[latLength-1]});	
		
		var endMarker = new daum.maps.Marker({
			position: endPosition,
			image: endImage
		});
		endMarker.setMap(map);
		
		
		//경로가 다 보이게 화면이동
		var zoomMove=[startMarker.getPosition(), passMarker[1].getPosition(),endMarker.getPosition()];
		
		var bounds = new daum.maps.LatLngBounds();
		
		for(var i=0; i<zoomMove.length; i++){
			bounds.extend(zoomMove[i]);				
		}		
		map.setBounds(bounds);
		//경로 줌이동 화면이동 완료
		
		
		
		
		///////////////////////////////////////////////////
		
		
		var iwArray=[];
		var arrayStart =[];
		var arrayEnd = [];
		
		function getInfo(k){
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
					
					var pathStartInfowindow=[];
					var pathEndInfowindow=[];
					
					var pathStartSTN=[];
					var pathEndSTN=[];
										
					var code = returnData.code;
					
					if(code != null){
						
						if(code == 500){
							swal({
								text: "서버 내부 오류",
								icon: "warning"
							});
						}else if(code == -98){
							swal({
								text: "출, 도착지가 700m이내입니다.",
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
							
							if(i==0){
								
								if(returnData.subPathList[i+1].trafficType == 1){
									traffic = '역까지 도보 ';
								}else{
									traffic = '정류장까지 도보 ';
								}
							
								iwContent = returnData.subPathList[i].sectionTime+'분 '+returnData.subPathList[i].distance+'m<br/><br/></div>';
								
								if(k==0){
									var startInfowindow = new daum.maps.InfoWindow({
									    position : startMarker.getPosition(), 
									    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
									});
									iwArray[0]=startInfowindow;
									
									$("#roadStartContent").append('<strong>출발</strong><div>'+iwArray[0].getContent().replace('</br>')+'</div>');
								}
								if(k==1){
									var pass1Infowindow = new daum.maps.InfoWindow({
									    position : passMarker[1].getPosition(), 
									    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
									});
									iwArray[1]=pass1Infowindow;
									
									$("#roadPass1Content").append('<strong>경유1</strong><div>'+iwArray[1].getContent().replace('</br>')+'</div>');
								}
								if(k==2){
									var pass2Infowindow = new daum.maps.InfoWindow({
									    position : passMarker[2].getPosition(), 
									    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
									});
									iwArray[2]=pass2Infowindow;
									
									$("#roadPass2Content").append('<strong>경유2</strong><div>'+iwArray[2].getContent().replace('</br>')+'</div>');
								}
								if(k==3){
									var pass3Infowindow = new daum.maps.InfoWindow({
									    position : passMarker[3].getPosition(), 
									    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
									});
									iwArray[3]=pass3Infowindow;
									$("#roadPass3Content").append('<strong>경유3</strong><div>'+iwArray[3].getContent().replace('</br>')+'</div>');
								}
								if(k==4){
									var pass4Infowindow = new daum.maps.InfoWindow({
									    position : passMarker[4].getPosition(), 
									    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
									});
									iwArray[4]=pass4Infowindow;
									$("#roadPass4Content").append('<strong>경유4</strong><div>'+iwArray[4].getContent().replace('</br>')+'</div>');
								}
								if(k==5){
									var pass5Infowindow = new daum.maps.InfoWindow({
									    position : passMarker[5].getPosition(), 
									    content : '<div style="padding:5px;">'+returnData.subPathList[1].startName+traffic+iwContent
									});
									iwArray[5]=pass5Infowindow;
									$("#roadPass5Content").append('<strong>경유5</strong><div>'+iwArray[5].getContent().replace('</br>')+'</div>');
								}			
								
								///////인포윈도우
								if(iwArray[0] != null){
									
									daum.maps.event.addListener(startMarker, 'mouseover', function() {
										iwArray[0].open(map, startMarker);
									});
									
									daum.maps.event.addListener(startMarker, 'mouseout', function() {
										iwArray[0].close();
									});
									
								}else if(iwArray[1] != null){
									
									daum.maps.event.addListener(passMarker[1], 'mouseover', function() {
										iwArray[1].open(map, passMarker[1]);
									});
									
									daum.maps.event.addListener(passMarker[1], 'mouseout', function() {
										iwArray[1].close();
									});
									
								}else if(iwArray[2] != null){
									
									daum.maps.event.addListener(passMarker[2], 'mouseover', function() {
										iwArray[2].open(map, passMarker[2]);
									});
									
									daum.maps.event.addListener(passMarker[2], 'mouseout', function() {
										iwArray[2].close();
									});

								}else if(iwArray[3] != null){
									
									daum.maps.event.addListener(passMarker[3], 'mouseover', function() {
										iwArray[3].open(map, passMarker[3]);
									});
									
									daum.maps.event.addListener(passMarker[3], 'mouseout', function() {
										iwArray[3].close();
									});
									
								}else if(iwArray[4] != null){
									
									daum.maps.event.addListener(passMarker[4], 'mouseover', function() {
										iwArray[4].open(map, passMarker[4]);
									});
									
									daum.maps.event.addListener(passMarker[4], 'mouseout', function() {
										iwArray[4].close();
									});
									
								}else if(iwArray[5] != null){
									
									daum.maps.event.addListener(passMarker[5], 'mouseover', function() {
										iwArray[5].open(map, passMarker[5]);
									});
									
									daum.maps.event.addListener(passMarker[5], 'mouseout', function() {
										iwArray[5].close();
									});
								}
								
								
							}else if(i%2==1){//도보 제외 지하철, 버스
										
								var pathStartMarker = new daum.maps.Marker({
								   // map: map,
								    position: new daum.maps.LatLng(returnData.subPathList[i].startY, returnData.subPathList[i].startX),
								    image: pathImage
								});
								
								pathStartSTN.push(pathStartMarker);
							
								var pathEndMarker = new daum.maps.Marker({
								  //  map: map,
								    position: new daum.maps.LatLng(returnData.subPathList[i].endY, returnData.subPathList[i].endX),
									image: pathImage
								});
								
								pathEndSTN.push(pathEndMarker);
																									
								var laneName;
								var stationFlag;
								
								if(returnData.subPathList[i].trafficType == 1){
									laneName = '역에서 '+returnData.laneList[Math.floor(i/2)].name+' 승차';
									stationFlag = '역';
								}else{
									laneName = '정류장에서 '+returnData.laneList[Math.floor(i/2)].busNo+'번 버스 승차';
									stationFlag = '정류장';
								}

								var pathIwArray=[];
								var startContent ='<div style="padding:5px;">'
													+returnData.subPathList[i].startName+laneName+'<br/>'
													+returnData.subPathList[i].stationCount+' 정거장 이동 후 '
													+returnData.subPathList[i].endName+stationFlag+' 하차<br/><br/>'
													+'</div>';
								
								pathIwArray[0]=startContent;
								
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
								
								pathIwArray[1]=endContent;
																
								pathStartInfowindow[Math.floor(i/2)] = new daum.maps.InfoWindow({
								    position : pathStartSTN[Math.floor(i/2)].getPosition(), 
								    content : startContent
								});
								
								pathEndInfowindow[Math.floor(i/2)] = new daum.maps.InfoWindow({
								    position : pathEndSTN[Math.floor(i/2)].getPosition(), 
								    content : endContent
								});
								
								if(k==0){
									for(var p=0; p<2;p++){
										if(pathIwArray[p].indexOf("도보 0분") == -1){
											$("#roadStartContent").append('<div>'+pathIwArray[p].replace('</br>')+'</div>');
										}
									}
								}
								if(k==1){
									for(var p=0; p<2;p++){
										if(pathIwArray[p].indexOf("도보 0분") == -1){
											$("#roadPass1Content").append('<div>'+pathIwArray[p].replace('</br>')+'</div>');
										}
									}
								}
								if(k==2){
									for(var p=0; p<2;p++){
										if(pathIwArray[p].indexOf("도보 0분") == -1){
											$("#roadPass2Content").append('<div>'+pathIwArray[p].replace('</br>')+'</div>');
										}
									}
								}
								if(k==3){
									for(var p=0; p<2;p++){
										if(pathIwArray[p].indexOf("도보 0분") == -1){
											$("#roadPass3Content").append('<div>'+pathIwArray[p].replace('</br>')+'</div>');
										}
									}
								}
								if(k==4){
									for(var p=0; p<2;p++){
										if(pathIwArray[p].indexOf("도보 0분") == -1){
											$("#roadPass4Content").append('<div>'+pathIwArray[p].replace('</br>')+'</div>');
										}
									}
								}
								if(k==5){
									for(var p=0; p<2;p++){
										if(pathIwArray[p].indexOf("도보 0분") == -1){
											$("#roadPass5Content").append('<div>'+pathIwArray[p].replace('</br>')+'</div>');
										}
									}
								}	
							}								
						}//for문
						
						arrayStart = pathStartSTN;
						arrayEnd = pathEndSTN;
					
						for( var z=0; z<arrayStart.length ; z++){
							
							console.log(":::::   "+arrayStart);
							arrayStart[z].setMap(map);
							kk.push(arrayStart[z]);
							arrayEnd[z].setMap(map);
							qq.push(arrayEnd[z]);
						}		
																
						daum.maps.event.addListener(pathStartSTN[0], 'mouseover', function() {
						    pathStartInfowindow[0].open(map, pathStartSTN[0]);
						});
						
						daum.maps.event.addListener(pathStartSTN[0], 'mouseout', function() {
						    pathStartInfowindow[0].close();
						});
						
						daum.maps.event.addListener(pathEndSTN[0], 'mouseover', function() {
						    pathEndInfowindow[0].open(map, pathEndSTN[0]);
						});
						
						daum.maps.event.addListener(pathEndSTN[0], 'mouseout', function() {
						    pathEndInfowindow[0].close();
						});
						
						if(pathStartSTN.length >= 2){
							
							daum.maps.event.addListener(pathStartSTN[1], 'mouseover', function() {
							    pathStartInfowindow[1].open(map, pathStartSTN[1]);
							});
							
							daum.maps.event.addListener(pathStartSTN[1], 'mouseout', function() {
							    pathStartInfowindow[1].close();
							});
							
							daum.maps.event.addListener(pathEndSTN[1], 'mouseover', function() {
							    pathEndInfowindow[1].open(map, pathEndSTN[1]);
							});
							
							daum.maps.event.addListener(pathEndSTN[1], 'mouseout', function() {
							    pathEndInfowindow[1].close();
							});
						}
						
						
						if(pathStartSTN.length >= 3){
							
							daum.maps.event.addListener(pathStartSTN[2], 'mouseover', function() {
							    pathStartInfowindow[2].open(map, pathStartSTN[2]);
							});
							
							daum.maps.event.addListener(pathStartSTN[2], 'mouseout', function() {
							    pathStartInfowindow[2].close();
							});
							
							daum.maps.event.addListener(pathEndSTN[2], 'mouseover', function() {
							    pathEndInfowindow[2].open(map, pathEndSTN[2]);
							});
							
							daum.maps.event.addListener(pathEndSTN[2], 'mouseout', function() {
							    pathEndInfowindow[2].close();
							});
						}
						
						if(pathStartSTN.length >= 4){
							
							daum.maps.event.addListener(pathStartSTN[3], 'mouseover', function() {
							    pathStartInfowindow[3].open(map, pathStartSTN[3]);
							});
							
							daum.maps.event.addListener(pathStartSTN[3], 'mouseout', function() {
							    pathStartInfowindow[3].close();
							});
							
							daum.maps.event.addListener(pathEndSTN[3], 'mouseover', function() {
							    pathEndInfowindow[3].open(map, pathEndSTN[3]);
							});
							
							daum.maps.event.addListener(pathEndSTN[3], 'mouseout', function() {
							    pathEndInfowindow[3].close();
							});
						}
					}//if
				}
			});
		}// getInfo 끝
		
		var kk=[];
		var qq=[];

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
						
						alert("폴리라인 success");
						
					}
				}
			});				
		} //callMapObjApiAJAX 끝
		
		function getOBJ(k, flag){
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
					
					startSTN.setZIndex(10);
					endSTN.setZIndex(10);
					
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
							                    
					realMarkerArray.insert(k+1, startSTN.getPosition());
					realMarkerArray.insert(k+2, endSTN.getPosition());
					
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
		
		////////////////////////////////////

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
			
			tempMarkerArray=[];
			realMarkerArray=[];
			
			tempMarkerArray.push(startMarker.getPosition());
			realMarkerArray.push(startMarker.getPosition());
			
			if(passMarker[1].getMap() != null){
				tempMarkerArray.push(passMarker[1].getPosition());
				realMarkerArray.push(passMarker[1].getPosition());
			}
			if(passMarker[2].getMap() != null){
				tempMarkerArray.push(passMarker[2].getPosition());
				realMarkerArray.push(passMarker[2].getPosition());
			}
			if(passMarker[3].getMap() != null){
				tempMarkerArray.push(passMarker[3].getPosition());
				realMarkerArray.push(passMarker[3].getPosition());
			}
			if(passMarker[4].getMap() != null){
				tempMarkerArray.push(passMarker[4].getPosition());
				realMarkerArray.push(passMarker[4].getPosition());
			}
			if(passMarker[5].getMap() != null){
				tempMarkerArray.push(passMarker[5].getPosition());
				realMarkerArray.push(passMarker[5].getPosition());
			}
			
			tempMarkerArray.push(endMarker.getPosition());
			realMarkerArray.push(endMarker.getPosition());
			
			for(k=0;k<tempMarkerArray.length;k++){
				if(k==0){
					first = tempMarkerArray[k];
				}else{
					first=temp;
				}
				last = tempMarkerArray[k+1];
				temp = last;
				if(k+1 == tempMarkerArray.length){
					break;
				}
							
				sx = first.getLng();
				sy = first.getLat();
				ex = last.getLng();
				ey = last.getLat();
				
				getOBJ(k, flag);
				
			}
			
			for(k=0;k<realMarkerArray.length;k++){
				if(k==0){
					first = realMarkerArray[k];
				}else{
					first=temp;
				}
				last = realMarkerArray[k+1];
				temp = last;
				if(k+1 == realMarkerArray.length){
					break;
				}
				
				sx = first.getLng();
				sy = first.getLat();
				ex = last.getLng();
				ey = last.getLat();

				getInfo(k);
				
			}//for문 끝
			
		} // search끝
		
		
		search1(1);
		///////////////////////////////////////////////////
		
		

	</script>
</body>
</html>