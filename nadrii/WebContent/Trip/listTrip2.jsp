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
	
// ���� ��ũ�� ����, getTheme.jsp ��� ���̾�α� â���� ȭ�� ������
// �̺��� : ���� ���̾�α� â���� ������ ���� �ִ� ����� ���������ߴ� ���� ���� �����̴� ���. ȭ��� �巡�׽� �״�� �����.
// ���� : ���� ����, ȣ�� CDN, ȣ�� ����� ��� �и��ؼ� �ڵ��ߴ��� ������ ������ ���ٴ� ������� ȣ��ǰ�, ���̾�α� tag�� �浹�ϸ鼭 ������ ������ ���� �߻�. 
// �ӽ� �ذ��� : ���� ȣ���� ��� ���� ���� ȣ��Ǵ� ���� Ȯ���ؼ� �ʻ���, ���̾�α� ������ ���� 2���� ȣ����(��ȸ �ڵ�)

	
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
			            "<p> <a href='#' class='btn btn-primary' role='button'>����</a>"+ 
			            	"<a href='#' class='btn btn-default' role='button'>���ƿ�</a>"+
			            	"<a href='#' class='btn btn-danger' role='button'>���ø���Ʈ</a>"+	
			            "</p>"+
			          "</div>"+
			        "</div>"+
			      "</div>";
										
					$(".row").append(dpValue);	
				}
								
			}
			
		});
	}
	
	
	// ���� ���� !!!!!!!
	function makeDialog(){
		 $('#dialog').dialog({
				//draggable: false,
			    autoOpen: false,
			    resizable: false,
			    //ũ�� ����
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
	// ajax�� ���� ��ǥ���� ������ �����ߴ� ������ �ű�� ���� ���� ����
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
					"<a href='#' class='btn btn-primary' role='button'>����</a>"+ 
					"<a href='#' class='btn btn-default' role='button'>���ƿ�</a>"+
					"<a href='#' class='btn btn-danger' role='button'>���ø���Ʈ</a>"+	
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
	
	
	//�̺�Ʈ�� �ɷȴµ� �ε����� Ʋ���� �̷� ��û�̰�
	
	$(function(){
		$("p a:nth-child(3)").on("click",function(){
			alert($("a[href='#']:contains('���ø���Ʈ')").index(this));
			alert($($("input[name = 'contentid']")[$("a[href='#']:contains('���ø���Ʈ')").index(this)]).val());
			alert($($("input[name = 'contenttypeid']")[$("a[href='#']:contains('���ø���Ʈ')").index(this)]).val());
		});
	})
	
	
	
		
	</script>
	<!-- ���� �����ϴ� CDN �� �ʿ� ���� ���� Ȯ�� -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
	  <script type="text/javascript">
	  function makeMap(){
		var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
		var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
		center: new daum.maps.LatLng(mapy,mapx), //������ �߽���ǥ.
		level: 3 //������ ����(Ȯ��, ��� ����)
		//draggable : false;
		};
	
		var map = new daum.maps.Map(container, options); //���� ���� �� ��ü ����
	  
		var markerPosition  = new daum.maps.LatLng(mapy,mapx); 
	
		//��Ŀ�� �����մϴ�
		var marker = new daum.maps.Marker({
		   position: markerPosition
		});
		
		//��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);
	  }
	</script>
	<style>
	
		img {
			cursor: pointer;
		}
	
	</style>
		
	<title>�ڹ���ã��</title>
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
		          	<a href="#" class="btn btn-primary" role="button">����</a> 
		            <a href="#" class="btn btn-default" role="button">���ƿ�</a>
		            <a href="#" class="btn btn-danger" role="button">���ø���Ʈ</a>	
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
	<!--  ������ ��� ���� -->
  <div id="map" style="width:400px;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
  <script type="text/javascript"></script>
    
    

    

  
</div>	
  
</body>
</html>