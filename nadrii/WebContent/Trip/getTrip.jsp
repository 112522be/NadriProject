<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
$(function() {
  $('#dialog').dialog({
	//draggable: false,
    autoOpen: false,
    resizable: false,
    //크기 조절
    width: 800,
  });
  $('#button_open_dialog').click( function(){
    $('#dialog').dialog('open');
  });
});


</script>
  
</head>
<body>
  
<button id='button_open_dialog'>대화상자 열기</button>
 
<div id="dialog" title="기본 대화상자">
  <img src="C:\Users\user\Desktop\gerjeMuseum.jpg"/>
  <p>여행지 이름</p>
  <p>주소</p>
  <div id="map" style="width:100%;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
  <script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
  
	var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

	//마커를 생성합니다
	var marker = new daum.maps.Marker({
	   position: markerPosition
	});
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
  </script>
  
  
</div>

 
</body>
</html>