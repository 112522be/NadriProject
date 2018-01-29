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
	
// 무한 스크롤 구현, getTheme.jsp 대신 다이얼로그 창으로 화면 구성함
// 미비점 : 현재 다이얼로그 창에서 지도를 보여 주는 방식은 기존존재했던 지도 위에 덧붙이는 방법. 화면상 드래그시 그대로 노출됨.
// 사유 : 지도 공간, 호출 CDN, 호출 대상을 모두 분리해서 코딩했더니 기존에 지도에 덧붙는 방법으로 호출되고, 다이얼로그 tag와 충돌하면서 지도가 깨지는 현상 발생. 
// 임시 해결방법 : 재차 호출의 경우 문제 없이 호출되는 것을 확인해서 맵생성, 다이얼로그 생성을 각각 2번씩 호출함(우회 코딩)

	
	var page = 1;
	
	$(function(){
		page++;
	});
	
	$(window).scroll(function() { 
		if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
			listTrip(page);
			page++
		}
	});
	
	
	function listTrip(page){
		$.ajax({
			url:"../trip/json/list"+'${trip}'+"/"+page+"",
			method:"GET",
			dataType:"json",
			data:{"page" :page},
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				var data = returnData.list;
				//alert(data);
								
				for(var a =0; a<data.length;++a){
					var dpValue =
					
				 "<div class='col-xs-4'>"+
			        "<div class='thumbnail'>"+
			          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
			          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
			          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
			          "<div class='caption'>"+
			            "<h3 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h3>"+
			            "<p>"+data[a].addr1+"</p>"+
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
	
	
	// 지도 참조 !!!!!!!
	function makeDialog(){
		 $('#dialog').dialog({
				//draggable: false,
			    autoOpen: false,
			    resizable: false,
			    //크기 조절
			    width: 800,
		});
	}
	
	
	var contenttypeid;
	var contentid;
	
	$(function() {
	  $(document).on("click","img", function(){
	    
		contenttypeid =$(this).next().next().val();
		contentid = $(this).next().val();
		alert(contenttypeid);
		alert(contentid);
		alert($(".col-xs-4 img:nth-child(1)").index(this));
		getTheme(contentid, contenttypeid);
		
		/*
		var type = $("img").index(this);
		alert(type);
	    */
	  });
	});	
	
	///*
	// ajax로 나온 좌표값을 기존에 생성했던 지도로 옮기기 위한 전역 변수
	var mapx;
	var mapy;
	
	function getTheme(contentid, contenttypeid){
		$.ajax({
			url:"../trip/json/getTrip/"+contentid+"/"+contenttypeid+"",
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				var common = returnData.getTrip;
				var fee = returnData.getDetail;
				mapx = common.mapx;
				mapy = common.mapy;
				contentid =common.contentid;
				contenttypeid = common.contenttypeid;
				alert(contenttypeid);
				alert(contentid);
				
				$("#string").remove();
				var dpValue = "<div id ='string'>"; 
					if(common.firstimage2 !=null){
						dpValue += "<img src='"+common.firstimage2+"'/>";	
					}
				
					if(common.title != null){
					
						dpValue	+= "<p>"+ common.title+"</p>";
					}
										
					if(common.addr1!=null){
						dpValue +="<p>"+common.addr1+"</p>";
					}
					if(fee.usefee!=null){
						dpValue +="<p>"+fee.usefee+"</p>";
					}
					if(common.overview!=null){
						dpValue += "<h5>"+common.overview+"</h5>";	
					}
					
					dpValue = 
						dpValue +"<h3>"+
					"<a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
					"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
					"<a href='#' class='btn btn-danger' role='button'>위시리스트</a>"+	
					"</h3>"
					
					
					dpValue += "</"+ "div>";
					//*/
				
				$("#dialog").append(dpValue);
				
				makeMap();
				makeDialog();
				$('#dialog').dialog('open');
				
				
				makeMap();
				makeDialog();
				$('#dialog').dialog('open');
				
				
			}
		});
	}
	
	
	//이벤트는 걸렸는데 인덱스가 틀린다 이런 멍청이가
	
	$(function(){
		$("p a:nth-child(3)").on("click",function(){
			alert($("a[href='#']:contains('위시리스트')").index(this));
			alert($($("input[name = 'contentid']")[$("a[href='#']:contains('위시리스트')").index(this)]).val());
			alert($($("input[name = 'contenttypeid']")[$("a[href='#']:contains('위시리스트')").index(this)]).val());
		});
	})
	
	
	
		
	</script>
	<!-- 지도 생성하는 CDN 및 맵에 담을 내용 확인 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
	  <script type="text/javascript">
	  function makeMap(){
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(mapy,mapx), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
		//draggable : false;
		};
	
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	  
		var markerPosition  = new daum.maps.LatLng(mapy,mapx); 
	
		//마커를 생성합니다
		var marker = new daum.maps.Marker({
		   position: markerPosition
		});
		
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	  }
	</script>
	<style>
	
		img {
			cursor: pointer;
		}
	
	</style>
		
	<title>박물관찾기</title>
</head>
<body>
<input type="hidden" id="type" value="${type}"/>

 
	
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
 
   
<!--  style="display: none;" -->
   
<div id="dialog" title="" >
	<!--  지도를 담는 공간 -->
  <div id="map" style="width:400px;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
  <script type="text/javascript"></script>
    
    

    

  
</div>	
  
</body>
</html>