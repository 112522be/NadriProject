<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<title>Insert title here</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<style>
	  	#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
		#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
		#sortable li span { position: absolute; margin-left: -1.3em; }
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
			$( "#sortable" ).sortable();
			$( "#sortable" ).disableSelection();
		});
	</script>
	
</head>
<body>

<div class = "container-fulid">
<!-- 
	<div class="row">
		<div class = "col-lg-11"></div>
		<div class = "col-lg-1">
			<input type = "button" value ="저장">
		</div>
		<div class = "col-lg-8" id="map" style="width:65%;height:750px;"></div>
		<div class = "col-lg-4">
		
			<ul id="sortable">
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
				<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
			</ul>
			
			<hr>
			
			<textarea class="form-control" rows="27" cols="blue"></textarea>
		
		</div>
	</div>
 -->
	
	<div id="map" style="width:100%;height:750px;"></div>
	<p><em>지도를 클릭해주세요!</em></p> 
	<div id="clickLatlng"></div>
	<form name = "test" method="post">
		<input type="button" value="경로탐색" onclick="javascript:search1()">
		<input type="button" value="경로삭제" onclick="javascript:kkk()">
		<input type="button" value="뭘까요" onclick="javascript:bb()">
	</form>
	
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3"></script>
<script language="JavaScript" src="../resources/js/map.js"></script>
	<script type="text/javascript">
	
		/*******************Array insert 사용**********************/
		Array.prototype.insert = function ( index, item ) {
	    		this.splice( index, 0, item );
		};
		
		/********************************************************/	
	
	
		function search1(){
			
			var ak=[];
			
			ak.push(startMarker.getPosition());
			if(passMarker[1].getMap() != null){
				ak.push(passMarker[1].getPosition());
			}
			if(passMarker[2].getMap() != null){
				ak.push(passMarker[2].getPosition());
			}
			if(passMarker[3].getMap() != null){
				ak.push(passMarker[3].getPosition());
			}
			if(passMarker[4].getMap() != null){
				ak.push(passMarker[4].getPosition());
			}
			if(passMarker[5].getMap() != null){
				ak.push(passMarker[5].getPosition());
			}
			
			ak.push(endMarker.getPosition());
			
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
							
				var sx = first.getLng();
				var sy = first.getLat();
				var ex = last.getLng();
				var ey = last.getLat();
				
				function getInfo(){
					$.ajax({
						url : "../odsay/json/getInfo",
						method : "GET",
						dataType : "json",
						data : {"sx" : sx, "sy" : sy, "ex" : ex, "ey" : ey},
						headers : {
							"Accept" : "application/json",
							"Content-type" : "application/json"
						},
						success:function(returnData){
							alert("시내 success");
							var mapObj = returnData.mapObj;
							alert(mapObj);
							callMapObjApiAJAX(mapObj);
						},
						error:function(){
							alert("error");
							getOBJ();
						}
					});
				}
				
				function getOBJ(){
					$.ajax({
						url : "../odsay/json/getOBJ",
						method : "GET",
						dataType : "json",
						data : {"sx" : sx, "sy" : sy, "ex" : ex, "ey" : ey},
						headers : {
							"Accept" : "application/json",
							"Content-type" : "application/json"
						},
						success:function(returnData){
							alert("시외 success 터미널 마커 생성");
							
							var startSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.sy, returnData.sx)
							});
							var endSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.ey, returnData.ex)
							});
						},
						error:function(){
							alert("error");
						}
					});
				}
				
				getInfo();
				
			}
			
			
			
			function callMapObjApiAJAX(mabObj){
				
				var lineArray;
				
				$.ajax({
					url : "../odsay/json/getGraph",
					method : "GET",
					dataType : "json",
					data : {"mapObj": mabObj},
					headers : {
						"Accept" : "application/json",
						"Content-type" : "application/json"
					},
					success:function(returnData){
						
						alert("success");
						
						console.log( "returnData.listX[0] " + returnData.listX[0] );
						console.log( "returnData.listY[0] " + returnData.listY[0] );
						console.log( "returnData.listX.length " + returnData.listX.length );
						console.log( "returnData.listY.length " + returnData.listY.length );
				
							lineArray = null;
							lineArray = new Array();
							
							for(var k=0 ; k <returnData.listX.length ; k++){
								lineArray.push(new daum.maps.LatLng(returnData.listY[k], returnData.listX[k]));
							}
														
							var polyline = new daum.maps.Polyline({
								map: map,
								path: lineArray,
							    strokeWeight: 3
							});
							
					},
					error:function(){
						alert("error");
					}
				});
				
			}

		}
		
		
	</script>
	
		
		