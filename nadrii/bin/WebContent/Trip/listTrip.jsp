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
	
// ¹«ÇÑ ½ºÅ©·Ñ ±¸Çö, getTheme.jsp ´ë½Å ´ÙÀÌ¾ó·Î±× Ã¢À¸·Î È­¸é ±¸¼ºÇÔ
// ¹ÌºñÁ¡ : ÇöÀç ´ÙÀÌ¾ó·Î±× Ã¢¿¡¼­ Áöµµ¸¦ º¸¿© ÁÖ´Â ¹æ½ÄÀº ±âÁ¸Á¸ÀçÇß´ø Áöµµ À§¿¡ µ¡ºÙÀÌ´Â ¹æ¹ı. È­¸é»ó µå·¡±×½Ã ±×´ë·Î ³ëÃâµÊ.
// »çÀ¯ : Áöµµ °ø°£, È£Ãâ CDN, È£Ãâ ´ë»óÀ» ¸ğµÎ ºĞ¸®ÇØ¼­ ÄÚµùÇß´õ´Ï ±âÁ¸¿¡ Áöµµ¿¡ µ¡ºÙ´Â ¹æ¹ıÀ¸·Î È£ÃâµÇ°í, ´ÙÀÌ¾ó·Î±× tag¿Í Ãæµ¹ÇÏ¸é¼­ Áöµµ°¡ ±úÁö´Â Çö»ó ¹ß»ı. 
// ÀÓ½Ã ÇØ°á¹æ¹ı : ÀçÂ÷ È£ÃâÀÇ °æ¿ì ¹®Á¦ ¾øÀÌ È£ÃâµÇ´Â °ÍÀ» È®ÀÎÇØ¼­ ¸Ê»ı¼º, ´ÙÀÌ¾ó·Î±× »ı¼ºÀ» °¢°¢ 2¹ø¾¿ È£ÃâÇÔ(¿ìÈ¸ ÄÚµù)
	
	///////////////////¹«ÇÑ ½ºÅ©·Ñ ½ÃÀÛ
	///*
	//pageÇÒ º¯¼ö
	var page = 1;
	var flag =0;
	//*/
	
	//onload ½Ã page º¯È¯ Ãâ·Â ÆäÀÌÁö´Â 1, ÇöÀç page´Â 2
	$(function(){
		page++;
	});
	
	
	
	
	//½ºÅ©·ÑÀÌ ³¡¿¡ ´êÀ» ¶§¸¦ Ä³Ä¡
	$(window).scroll(function() { 
		if($(window).scrollTop() == $(document).height() - $(window).height() & flag ==1){
			flag=0;
		}
		
		if ($(window).scrollTop() >= $(document).height() - $(window).height()& flag ==0) {
			flag=1;
			listTrip(page);
			page++;
		}
	});
	
	//ÆäÀÌÁö ³×ÀÌ°ÔÀÌ¼ÇÀ» ¼öÇàÇÏ´Â JS
	function listTrip(){
		var areaCode = "${areaCode}";
		var localName ="${localName}";
		if(areaCode ==""){
			areaCode ="0";
		}
		if(localName==""){
			localName="0";
		}
		
		$.ajax({
			url:"../trip/json/list"+'${trip}'+"/"+page+"/"+areaCode+"/"+localName,
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				var data = returnData.list;
												
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
				            "<p> <a href='#' class='btn btn-primary' role='button'>°øÀ¯</a>"+ 
				            	"<a href='#' class='btn btn-default' role='button'>ÁÁ¾Æ¿ä</a>"+
				            	"<a href='#'id='wish' class='btn btn-danger' role='button'>À§½Ã¸®½ºÆ®</a>"+	
				            "</p>"+
				          "</div>"+
				        "</div>"+
				      "</div>";
										
					$(".row").append(dpValue);	
					}
				}
								
			
			
		});
	}
	
	/////////////////////////////////////////////¹«ÇÑ½ºÅ©·Ñ
	
	
	// Áöµµ ÂüÁ¶ !!!!!!!
	function makeDialog(){
		 $('#dialog').dialog({
				//draggable: false,
			    autoOpen: false,
			    resizable: false,
			    //Å©±â Á¶Àı
			    width: 800,
		});
	}
	
	
	var contenttypeid;
	var contentid;
	
	$(function() {
	  $(document).on("click","img", function(){
	    
		contenttypeid =$(this).next().next().val();
		contentid = $(this).next().val();
		alert(111);
		
		getTheme(contentid, contenttypeid);
			
		
	  });
	});	
	
	///*
	
	// getTrip ´ë½Å¿¡ »ı°Ü³­ ´ÙÀÌ¾ó·Î±× È­¸é(ajax ½ÇÇà ÈÄÀÇ µ¥ÀÌÅÍ¸¦ ´ÙÀÌ¾ó·Î±×·Î ¼ÛÃâ)
	// ajax·Î ³ª¿Â ÁÂÇ¥°ªÀ» ±âÁ¸¿¡ »ı¼ºÇß´ø Áöµµ·Î ¿Å±â±â À§ÇÑ Àü¿ª º¯¼ö
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
				//alert(contenttypeid);
				//alert(contentid);
				
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
					
					
					dpValue += "</div>";
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
	
	//¿ì¸® µğºñ¿¡ µ¥ÀÌÅÍ¸¦ È£ÃâÇÏ°í ÀúÀåÇÒ ¶§ È£Ãâ
	function addTripToDB(contentid, contenttypeid){
		$.ajax({
			url:"../trip/json/getTrip/"+contentid+"/"+contenttypeid+"",
			method:"GET",
			//asyn:false,
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success:function(){
				alert("¼±ÀúÀå");
			}
		})
	}
	
	//À§½Ã¸®½ºÆ®¿¡ ÀúÀåÇÒ ¶§ »ç¿ë
	function addWish(contentid){
		$.ajax({
			url:"../wish/json/addWishFromTrip/"+contentid+"",
			method:"GET",
			//asyn:false,
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success:function(){
				alert("À§½Ã¸®½ºÆ®¿¡ ÀúÀå");
			}
		});
		
	}
	
	
	//¸®½ºÆ®¿¡ ÀÖ´Â À§½Ã¸®½ºÆ® Å¬¸¯½Ã ¹ß»ıÇÏ´Â ÀÌº¥Æ®
	$(function() {
	  $(document).on("click","#wish", function(e){
		  	var contentid =$($("input[name = 'contentid']")[$("a[href='#']:contains('À§½Ã¸®½ºÆ®')").index(this)]).val();
			var contenttypeid =$($("input[name = 'contenttypeid']")[$("a[href='#']:contains('À§½Ã¸®½ºÆ®')").index(this)]).val();
			
			alert($("a[href='#']:contains('À§½Ã¸®½ºÆ®')").index(this));
			alert(contentid);
			alert(contenttypeid);
			alert("¸®½ºÆ® À§½Ã¸®½ºÆ® Å¬¸¯");
			
			//ÇØ´ç ÄÁÅÙÃ÷¾ÆÀÌµğ¿¡ ÀÖ´Â ¿©ÇàÁö¸¦ È£Ãâ¾øÀ¸¸é ÀúÀå, ÀÖÀ¸¸é ¾÷µ¥ÀÌÆ® Ä«¿îÆ®
			addTripToDB(contentid, contenttypeid)
			
			//À§¿¡¼­ ÀúÀåÇÑ °ÍÀ» À§½Ã¸®½ºÆ®¿¡ ÀçÀúÀå 
			addWish(contentid);
			e.preventDefault();
		});
	})
	
		
	//getTheme ³»¿¡ ÀÖ´Â À§½Ã¸®½ºÆ® Å¬¸¯½Ã ¹ß»ıÇÏ´Â ÀÌº¥Æ®
	$(function(){
		$("#wishList").on("click",function(e){
			alert(contentid);
			alert(contenttypeid);
			alert("´ÙÀÌ¾ó·Î±× À§½Ã¸®½ºÆ® Å¬¸¯");
			addTripToDB(contentid, contenttypeid);
			addWish(contentid);
			e.preventDefault();
		});
	})
	//////////////////////Ä¸ÃÄ
	
	function makeShareImage(){
            element = $("#map").get(0);
            html2canvas(element, {
                useCORS: true,
                allowTaint: false,
                onrendered : function(canvas) {
                    getCanvas = canvas;
//                $.post('/v1/uploadMap', getCanvas.toDataURL("image/png"));
                    upload();
                }
            });
        }
	
	$( function() {
		//==> Ãß°¡µÈºÎºĞ : "addUser"  Event ¿¬°á
		$("a[href='#' ]:contains('½Ã±¸´ÜÀ§')").on("click" , function() {
			self.location = "/trip/list"+'${trip}'+"?pageNo=1&area=local"
		});
	});
		
	$( function() {
		//==> Ãß°¡µÈºÎºĞ : "addUser"  Event ¿¬°á
		$("a[href='#' ]:contains('±¤¿ª´ÜÀ§')").on("click" , function() {
			self.location = "/trip/list"+'${trip}'+"?pageNo=1&area=federal"
		});
	});
	
	$( function() {
		//==> Ãß°¡µÈºÎºĞ : "addUser"  Event ¿¬°á
		$("a[href='#' ]:contains('Àü±¹´ÜÀ§')").on("click" , function() {
			self.location = "/trip/list"+'${trip}'+"?pageNo=1&area=national"
		});
	});
	
		
	</script>
	<!-- Áöµµ »ı¼ºÇÏ´Â CDN ¹× ¸Ê¿¡ ´ãÀ» ³»¿ë È®ÀÎ -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
	  <script type="text/javascript">
	  function makeMap(){
		var container = document.getElementById('map'); //Áöµµ¸¦ ´ãÀ» ¿µ¿ªÀÇ DOM ·¹ÆÛ·±½º
		var options = { //Áöµµ¸¦ »ı¼ºÇÒ ¶§ ÇÊ¿äÇÑ ±âº» ¿É¼Ç
		center: new daum.maps.LatLng(mapy,mapx), //ÁöµµÀÇ Áß½ÉÁÂÇ¥.
		level: 3 //ÁöµµÀÇ ·¹º§(È®´ë, Ãà¼Ò Á¤µµ)
		//draggable : false;
		};
	
		var map = new daum.maps.Map(container, options); //Áöµµ »ı¼º ¹× °´Ã¼ ¸®ÅÏ
	  
		var markerPosition  = new daum.maps.LatLng(mapy,mapx); 
	
		//¸¶Ä¿¸¦ »ı¼º
		var marker = new daum.maps.Marker({
		   position: markerPosition
		});
		
		//¸¶Ä¿°¡ Áöµµ À§¿¡ Ç¥½Ã
		marker.setMap(map);
	  }
	</script>
	<style>
	
		img {
			cursor: pointer;
		}
