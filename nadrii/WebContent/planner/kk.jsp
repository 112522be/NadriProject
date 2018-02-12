<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>지도 이동 막기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
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

var markers = new daum.maps.LatLng(33.450701, 126.570667);dfdfefeef

var marker = new daum.maps.Marker({
	position:markers
});

marker.setMap(map);
</script>
</body>
</html>