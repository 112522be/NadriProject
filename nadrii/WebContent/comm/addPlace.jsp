<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<title>Daum ���� �����ϱ�</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<script src="http://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var content='';
		var x='';
		var y='';
		function getSearchResult(keyword, page){
				$('#result').empty();
				$.ajax({
					url : "https://dapi.kakao.com/v2/local/search/keyword.json",
					method : "GET", 
					dataType : "json", 
					data : {
						"query" : keyword,
						"page" : page,
						"size" : 4
					},
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json",
						"Authorization": "KakaoAK 4c6e53f28fe567efc82e2e871436b51a"
					},
					success : function(JSONData, status) {
						var documents = JSONData.documents;
						if(documents.length == 0){
							alert("�˻� ����� �����ϴ�."); 
							return;
						}
						for( i=0;i<documents.length;i++){
							var displayValue = "<div class=\"result\"><hr/>"+
												"<h5>"+documents[i].place_name+"</h5>"+
												"<h6>���� "+documents[i].address_name+"</h6>"+
												"<h6>���θ� "+documents[i].road_address_name+"</h6>"+
												"</div>";
							if(i==documents.length-1){
								displayValue += "<nav aria-label=\"...\">"
												+"<ul class=\"pager\">";
								var olderPage = page-1;
								var newerPage = page+1;
								if(olderPage>0){
									displayValue += "<li class=\"previous\">"
													+"<a href=\"javascript:getSearchResult(\'"+keyword+"\', "+olderPage+")\"><span aria-hidden=\"true\">&larr;</span>��������</a></li>"
								}
								if((JSONData.meta.total_count%4!=0&&newerPage<JSONData.meta.total_count/4+1) || (JSONData.meta.total_count%4 == 0 && newerPage<(JSONData.meta.total_count/4))){
									displayValue+= "<li class=\"next\"><a href=\"javascript:getSearchResult(\'"+keyword+"\', "+newerPage+")\">��������<span aria-hidden=\"true\">&rarr;</span></a></li>";
								}
								  displayValue += "</ul></nav>";
							}
							$('div#result').append(displayValue);
						}
						
						$('div.result').bind('click', function() {
							var index = $(this).index();
							x = ""+documents[index].x;
							y = ""+documents[index].y;
							map.setCenter(new daum.maps.LatLng(y, x))
							marker.setMap(null);
							marker = new daum.maps.Marker({ 
							    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
							    position: map.getCenter(),
							}); 
							marker.setClickable(false);
							marker.setMap(map);
							searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
						        if (status === daum.maps.services.Status.OK) {
						            var detailAddr = '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
						            var buildingName = !!result[0].road_address ? '<div class="buildingName"><h3>' + documents[index].place_name + '</h3></div>' : '';
						            
						            content = '<div class="bAddr">' +
						            				buildingName+
						                            detailAddr + 
						                        '</div>';

						            var resultDiv = document.getElementById('clickLatlng'); 
								    resultDiv.innerHTML = content;
						        }   
						    });
						})
					}
				})
		}
		$(function() {
			$('button.btn.btn-default:contains("�˻�")').bind('click', function() {
				var keyword = $('#keyword').val(); 
				getSearchResult(keyword, 1);
			})
		})
	</script>
</head>
<body>
	<div class="container">
		<br/>
		<div class="col-sm-5">
			<form class="navbar-form navbar-left" role="search">
				<div class="col-sm-10">
					<input id="keyword" type="text" class="form-control" placeholder="Ű���� �Է�">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-default">�˻�</button>
				</div> 
			</form>
			<hr/>
			<div id="result">
			</div>
		</div>
		<div class="col-sm-7">
			<div align="center">
			  	<div id="map" style="width:360px;height:430px;"></div>
				<div id="clickLatlng"></div>
				<div align="right">
					<br/>
					<p><button type="button" class="btn btn-primary btn-sm">�߰��ϱ�</button></p>
				</div>
			</div> 
		</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28f2a580a6a043772106fd68ca5e3561&libraries=services"></script>
	<script type="text/javascript" src="/resources/js/map_2.js"></script>
	<script>
		var geocoder = new daum.maps.services.Geocoder();
		// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            var detailAddr = '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
		            var buildingName = !!result[0].road_address ? '<div class="buildingName"><h3>' + result[0].road_address.building_name + '</h3></div>' : '';
		            
		            content = '<div class="bAddr">' +
		            				buildingName+
		                            detailAddr + 
		                        '</div>';

		            var resultDiv = document.getElementById('clickLatlng'); 
				    resultDiv.innerHTML = content;
		        }   
		    });
		});

		// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
		function displayCenterInfo(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		    }    
		}
		
		$(function() {
			$('button.btn.btn-primary.btn-sm:contains("�߰��ϱ�")').bind('click', function() {
				$('#lat', opener.document).val($('#lat', opener.document).val()+","+$("#x").val());
				$('#lng', opener.document).val($('#lng', opener.document).val()+","+$("#y").val());
				var editor = $.summernote.eventHandler.getEditor(); 
				var editable=$('#summernote');
				var html = $('<button type="button" class="btn btn-default">'+
						'<div class="col-xs-3" align="left">'+
						'<img src="../resources/images/marker/marker_uc.png" width="50px" height="80px" align="middle">'+
						'</div>'+
						'<div class="col-xs-9" align="left">'+content+'</div></button>');
				editor.insertNode(editable, html);
				//window.close();
			})
		})

	</script>
	<input type="hidden" id="x">
	<input type="hidden" id="y">
</body>
</html>