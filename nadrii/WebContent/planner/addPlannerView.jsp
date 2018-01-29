<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link href="../resources/css/keywordSearch.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
			$( "#sortable" ).sortable();
			$( "#sortable" ).disableSelection();
		});
		
		$( function() {
			
			$("#searchListSubmit").on("click", function(){
				$("#placesList").css("display","block");
			});
			
		    // run the currently selected effect
		    function runEffect() {
		      // get effect type from
		      var selectedEffect = $( "#effectTypes" ).val();
		 
		      // Most effect types need no options passed by default
		      var options = {};
		      // some effects have required parameters
		      if ( selectedEffect === "scale" ) {
		        options = { percent: 50 };
		      } else if ( selectedEffect === "size" ) {
		        options = { to: { width: 200, height: 60 } };
		      }
		 
		      // Run the effect
		      $( "#placesList" ).toggle( "blind", options, 500 );
		    };
		 
		    // Set effect from select menu value
		    $( "#button" ).on( "click", function() {
		      runEffect();
		      
	//		  if($("#placesList").css("display") == "none"){
		//	  	$("#button")
		//	  }else{
		//	  	$("#button")
		//	  }
				if(side.hasClass('open')) {
					side.stop(true).animate({left:'0px'}, duration);
					sidebt.find('span').text('CLOSE');
				}else{
					side.stop(true).animate({left:'-300px'}, duration);
					sidebt.find('span').text('OPEN');
				};
		    });
		  } );
		
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
<div class="row">
		<div class = "col-lg-11"></div>
		<div class = "col-lg-1">
			<input type = "button" value ="저장">
		</div>
		
		<div class = "col-lg-8">
		 
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:750px;position:relative;overflow:hidden;"></div>
	
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" value="" id="keyword" size="15"> 
	                    <button id="searchListSubmit" type="submit">검색하기</button> 
	                </form>
	                <ul id="placesList" style="display: none;"></ul>
	        		<text id="button" size="30">▼</text>
	            </div>
	            
	        </div>
	        
	        <div id="pagination"></div>
	    </div>
	    <p><em>지도를 클릭해주세요!</em></p> 
	<div id="clickLatlng"></div>
	<form name = "test" method="post">
		<input type="button" value="경로탐색" onclick="javascript:search1(1)">
		
		<input type ="button" value="시외버스" onClick="javascript:search1(1)">
		<input type ="button" value="고속버스" onClick="javascript:search1(2)">
		<input type ="button" value="기차" onClick="javascript:search1(3)">
		
		<hr/>
		
		<input type ="button" value="바운더리1" onClick="javascript:showBoundary(0)">
		<input type ="button" value="바운더리2" onClick="javascript:showBoundary(1)">
		<input type ="button" value="바운더리3" onClick="javascript:showBoundary(2)">
		<input type ="button" value="바운더리4" onClick="javascript:showBoundary(3)">
		<input type ="button" value="바운더리5" onClick="javascript:showBoundary(4)">
		
			
	</form>
	</div>
	</div>
	
	
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
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=162ee19a901cbbe89c0c4b261ddecca3&libraries=services"></script>
<script language="JavaScript" src="../resources/js/map.js"></script>
	<script type="text/javascript">
	
		/*******************Array insert 사용**********************/
		Array.prototype.insert = function ( index, item ) {
	    		this.splice( index, 0, item );
		};
		
		/********************************************************/	

		var polyline;
		var STNpolyline;
		var startSTN;
		var endSTN;
		var polylineArray;
		var boundaryArray;
	
		function search1(flag){
			
			if(STNpolyline != null ){
				deleteExSearch();
			}
			if(STNpolyline != null || polylineArray != null){
				deleteInSearch();
			}

			ak=[];
			rk=[];
			
			ak.push(startMarker.getPosition());
			rk.push(startMarker.getPosition());
			if(passMarker[1].getMap() != null){
				ak.push(passMarker[1].getPosition());
				rk.push(passMarker[1].getPosition());
			}
			if(passMarker[2].getMap() != null){
				ak.push(passMarker[2].getPosition());
				rk.push(passMarker[2].getPosition());
			}
			if(passMarker[3].getMap() != null){
				ak.push(passMarker[3].getPosition());
				rk.push(passMarker[3].getPosition());
			}
			if(passMarker[4].getMap() != null){
				ak.push(passMarker[4].getPosition());
				rk.push(passMarker[4].getPosition());
			}
			if(passMarker[5].getMap() != null){
				ak.push(passMarker[5].getPosition());
				rk.push(passMarker[5].getPosition());
			}
			
			ak.push(endMarker.getPosition());
			rk.push(endMarker.getPosition());
			
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
				
				
				function getOBJ(){
					$.ajax({
						url : "../odsay/json/getOBJ",
						method : "GET",
						dataType : "json",
						data : {"sx" : sx, "sy" : sy, "ex" : ex, "ey" : ey, "flag" : flag},
						async : false,
						headers : {
							"Accept" : "application/json",
							"Content-type" : "application/json"
						},
						success:function(returnData){
							alert("시외 success 터미널 마커 생성");
							
							startSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.sy, returnData.sx)
							});
							endSTN = new daum.maps.Marker({
							    map: map,
							    position: new daum.maps.LatLng(returnData.ey, returnData.ex)
							});
							
							var startStnPosition = new daum.maps.LatLng(returnData.sy,returnData.sx);
							var endStnPosition = new daum.maps.LatLng(returnData.ey,returnData.ex)
		                    
							rk.insert(k+1, startStnPosition);
							rk.insert(k+2, endStnPosition);
							
							function line2(){
								STNpolyline = new daum.maps.Polyline({
								    path: [
								       startStnPosition, endStnPosition
								    ],
								    strokeWeight: 2,
								    strokeColor: '#FF00FF',
								    strokeOpacity: 0.8,
								    strokeStyle: 'dashed'
								});	
								
								STNpolyline.setMap(map);
								
							}
							line2();
						}
					});
				}// getOBJ 끝
				
				getOBJ();
				
			}
			
			for(k=0;k<rk.length;k++){
				if(k==0){
					first = rk[k];
				}else{
					first=temp;
				}
				last = rk[k+1];
				temp = last;
				if(k+1 == rk.length){
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
							
							var code = returnData.code;
							
							if(code != null){
								
								if(code == 500){
									swal({
										text: "서버 내부 오류",
										icon: "warning"
									});
								}else if(code == -98){
									swal({
										text: "필수 입력값이 누락되었습니다.",
										icon: "warning"
									});
								}else if (code == -99){
									swal({
										text: "검색 결과가 없습니다",
										icon: "warning"
									});
								}
								
							}else{
								
								alert("시내 success");
								callMapObjApiAJAX(returnData.mapObj);
							}
						}
					});
				}// getInfo 끝
				
				getInfo();
				
			}//for문 끝
			
			function callMapObjApiAJAX(mabObj){
								
				/****************폴리라인배열 선언 및 초기화****************/
				polylineArray = [];
				boundaryArray = [];

				for(var i=0; i<polylineArray.length; i++){
					polylineArray[i]=null;
				}
				
		//		for(var i=0; i<boundaryArray.length; i++){
		//			boundaryArray[i]=null;
		//		}
							
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

						var error = returnData.error;
						
						if(error != null){
							
							alert("polyline을 그리던 중 "+error.message);
							
						}else{
																		
							lineArray = null;
							lineArray = new Array();
	
							for (var k = 0; k < returnData.listY.length; k++) {
								lineArray.push(new daum.maps.LatLng(returnData.listY[k], returnData.listX[k]));
							}
	
							polyline = new daum.maps.Polyline({
								path : lineArray,
								strokeWeight : 3
							});
	
							polylineArray.push(polyline);
	
							if (polyline.getMap() == null) {
								for (var i = 0; i < polylineArray.length; i++) {
									polylineArray[i].setMap(map);
								}
							}
							
							boundary = new daum.maps.LatLngBounds(
								                new daum.maps.LatLng(returnData.boundary.top, returnData.boundary.left),
								                new daum.maps.LatLng(returnData.boundary.bottom, returnData.boundary.right)
								          	);
							
							boundaryArray.push(boundary);
							
							alert("boundaryArray.length : "+boundaryArray.length);
							alert("boundaryArray : "+boundaryArray);
							
							alert("폴리라인 success");
							
						}
					}
				});

				markerInfoWindow();
				
			} //callMapObjApiAJAX 끝

		} // search끝

		function markerInfoWindow(){
			
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
					
					var code = returnData.code;
					
					if(code != null){
						
						if(code == 500){
							swal({
								text: "서버 내부 오류",
								icon: "warning"
							});
						}else if(code == -98){
							swal({
								text: "필수 입력값이 누락되었습니다.",
								icon: "warning"
							});
						}else if (code == -99){
							swal({
								text: "검색 결과가 없습니다",
								icon: "warning"
							});
						}
						
					}else{
						
						alert("시내 success");
						callMapObjApiAJAX(returnData.mapObj);
					}
				}
			});
			
			var iwContent ='출발지인포윈도우',
		    	 iwPosition = startMarker.getPosition();

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, startMarker); 
		}
			
		function deleteExSearch() {
			if (STNpolyline.getMap() != null) {
				STNpolyline.setMap(null);
				startSTN.setMap(null);
				endSTN.setMap(null);
			}

			for (var i = 0; i < polylineArray.length; i++) {
				polylineArray[i].setMap(null);
			}
		}

		function deleteInSearch() {
			for (var i = 0; i < polylineArray.length; i++) {
				polylineArray[i].setMap(null);
			}
		}
		
		function showBoundary(i){
			console.log("boundaryArray["+i+"] 보여주는중");
			map.setBounds(boundaryArray[i]);
		}
	</script>
</body>		