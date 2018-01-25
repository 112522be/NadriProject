<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript">

	
	var page = 1;
	
	$(function(){
		page++;
	});
	
	$(window).scroll(function() { 
		if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
		
		listMuseum(page);
		page++
		}
	});
	
	//ajax 안에서 if문 처리 해보자 
	function listMuseum(page){
		$.ajax({
			url:"../trip/json/listMuseum/"+page+"",
			method:"GET",
			dataType:"json",
			data:{"page" :page},
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				var data = returnData.trip;
				//alert(data);
								
				for(var a =0; a<data.length;++a){
					var dpValue =
					
				 "<div class='col-sm-6 col-md-4'>"+
			        "<div class='thumbnail'>"+
			          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "'data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
			          "<div class='caption'>"+
			            "<h3 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h3>"+
			            "<p>"+data[a].addr1+"</p>"+
			            "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
			            "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
			            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
			            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
			            	"<a href='#' class='btn btn-danger' role='button'>위시리스트</a>"+	
			            "</p>"+
			          "</div>"+
			        "</div>"+
			      "</div>";
										
					$(".row").append(dpValue);	
				}
								
			}
			
		});
	}
	
	
	$(function() {
		  $('#dialog').dialog({
			//draggable: false,
		    autoOpen: false,
		    resizable: false,
		    //크기 조절
		    width: 800,
		  });
	  $('img').click( function(){
	    //alert($($(".thumbnail")[$(".row div:nth-child(1)").index(this)]));
		var contenttypeid =$(this).next().next().val();
		var contentid = $(this).next().val();
		alert(contenttypeid);
		alert(contentid);
		//getTheme(contentid, contenttypeid);
		$('#dialog').dialog('open');
		var type = $("img").index(this);
		alert(type);
	    
	  });
	});	
	
	/*
	function getTheme(contentid, contenttypeid){
		$.ajax({
			url:"../trip/json/getMuseum/"+contentid+"/"+contenttypeid+"",
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				var common = returnData.getTrip;
				var fee = returnData.getDetail;
				
				var dpValue =
					
					"<div id='dialog' title='"+ ${common.title}+"'>"+
					"<img src='"+${common.firstimage2 }+"'/>"+
					"<p>"+${common.title}+"</p>"+
					"<p>"+${common.addr1}+"</p>"+
					"<div id='map' style='width:100%;height:400px;'></div>"+
					"<script type='text/javascript' src='//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f'>"+"</"+"script>"+
					  	"<script>"+
							"var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스"+
							"var options = { //지도를 생성할 때 필요한 기본 옵션"+
								"center: new daum.maps.LatLng(${list.get(i).mapy},${list.get(i).mapx}), //지도의 중심좌표."+
								"level: 3 //지도의 레벨(확대, 축소 정도)"+
							"};"+
							"var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴"+
							"var markerPosition  = new daum.maps.LatLng("+${common.mapy}+","+${common.mapx}+");"+ 
							//마커를 생성합니다
							"var marker = new daum.maps.Marker({"+
							   "position: markerPosition"+
							"});"+
							//마커가 지도 위에 표시되도록 설정합니다
							"marker.setMap(map);"+
						"</" +"script>"+
					"</"+ "div>";
					
				$("#dialog").remove();
				
				$('#dialog').dialog({
					//draggable: false,
				    autoOpen: false,
				    resizable: false,
				    //크기 조절
				    width: 800,
				  });
				$('#dialog').dialog('open');
				//$("body").append(dpValue);
				
			}
		});
	}
	//*/
		
	</script>
	
	<style>
	
		img {
			cursor: pointer;
		}
	
	</style>
	
	
	<title>박물관찾기</title>
</head>
<body>


 
	
<div class="container">

<div class="bs-example" data-example-id="thumbnails-with-custom-content">
   
    
    
	    <input type="hidden" id="pageNo" value="${pageNo}"/>
	    <div class="row">
		<c:forEach var ="list" items="${list}">
		
		
		    <div class="col-xs-4">
	        	<div class="thumbnail">
		          <img id="thumbnailImage" data-src="holder.js/100%x200" alt="100%x200" src="${list.firstimage2 }" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
		          <input type="hidden" name="contentid" value="${list.contentid}"/>
		          <input type="hidden" name="contenttypeid" value="${list.contenttypeid}"/>
		          <div class="caption">
		          	<h3 id="thumbnail-label">${list.title}
		            	<a class="anchorjs-link" href="#thumbnail-label">
		            		<span class="anchorjs-icon"></span>
		            	</a>
		            </h3>
		          <p>${list.addr1}</p>
		          <p> 
		          	<a href="#" class="btn btn-primary" role="button">공유</a> 
		            <a href="#" class="btn btn-default" role="button">좋아요</a>
		            <a href="#" class="btn btn-danger" role="button">위시리스트</a>	
		          </p>
		        </div>
			</div>
		</div>
	
      
     	
      </c:forEach>
      </div>
      
     
  </div>
</div>  
 
 
 <!-- style="display: none;" -->
<div id="dialog" title="${list.get(i).title }" >
	
  <img src="${list.get(i).firstimage2 }"/>
  <p>${list.get(i).addr1}</p>
  <div id="map" style="width:100%;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
  <script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(${list.get(i).mapy},${list.get(i).mapx}), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
  
	var markerPosition  = new daum.maps.LatLng(${list.get(i).mapy},${list.get(i).mapx}); 

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