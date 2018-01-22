<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:100%;height:600px;"></div>
	<p><em>지도를 클릭해주세요!</em></p> 
	<div id="clickLatlng"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> 
	<script type="text/javascript">
	
		/*******************Array insert 사용**********************/
		Array.prototype.insert = function ( index, item ) {
	    		this.splice( index, 0, item );
		};
		
		/********************************************************/	
	
	
	
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
			
			infowindow.close();
			marker.setMap(null);
					
			startMarker.setPosition(latlng);
			startMarker.setMap(map);
			
		}
		
		
		function pass(){
		
			var latlng = marker.getPosition();
			
			infowindow.close();
			marker.setMap(null);
				
			if(passMarker[1].getMap() == null){
				
				passMarker[1].setPosition(latlng);
				passMarker[1].setMap(map);

			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() == null){
				
				passMarker[2].setPosition(latlng);
				passMarker[2].setMap(map);

			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() != null && passMarker[3].getMap() == null){
				
				passMarker[3].setPosition(latlng);
				passMarker[3].setMap(map);

			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() != null && passMarker[3].getMap() != null && passMarker[4].getMap() == null){
				
				passMarker[4].setPosition(latlng);
				passMarker[4].setMap(map);
				
			}else if(passMarker[1].getMap() != null && passMarker[2].getMap() != null && passMarker[3].getMap() != null && passMarker[4].getMap() != null && passMarker[5].getMap() == null){
				
				passMarker[5].setPosition(latlng);
				passMarker[5].setMap(map);
		
			}		
		}
		
		function end(){
		
			var latlng = marker.getPosition();
			
			infowindow.close();
			marker.setMap(null);
					
			endMarker.setPosition(latlng);
			endMarker.setMap(map);
			
			
		}
		
		////////////////////////////////////////////////////////
		
		daum.maps.event.addListener(passMarker[1], 'click', function() {
        
			passMarker[1].setMap(null);
      	});
      	daum.maps.event.addListener(passMarker[2], 'click', function() {
         
			passMarker[2].setMap(null);
     	 });
      	daum.maps.event.addListener(passMarker[3], 'click', function() {
         
			passMarker[3].setMap(null);
     	 });
      	daum.maps.event.addListener(passMarker[4], 'click', function() {
         
			passMarker[4].setMap(null);
      	});
		daum.maps.event.addListener(passMarker[5], 'click', function() {
        
			passMarker[5].setMap(null);
		});
		
		
		////////////////////////////////////////////////////////
		
		var startSTN;
		var endSTN;
		var STNpolyline;
		
		
		var kk ;		//절대 지우지 말것 폴리라인 담는 배열 변수 선언!!
		
		var ak;		//임시 배열
		var rk;		//진짜 배열
		
		var first;
		var last;
		
		var k;
		
		
		var temp;
		var xhr = new XMLHttpRequest();
		
		function rrr(){
					
			if(kk != null){
				kkk();
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
				search2();
				
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

				alert("rk :::"+rk);
				roadSearch();
					
			}
					
		}
		
		
		var startLatlng;
		var endLatlng;
		
		function search2(){
				
			var sx = first.getLng();
			var sy = first.getLat();
			var ex = last.getLng();
			var ey = last.getLat();
			
			function search() {
			
				//ODsay apiKey 입력
				var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey=0ObaGjz7q8kLrzbsVutNT0qpRKpduNy7cnS9HDogmsk";
				xhr.open("GET", url, false);
				
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
						
						if( JSON.parse(xhr.responseText)["result"]["path"] == null ){
							alert("시외");	
							
							var sx = JSON.parse(xhr.responseText)["result"]["outBusRequest"]["OBJ"][0].SX;
							var sy = JSON.parse(xhr.responseText)["result"]["outBusRequest"]["OBJ"][0].SY;
							var ex = JSON.parse(xhr.responseText)["result"]["outBusRequest"]["OBJ"][0].EX;
							var ey = JSON.parse(xhr.responseText)["result"]["outBusRequest"]["OBJ"][0].EY;
							
							startSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(sy, sx)
							});
							endSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(ey, ex)
							});
							
							startLatlng = new daum.maps.LatLng(sy, sx);
							endLatlng = new daum.maps.LatLng(ey, ex);
							
							rk.insert(k+1, startLatlng);
							rk.insert(k+2, endLatlng);
							
							console.log("출발터미널::"+startLatlng);
							console.log("도착터미널::"+endLatlng);
						
							alert("ak :: "+ ak); 
							
							function line2(){
								
								STNpolyline = new daum.maps.Polyline({
								    path: [
								       startLatlng, endLatlng
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
					}
				}
				
				xhr.send();
			}
			search();
			
		}

		function roadSearch(){
			kk=[];		//폴리라인 담는 배열 선언!!
			
			for(var t=0; t<kk.length;t++){
				kk[t]=null;
			}
			
			var sx = first.getLng();
			var sy = first.getLat();
			var ex = last.getLng();
			var ey = last.getLat();
			
			function searchPubTransPathAJAX() {
				var xhr = new XMLHttpRequest();
				//ODsay apiKey 입력
				var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey=0ObaGjz7q8kLrzbsVutNT0qpRKpduNy7cnS9HDogmsk";
				xhr.open("GET", url, false);
				
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
						//노선그래픽 데이터 호출
						callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
					}
				}
				xhr.send();
			}
			
			//길찾기 API 호출
			searchPubTransPathAJAX();
	
			function callMapObjApiAJAX(mabObj){
				var xhr = new XMLHttpRequest();
				//ODsay apiKey 입력
				var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey=0ObaGjz7q8kLrzbsVutNT0qpRKpduNy7cnS9HDogmsk";
				xhr.open("GET", url, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var resultJsonData = JSON.parse(xhr.responseText);
						daumPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
						// boundary 데이터가 있을경우, 해당 boundary로 지도이동
						if(resultJsonData.result.boundary){
								var boundary = new daum.maps.LatLngBounds(
						                new daum.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
						                new daum.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
						        );
								
						}
					}
				}
			}
			
			// 지도위 마커 표시해주는 함수
			function drawDaumMarker(x,y){
				var marker = new daum.maps.Marker({
				    position: new daum.maps.LatLng(y, x),
				    map: map
				});
			}
			
			// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
			function daumPolyLine(data){
	
				for(var i = 0 ; i < data.result.lane.length; i++){
					for(var j=0 ; j <data.result.lane[i].section.length; j++){
						lineArray = null;
						lineArray = new Array();
						for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
							lineArray.push(new daum.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
						}
							
						
					//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)

						polyline = new daum.maps.Polyline({
							    
							path: lineArray,
						    strokeWeight: 3
						});
					
						kk.push(polyline);
				
					
						if(polyline.getMap() == null){
							for(var q=0;q<kk.length;q++){
								
								kk[q].setMap(map);
							}
						}
					}
				}
				
			}
			
			
			
		}
		

		function kkk(){
			
			for(var q = 0; q<kk.length; q++){
				kk[q].setMap(null);	
				
			};
		
			startSTN.setMap(null);
			endSTN.setMap(null);
			STNpolyline.setMap(null);
			
		}
		
		function bb(){
			
			alert("rk @@ "+rk);
			
			jQuery.ajaxSettings.traditional = true;

			$.ajax( 
					{
						url : "/planner/json/addPlanner/"+rk ,
						type : "POST" ,
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : status
				});
			
		}
		
	</script>
	
	<input type="button" value="경로탐색" onclick="javascript:rrr()">
	<input type="button" value="경로삭제" onclick="javascript:kkk()">
	<input type="button" value="좌표배열보기" onclick="javascript:bb()">
	
</body>
</html>