<<<<<<< asd
		.col-xs-4{
		height: 400px;
		
		}
		.row1{
			container :body;
		}
		
		
	</style>
=======
>>>>>>> ddb47e2 team/jm ì§€ì—­ë³„ë¡œ ë¬´í•œ ìŠ¤í¬ë¡¤ êµ¬í˜„ 190204
	
	</style>
	
	<title>¿©ÇàÁö Ã£±â</title>
</head>
<body>
<jsp:include page="../layout/toolbar.jsp"></jsp:include>

<!--
<div class="col-lg-6">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
    </div>
  </div>

 
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">ÅëÇÕ°Ë»ö</span>
  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
</div>
--> 
<div class="container">
	
 
	<div class = "row1" align="right">
	  <div class="col-lg-6">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for..." align="right">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" align="right">Go!</button>
      </span>
    </div>
  </div>
</div>
 
<!-- 
	<span class="label label-default">Default</span>
	<input type="text" id="searchKeyword" value=""/>
	<a href="#" class="btn btn-default" role="button">Á¶È¸</a>
-->	
</br>

</br>
	<ul class="nav nav-tabs">
	  <li role="presentation" ><a href="#">½Ã±¸´ÜÀ§</a></li>
	  <li role="presentation" ><a href="#">±¤¿ª´ÜÀ§</a></li>
	  <li role="presentation"><a href="#">Àü±¹´ÜÀ§</a></li>
	</ul>

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
		          	<a href="#" class="btn btn-primary" role="button">°øÀ¯</a> 
		            <a href="#" class="btn btn-default" role="button">ÁÁ¾Æ¿ä</a>
		            <a href="#" id="wish" class="btn btn-danger" role="button">À§½Ã¸®½ºÆ®</a>	
		          </p>
		        </div>
			</div>
		</div>
	     	
      </c:forEach>
      
    </div>
      
     
  </div>
</div>  
 
   

   
<div id="dialog" title="" >
	<!--  Áöµµ¸¦ ´ã´Â °ø°£ -->
  <div id="map" style="width:400px;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
  <script type="text/javascript"></script>
    
    
 	<a href="#" class="btn btn-primary" role="button">°øÀ¯</a> 
    <a href="#" class="btn btn-default" role="button">ÁÁ¾Æ¿ä</a>
    <a href="#" id="wishList" class="btn btn-danger" role="button">À§½Ã¸®½ºÆ®</a>

</div>	
 
</body>
</html>