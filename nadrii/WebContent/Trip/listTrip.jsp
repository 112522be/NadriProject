<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<script type="text/javascript">

	
	var page = 1;
	$(function(){
		page++;
	});
	
	$(window).scroll(function() { 
		if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
		getList(page);
		page++
		}
	});
	
	function getList(page){
		$.ajax({
			url:"../tour/json/museum/"+page+"",
			method:"GET",
			dataType:"json",
			data:{"page" :page},
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				var data = returnData.museum;
				//alert(data);
				
			
				
				for(var a =0; a<data.length;++a){
					var dpValue =
					
				 "<div class='col-sm-6 col-md-4'>"+
			        "<div class='thumbnail'>"+
			          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "'data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
			          "<div class='caption'>"+
			            "<h3 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h3>"+
			            "<p>"+data[a].addr1+"</p>"+
			            "<input type='hidden' name='pageNo' value='" +data[a].contentid+"'/>"+
			            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
			            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
			            	"<a href='#' class='btn btn-danger' role='button'>위시리스트</a>"+	
			            "</p>"+
			          "</div>"+
			        "</div>"+
			      "</div>"
						
						
						
					$(".row").append(dpValue);	
				}
								
			}
			
		});
	}
	
	</script>
	
	
	<title>박물관찾기</title>
</head>
<body>
	
<div class="container">

<div class="bs-example" data-example-id="thumbnails-with-custom-content">
    <div class="row">
    
    <input type="hidden" id="pageNo" value="${pageNo}"/>
    <c:set var= "i" value="0"/>
	<c:forEach var ="product" items="${list}">
		
      <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img data-src="holder.js/100%x200" alt="100%x200" src="${list.get(i).firstimage2 }" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
          <div class="caption">
            <h3 id="thumbnail-label">${list.get(i).title}<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
            <p>${list.get(i).addr1}</p>
            <input type="hidden" name="pageNo" value="${list.get(i).contentid}"/>
            <p> <a href="#" class="btn btn-primary" role="button">공유</a> 
            	<a href="#" class="btn btn-default" role="button">좋아요</a>
            	<a href="#" class="btn btn-danger" role="button">위시리스트</a>	
            </p>
          </div>
        </div>
      </div>
      
     	<c:set var="i" value="${i+1}"> </c:set>
      </c:forEach>
      
      
     </div>
  </div>
</div>  
 
  
</body>
</html>