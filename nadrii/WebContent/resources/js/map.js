
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
		
		