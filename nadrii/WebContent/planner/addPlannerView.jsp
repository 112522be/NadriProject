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
		    
		      // Run the effect
		      $( "#placesList" ).toggle( "blind", 300 );
		    };
		 
		    // Set effect from select menu value
		    $( "#button" ).on( "click", function() {
		      runEffect();
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
	        		<text id="button">▼</text>
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
<script language="JavaScript" src="../resources/js/map.js?version=334"></script>
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
		
		var sx;
		var sy;
		var ex;
		var ey;
	
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
							
				sx = first.getLng();
				sy = first.getLat();
				ex = last.getLng();
				ey = last.getLat();
				
				getOBJ(k, flag);
				
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
				
				sx = first.getLng();
				sy = first.getLat();
				ex = last.getLng();
				ey = last.getLat();

				
				getInfo(k);
				
				
			}//for문 끝
			
			
		} // search끝

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