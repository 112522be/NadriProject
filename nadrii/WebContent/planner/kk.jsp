<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>지도 이동 막기</title>
    
</head>
<body>
<a href="#"id="map" style="width:500px;height:350px;"></a><br><br><br><br><br><br>

<a href="#">ddddd</a>
<p>
<button onclick="setDraggable(false)">지도 드래그 이동 끄기</button>
<button onclick="setDraggable(true)">지도 드래그 이동 켜기</button>
</p>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c93056a5db8e378165090f1c9940ef58"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         // draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
function setDraggable() {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(false);    
}

setDraggable();

var startImage = new daum.maps.MarkerImage(startSrc, markerSize, markerOption);
var startPosition = new daum.maps.LatLng('${lat[0]}','${lng[0]}');	

var startMarker = new daum.maps.Marker({
	position: startPosition,
	image: startImage
});
startMarker.setMap(map);


//출발 도착지를 뺀 남은 갯수가 패스카운트
var passCount = ${latLength}-2

// setMap(null)처리를 위해 보이지 않는 passMarker 5개 생성
for(i=1; i<6; i++){
	
	passSrc[i] = 'http://t1.daumcdn.net/localimg/localimages/07/2013/img/green_b_'+i+'.png';
	passImage[i] = new daum.maps.MarkerImage(passSrc[i], markerSize, markerOption);
	passPosition[i] = new daum.maps.LatLng(37.50187873437067,127);	
	
	passMarker[i] = new daum.maps.Marker({
		
		position: passPosition[i],
		image: passImage[i]
	});
}



//passMarker passMarker위치를 DB에서 받은 정보 위치로 변경
for(var i=0; i<passCount; i++){
	if(i==0){
		passPosition[1] = new daum.maps.LatLng('${lat[1]}', '${lng[1]}');
		passMarker[1] = new daum.maps.Marker({

			position: passPosition[1],
			image: passImage[1]
		});				
	}else if(i==1){
		passPosition[2] = new daum.maps.LatLng('${lat[2]}', '${lng[2]}');
		passMarker[2] = new daum.maps.Marker({

			position: passPosition[2],
			image: passImage[2]
		});
	}else if(i==2){
		passPosition[3] = new daum.maps.LatLng('${lat[3]}', '${lng[3]}');
		passMarker[3] = new daum.maps.Marker({

			position: passPosition[3],
			image: passImage[3]
		});
	}else if(i==3){
		passPosition[4] = new daum.maps.LatLng('${lat[4]}', '${lng[4]}');
		passMarker[4] = new daum.maps.Marker({

			position: passPosition[4],
			image: passImage[4]
		});
	}else if(i==4){
		passPosition[5] = new daum.maps.LatLng('${lat[5]}', '${lng[5]}');
		passMarker[5] = new daum.maps.Marker({

			position: passPosition[5],
			image: passImage[5]
		});
	}
	
}

//passMarker를 지도에 출력
if(passCount == 1){
	passMarker[1].setMap(map);	
	
}
if(passCount == 2){
	passMarker[1].setMap(map);	
	passMarker[2].setMap(map);
}
if(passCount == 3){
	passMarker[1].setMap(map);	
	passMarker[2].setMap(map);
	passMarker[3].setMap(map);	
}
if(passCount == 4){
	passMarker[1].setMap(map);	
	passMarker[2].setMap(map);
	passMarker[3].setMap(map);
	passMarker[4].setMap(map);
}
if(passCount == 5){
	passMarker[1].setMap(map);	
	passMarker[2].setMap(map);
	passMarker[3].setMap(map);
	passMarker[4].setMap(map);
	passMarker[5].setMap(map);	
}


//endMarker 생성 및 지도에 선언
var endSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png'; // 도착 마커이미지의 주소입니다    

var endImage = new daum.maps.MarkerImage(endSrc, markerSize, markerOption);
var endPosition = new daum.maps.LatLng('${lat[latLength-1]}', '${lng[latLength-1]}');	

var endMarker = new daum.maps.Marker({
	position: endPosition,
	image: endImage
});
endMarker.setMap(map);





var marker = new daum.maps.Marker({
	position:markers
});

marker.setMap(map);
</script>
</body>
</html>