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
	
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link href="../resources/css/keywordSearch.css" rel="stylesheet">
	<style>
		#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
		#sortable li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; height: 1.5em; }
		html>body #sortable li { height: 1.5em; line-height: 1.2em; }
		-state-highlight { height: 1.5em; line-height: 1.2em; }
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
</head>
<body>

<div class = "container-fulid">

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
		
		<ul id="sortable" class="pointer">
			
		</ul>
			
		<hr>
			
		<textarea class="form-control" rows="27" cols="blue"></textarea>
		
	</div>
	
	
</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>

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
		
		
		
		
		/*****************************************맵관련부분*******************************************/
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(37.50187873437067, 127), // 지도의 중심좌표
		    level: 10 // 지도의 확대 레벨
		};
		
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var marker = new daum.maps.Marker({ 
			
		    position: map.getCenter() 
		
		}); 
		
		var latlng = marker.getPosition();
		
		var infowindow = new daum.maps.InfoWindow({
				
				position : new daum.maps.LatLng(latlng.getLat(),latlng.getLng()),
				content :  '<div style="padding:5px;"><a href="#" id="start" onclick="javascript:start()">출발지</a><br>'
					+'<a href="#" id="pass" onclick="javascript:pass()">경유지</a><br>'+'<a href="#" id="end" onclick="javascript:end()">도착지</a></div>'
			});	
			
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
			startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
			startOption = { 
							    offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
							};
							
		var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);
		var startPosition = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());	
		
		var startMarker = new daum.maps.Marker({
			
			position: startPosition,
			image: startImage
		});
		
		var passSrc = [];
		var passImage = [];
		var passPosition = [];
		var passMarker = [];
		
		var	 passSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		passOption = { 
						    offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
						};
						
		for(i=1; i<6; i++){
			
			passSrc[i] = 'http://t1.daumcdn.net/localimg/localimages/07/2013/img/green_b_'+i+'.png';
			passImage[i] = new daum.maps.MarkerImage(passSrc[i], passSize, passOption);
			passPosition[i] = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());	
			
			passMarker[i] = new daum.maps.Marker({
				
				position: passPosition[i],
				image: passImage[i]
			});
		}
		
		var endSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 출발 마커이미지의 주소입니다    
		endSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		endOption = { 
						    offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
						};
						
		var endImage = new daum.maps.MarkerImage(endSrc, endSize, endOption);
		var endPosition = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());	
		
		var endMarker = new daum.maps.Marker({
		
			position: endPosition,
			image: endImage
		});
		
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
			// 지도에 마커를 표시합니다
			marker.setMap(map);
		    // 지도에 인포윈도우를 표시합니다.
			infowindow.setMap(map);
			
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다' ;
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		 	// 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    infowindow.open(map,marker);
			
		});
		
		function start(){
		
			var latlng = marker.getPosition();
			sort[0] = latlng;
			
			infowindow.close();
			marker.setMap(null);
			
			startMarker.setPosition(sort[0]);
			startMarker.setMap(map);
			
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
		}
		
		
		function pass(){
		
			var latlng = marker.getPosition();
			
			infowindow.close();
			marker.setMap(null);
				
			if(passMarker[1].getMap() == null){
				sort[1] = latlng;
				
				passMarker[1].setPosition(sort[1]);
				passMarker[1].setMap(map);
				
				if($(".pointer").length > 0){
					$(".pointer").empty();
				}
				for(var i=0;i<sort.length;i++){

					if(sort[i] ==null){

					}else{
						$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+i+'">'+i+'</li>');
					}
				}
				
			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() == null){
				sort[2] = latlng;
				
				passMarker[2].setPosition(sort[2]);
				passMarker[2].setMap(map);
				
				if($(".pointer").length > 0){
					$(".pointer").empty();
				}
				for(var i=0;i<sort.length;i++){

					if(sort[i] ==null){

					}else{
						$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
					}
				}
					
			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() != null && passMarker[3].getMap() == null){
				sort[3] = latlng;
				passMarker[3].setPosition(sort[3]);
				passMarker[3].setMap(map);
				
				if($(".pointer").length > 0){
					$(".pointer").empty();
				}
				for(var i=0;i<sort.length;i++){

					if(sort[i] ==null){

					}else{
						$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
					}
				}
				
			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() != null && passMarker[3].getMap() != null && passMarker[4].getMap() == null){
				sort[4] = latlng;
				
				passMarker[4].setPosition(sort[4]);
				passMarker[4].setMap(map);
				
				if($(".pointer").length > 0){
					$(".pointer").empty();
				}
				for(var i=0;i<sort.length;i++){

					if(sort[i] ==null){

					}else{
						$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
					}
				}
				
			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() != null && passMarker[3].getMap() != null && passMarker[4].getMap() != null && passMarker[5].getMap() == null){
				sort[5] = latlng;
				
				passMarker[5].setPosition(sort[5]);
				passMarker[5].setMap(map);
				
				if($(".pointer").length > 0){
					$(".pointer").empty();
				}
				for(var i=0;i<sort.length;i++){

					if(sort[i] ==null){

					}else{
						$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
					}
				}
				
			}		
		}
		
		function end(){
		
			var latlng = marker.getPosition();
			sort[6] = latlng;

			infowindow.close();
			marker.setMap(null);
					
			endMarker.setPosition(sort[6]);
			endMarker.setMap(map);
			
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
		}
		
		///////////////////////////////////////////////경유마커 클릭시 지우기//////////////////////////////////////////////////
		
		daum.maps.event.addListener(passMarker[1], 'click', function() {
        
			passMarker[1].setMap(null);
			sort[1] = null;
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
      	});
      	daum.maps.event.addListener(passMarker[2], 'click', function() {
         
			passMarker[2].setMap(null);
			sort[2] = null;
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
     	 });
      	daum.maps.event.addListener(passMarker[3], 'click', function() {
         
			passMarker[3].setMap(null);
			sort[3] = null;
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
     	 });
      	daum.maps.event.addListener(passMarker[4], 'click', function() {
         
			passMarker[4].setMap(null);
			sort[4] = null;
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
      	});
		daum.maps.event.addListener(passMarker[5], 'click', function() {
        
			passMarker[5].setMap(null);
			sort[5] = null;
			if($(".pointer").length > 0){
				$(".pointer").empty();
			}
			for(var i=0;i<sort.length;i++){

				if(sort[i] ==null){

				}else{
					$(".pointer").append('<li class="ui-state-default" id="'+i+'" value="'+sort[i]+'">'+i+'</li>');
				}
			}
			
		});
		
		
		
		/*****************************************맵관련부분*******************************************/
		var sort =[];	//sortable 배열선언
		var markerSort;
		
		$( function() {
			$( "#sortable" ).sortable({
				placeholder: "ui-state-highlight"
			});
			$( "#sortable" ).disableSelection();
		} );	
		
		/* $("#sortable").on("sortstop",function(event, ui){
			markerSort =[];
			markerSort = sort;
			var k=1; //.pointer의 자식값의 변화를 위한 초기화값
			for(var i=0; i<7; i++){
				if(markerSort[i] != null){
					markerSort[i]=$($(".pointer :nth-child("+k+")")[0]).attr("value");
					k++;
				}
			} 
			console.log(markerSort);
		}) */
		
		
		
		$( "#sortable" ).on( "sortupdate", function( event, ui ) {
			
			if(startMarker.getMap() != null){
				startMarker.setMap(null);
			}
			if(passMarker[1].getMap() != null){
				passMarker[1].setMap(null);
			}
			if(passMarker[2].getMap() != null){
				passMarker[2].setMap(null);
			}
			if(passMarker[3].getMap() != null){
				passMarker[3].setMap(null);
			}
			if(passMarker[4].getMap() != null){
				passMarker[4].setMap(null);
			}
			if(passMarker[5].getMap() != null){
				passMarker[5].setMap(null);
			}
			if(endMarker.getMap() != null){
				endMarker.setMap(null);
			}
			
			markerSort =[];
			markerSort = sort;
			console.log(markerSort);
			
			console.log( $($(".pointer :nth-child(1)")[0]).attr("value") );
			console.log( $($(".pointer :nth-child(1)")[0]).attr("id"));
			
			var k=1; //.pointer의 자식값의 변화를 위한 초기화값
			for(var i=0; i<7; i++){
				if(markerSort[i] != null){
					markerSort[i]=$($(".pointer :nth-child("+k+")")[0]).attr("value");
					k++;
				}
			} 
			sort = markerSort;
			console.log(sort);
			
			
			/*******데이터 타입이 달라서 맵에 넣을수가 없어서 전달 받은 value값을 파싱하여 latlng 데이터 타입으로 변환하여 마커 위치 재생성********/
			
			if(sort[0] != null){
				var parseStartPoint = sort[0].replace("(","");
				parseStartPoint = parseStartPoint.replace(")","");
				parseStartPoint = parseStartPoint.split(',');
				
				sort[0] = new daum.maps.LatLng(parseStartPoint[0], parseStartPoint[1]);
				
				startMarker.setPosition(sort[0]);
				startMarker.setMap(map);
			}
			
			
			
			if(sort[1] != null){
				var parsePassPoint1 = sort[1].replace("(","");
				parsePassPoint1 = parsePassPoint1.replace(")","");
				parsePassPoint1 = parsePassPoint1.split(',');
				
				sort[1] = new daum.maps.LatLng(parsePassPoint1[0], parsePassPoint1[1]);
				
				passMarker[1].setPosition(sort[1]);
				passMarker[1].setMap(map);
			}
			
			
			if(sort[2] != null){
				var parsePassPoint2 = sort[2].replace("(","");
				parsePassPoint2 = parsePassPoint2.replace(")","");
				parsePassPoint2 = parsePassPoint2.split(',');
				
				sort[2] = new daum.maps.LatLng(parsePassPoint2[0], parsePassPoint2[1]);

				passMarker[2].setPosition(sort[2]);
				passMarker[2].setMap(map);
			}
			
			
			if(sort[3] != null){
				var parsePassPoint3 = sort[3].replace("(","");
				parsePassPoint3 = parsePassPoint3.replace(")","");
				parsePassPoint3 = parsePassPoint3.split(',');
				
				sort[3] = new daum.maps.LatLng(parsePassPoint3[0], parsePassPoint3[1]);
				
				passMarker[3].setPosition(sort[3]);
				passMarker[3].setMap(map);
			}
			
			
			
			if(sort[4] != null){
				var parsePassPoint4 = sort[4].replace("(","");
				parsePassPoint4 = parsePassPoint4.replace(")","");
				parsePassPoint4 = parsePassPoint4.split(',');
				
				sort[4] = new daum.maps.LatLng(parsePassPoint4[0], parsePassPoint4[1]);
				
				passMarker[4].setPosition(sort[4]);
				passMarker[4].setMap(map);
			}
			
		
			if(sort[5] != null){
				var parsePassPoint5 = sort[5].replace("(","");
				parsePassPoint5 = parsePassPoint5.replace(")","");
				parsePassPoint5 = parsePassPoint5.split(',');
				
				sort[5] = new daum.maps.LatLng(parsePassPoint5[0], parsePassPoint5[1]);
				
				passMarker[5].setPosition(sort[5]);
				passMarker[5].setMap(map);
			}
			
			
			if(sort[6] != null){
				var parseEndPoint = sort[6].replace("(","");
				parseEndPoint = parseEndPoint.replace(")","");
				parseEndPoint = parseEndPoint.split(',');
				
				sort[6] = new daum.maps.LatLng(parseEndPoint[0], parseEndPoint[1]);
				
				endMarker.setPosition(sort[6]);
				endMarker.setMap(map);
			}
			
		} );
		
		
		

		
	</script>
</body>		