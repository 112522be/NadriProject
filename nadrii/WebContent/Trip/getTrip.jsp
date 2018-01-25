<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
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
    //ũ�� ����
    width: 800,
  });
  $('#button_open_dialog').click( function(){
    $('#dialog').dialog('open');
  });
});


</script>
  
</head>
<body>
  
<button id='button_open_dialog'>��ȭ���� ����</button>
 
<div id="dialog" title="�⺻ ��ȭ����">
  <img src="C:\Users\user\Desktop\gerjeMuseum.jpg"/>
  <p>������ �̸�</p>
  <p>�ּ�</p>
  <div id="map" style="width:100%;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
  <script>
	var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
	var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
	center: new daum.maps.LatLng(33.450701, 126.570667), //������ �߽���ǥ.
	level: 3 //������ ����(Ȯ��, ��� ����)
	};

	var map = new daum.maps.Map(container, options); //���� ���� �� ��ü ����
  
	var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

	//��Ŀ�� �����մϴ�
	var marker = new daum.maps.Marker({
	   position: markerPosition
	});
	
	//��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
	marker.setMap(map);
  </script>
  
  
</div>

 
</body>
</html>