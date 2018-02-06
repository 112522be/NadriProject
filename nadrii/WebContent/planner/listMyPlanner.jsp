<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
	
	//myPlannerList 호출
	function getMyPlannerList(){
		$.ajax({
			url: "../planner/json/getMyPlannerList",
			method: "GET",
			dataType: "json",
			headers: {
				"Accept" : "application/json",
				"Content-type" : "application/json"
			},
			success : function(returnData){
				console.log(returnData);
				if(returnData == null){
					$("body").append("<h3>저장되있는 플래너가 없습니다.</h3>");
				}else{
					var value =
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
									"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
									"</p>"+
								"</div>"+
							"</div>"+
						"</div>";
					$("form").append(value);
				}
			}
		});
	}
	
	
	$(function(){
		$("a[href='#' ]:contains('테스트1')").on("click" , function() {
			self.location = "/planner/getPlanner?postNo="+$($("input[name='postNo']")).val();
		});
	});
	
	
	
	</script>
	
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<form name="getPlanner">
		${resultPage}<hr>
		<c:forEach var="list" items="${list }">
			${list }<hr>
		</c:forEach>
		
		${search }<hr>
		
		<c:forEach var ="list" items="${list }">
			<input type="hidden"name="postNo" value="${list.postNo }"/>
			<a href="#" name="title" value ="${list.postNo }">${list.title }</a>
			
		</c:forEach>
		
		
	</form>

</body>
</html>