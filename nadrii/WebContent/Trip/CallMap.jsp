<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:400px;height:400px;"></div>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
	  <script type="text/javascript">
		var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
		var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
				center: new daum.maps.LatLng(33.450701, 126.570667),
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
</body>
</html>