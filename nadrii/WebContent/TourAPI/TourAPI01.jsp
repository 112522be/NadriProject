<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
	
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

	var xhr = new XMLHttpRequest();
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'TXwTxp6UgYcwVcjkfbd9ADOmCH5gqN3dBN1uTJxIhpQ8yIKcZ9eQQzWkMrrFR2%2FsJoZAOrPvydYKOeK8G1VtQw%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10); /*�� ������ ��� ��*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1); /*���� ������ ��ȣ*/
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC); /*IOS(������),AND(�ȵ���̵�),WIN(��������),ETC*/
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest); /*���񽺸�=���ø�*/
	queryParams += '&' + encodeURIComponent('contentId') + '=' + encodeURIComponent('126508); /*������ ID*/
	queryParams += '&' + encodeURIComponent('contentTypeId') + '=' + encodeURIComponent('); /*����Ÿ��(������, ���� ��) ID*/
	queryParams += '&' + encodeURIComponent('defaultYN') + '=' + encodeURIComponent('); /*�⺻���� ��ȸ����*/
	queryParams += '&' + encodeURIComponent('firstImageYN') + '=' + encodeURIComponent('Y); /*����, ����� ��ǥ�̹��� ��ȸ����*/
	queryParams += '&' + encodeURIComponent('areacodeYN') + '=' + encodeURIComponent('Y); /*�����ڵ�, �ñ����ڵ� ��ȸ����*/
	queryParams += '&' + encodeURIComponent('catcodeYN') + '=' + encodeURIComponent('Y); /*���񽺺з��ڵ�(��,��,�� �ڵ�) ��ȸ����*/
	queryParams += '&' + encodeURIComponent('addrinfoYN') + '=' + encodeURIComponent('Y); /*�ּ�, ���ּ� ��ȸ����*/
	queryParams += '&' + encodeURIComponent('mapinfoYN') + '=' + encodeURIComponent('Y); /*��ǥ X,Y ��ȸ����*/
	queryParams += '&' + encodeURIComponent('overviewYN') + '=' + encodeURIComponent('Y); /*������ ���� ��ȸ����*/
	queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json);
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders())+' Body: '+this.responseText);
	    }
	};

	xhr.send('');
	
	
	</script>
		
		<title>Insert title here</title>
	</head>


	<body>
	
	${resultMsg}
	
		
	</body>
</html>