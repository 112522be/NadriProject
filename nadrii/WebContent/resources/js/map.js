		var markers = [];
		var keywordMarkerPosition; //키워드 검색 마커 좌표

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(37.50187873437067, 127), // 지도의 중심좌표
		    level: 10 // 지도의 확대 레벨
		};
		
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var clickMarker = new daum.maps.Marker({ 
			
		    position: map.getCenter() 
		
		}); 
		
		var latlng = clickMarker.getPosition();
		
		var speInfoWindow = new daum.maps.InfoWindow({
				
				position : new daum.maps.LatLng(latlng.getLat(),latlng.getLng()),
				content :  '<div style="padding:5px;"><a href="#" id="start" onclick="javascript:start()">출발지</a><br>'
					+'<a href="#" id="pass" onclick="javascript:pass()">경유지</a><br>'+'<a href="#" id="end" onclick="javascript:end()">도착지</a></div>'
			});	
			
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		markerSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		markerOption = { 
							    offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
							};
							
		var startImage = new daum.maps.MarkerImage(startSrc, markerSize, markerOption);
		var startPosition = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());	
		
		var startMarker = new daum.maps.Marker({
			
			position: startPosition,
			image: startImage
		});
		
		var passSrc = [];
		var passImage = [];
		var passPosition = [];
		var passMarker = [];
		

						
		for(i=1; i<6; i++){
			
			passSrc[i] = 'http://t1.daumcdn.net/localimg/localimages/07/2013/img/green_b_'+i+'.png';
			passImage[i] = new daum.maps.MarkerImage(passSrc[i], markerSize, markerOption);
			passPosition[i] = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());	
			
			passMarker[i] = new daum.maps.Marker({
				
				position: passPosition[i],
				image: passImage[i]
			});
		}
		
		var endSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png'; // 출발 마커이미지의 주소입니다    

		var endImage = new daum.maps.MarkerImage(endSrc, markerSize, markerOption);
		var endPosition = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());	
		
		var endMarker = new daum.maps.Marker({
		
			position: endPosition,
			image: endImage
		});
		
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			infowindow.close();
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
			// 지도에 마커를 표시합니다
			clickMarker.setMap(map);
		    // 지도에 인포윈도우를 표시합니다.
			speInfoWindow.setMap(map);
			
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다' ;
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		 	// 마커 위치를 클릭한 위치로 옮깁니다
		    clickMarker.setPosition(latlng);
		    
		    speInfoWindow.open(map,clickMarker);
			
		});
		
		function start(){
			var latlng;
			if(clickMarker.getMap() != null){
				latlng = clickMarker.getPosition();
				
				speInfoWindow.close();
				infowindow.close();
				
				clickMarker.setMap(null);
				
			}else if(markers[0].getMap() != null){
				latlng = keywordMarkerPosition;
				
				infowindow.close();
				speInfoWindow.close();
				
				
			}
			
			startMarker.setPosition(latlng);
			startMarker.setMap(map);
			
		}
		
		
		function pass(){
		
			var latlng;
			
			if(clickMarker.getMap() != null){
				latlng = clickMarker.getPosition();
				
				speInfoWindow.close();
				infowindow.close();
				
				clickMarker.setMap(null);
				
			}else if(markers[0].getMap() != null){
				latlng = keywordMarkerPosition;
				
				infowindow.close();
				speInfoWindow.close();		
			}
			
			speInfoWindow.close();
			clickMarker.setMap(null);
				
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
		
			var latlng;
			
			if(clickMarker.getMap() != null){
				latlng = clickMarker.getPosition();
				
				speInfoWindow.close();
				infowindow.close();
				
				clickMarker.setMap(null);
				
			}else if(markers[0].getMap() != null){
				latlng = keywordMarkerPosition;
				
				infowindow.close();
				speInfoWindow.close();		
			}

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
		
		
		/////////////////////////////////////////////////////////////
		// 검색
		
		
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();  

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		        
		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === daum.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title, keyPosition) {
		            daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
		                displayInfowindow(marker, title, keyPosition);
		                speInfoWindow.close();
		                clickMarker.setMap(null);
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title, keyPosition);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		            
		        })(marker, places[i].place_name, placePosition);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title, keyPosition) {
		    var content = '<div style="padding:5px;"><a href="#" id="start" onclick="javascript:start()">출발지</a><br>'
				+'<a href="#" id="pass" onclick="javascript:pass()">경유지</a><br>'+'<a href="#" id="end" onclick="javascript:end()">도착지</a><br></div>'
				+'<div style="padding:5px;z-index:1;">' + title + '<br></div>';
		    keywordMarkerPosition = keyPosition;
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
		
		
		