<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
	///////////////////무한 스크롤 시작
	///*
	//page할 변수
	var page = 1;
	var federalPage = 0;
	var nationalPage =0;
	var flag =0;
	//*/
	
	//onload 시 page 변환 출력 페이지는 1, 현재 page는 2
	$(function(){
		page++;
		//federalPage++;
		//nationalPage++;
	});
	
	
	
	
	//스크롤이 끝에 닿을 때를 캐치
	$(window).scroll(function() { 
		if($(window).scrollTop() == $(document).height() - $(window).height() & flag ==1){
			flag=0;
		}
		
		if ($(window).scrollTop() >= $(document).height() - $(window).height()& flag ==0) {
			flag=1;
			listTrip(page);
			/*
			if("${trip}" == "Search"){
				listSearch(page);
			}else{
				listTrip(page);
			}
			*/
			page++;
		}
	});
	
	//페이지 네이게이션을 수행하는 JS
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
			asyn :false,
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
						
			success: function(returnData){
				
				var data = returnData.list;
				
				if(data.length != 0){


					//alert("정상작동");	
																
					for(var a =0; a<data.length;++a){
						
						var dpValue =
							
						 "<div class='col-md-4'>"+
					        "<div class='thumbnail'>"+
					          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
					          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
					          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
					          "<div class='caption'>"+
					            "<h5 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h5>"+
					            "<p>"+data[a].addr1+"</p>"+
					            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
					            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
					            	"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
					            "</p>"+
					          "</div>"+
					        "</div>"+
					      "</div>";
											
						$(".row").append(dpValue);	
					}
				}else{


					//alert("예외발생");
					federalPage++;
					$.ajax({
						url:"../trip/json/list"+'${trip}'+"/"+federalPage+"/"+areaCode+"/"+"0",
						method:"GET",
						asyn :false,
						dataType:"json",
						headers :{
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success: function(returnData){
							flag =1;
							var data = returnData.list;
							if(data.length!=0){
																											
								for(var a =0; a<data.length;++a){
									
									var dpValue =
										
									 "<div class='col-md-4'>"+
								        "<div class='thumbnail'>"+
								          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
								          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
								          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
								          "<div class='caption'>"+
								            "<h5 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h5>"+
								            "<p>"+data[a].addr1+"</p>"+
								            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
								            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
								            	"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
								            "</p>"+
								          "</div>"+
								        "</div>"+
								      "</div>";
								      												
									$($(".row")[1]).append(dpValue);
								}
							}else{


								//alert("예외발생 광역단위");
								nationalPage++;
								$.ajax({
									url:"../trip/json/list"+'${trip}'+"/"+federalPage+"/"+"0"+"/"+"0",
									method:"GET",
									asyn :false,
									dataType:"json",
									headers :{
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success: function(returnData){
										flag =1;
										var data = returnData.list;
										if(data.length!=0){
																														
											for(var a =0; a<data.length;++a){
												
												var dpValue =
													
												 "<div class='col-md-4'>"+
											        "<div class='thumbnail'>"+
											          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
											          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
											          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
											          "<div class='caption'>"+
											            "<h5 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h5>"+
											            "<p>"+data[a].addr1+"</p>"+
											            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
											            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
											            	"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
											            "</p>"+
											          "</div>"+
											        "</div>"+
											      "</div>";
											      												
												$($(".row")[2]).append(dpValue);
											}
										}
									}
								});
										
							}
						}
					});
				}
			}
								
			
			
		});
	}
	
	/////////////////////////////////////////////무한스크롤

	/*
	function listSearch(page){
		
		var keyword ="${keyword}";
		var areaCode = "${areaCode}";
		var localName ="${localName}";
		if(areaCode ==""){
			areaCode ="0";
		}
		if(localName==""){
			localName="0";
		}
		
		var restJSON = {
			"pageNo" : pageNo,
			"areaCode":areaCode,
			"localName":localName,
			"keyword":keyword		 
		}
		
		
	
		$.ajax({
					
			url:"../trip/json/listSearch/",
			method:"POST",
			asyn :false,
			dataType:"json",
			data: restJSON,
			contentType: "application/json",
			success: function(returnData){
				var data = returnData.list;
				
				if(data.length != 0){
					//alert("정상작동");	
																
					for(var a =0; a<data.length;++a){
						
						var dpValue =
							
						 "<div class='col-md-4'>"+
					        "<div class='thumbnail'>"+
					          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
					          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
					          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
					          "<div class='caption'>"+
					            "<h5 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h5>"+
					            "<p>"+data[a].addr1+"</p>"+
					            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
					            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
					            	"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
					            "</p>"+
					          "</div>"+
					        "</div>"+
					      "</div>";
											
						$(".row").append(dpValue);	
					}
				}else{
					//alert("예외발생");
					localName ="0";
					alert(restJSON);
					federalPage++;
					$.ajax({
						url:"../trip/json/listSearch/",
						method:"POST",
						asyn :false,
						dataType:"json",
						data: restJSON,
						contentType: "application/json",
						success: function(returnData){
							flag =1;
							var data = returnData.list;
							if(data.length!=0){
																											
								for(var a =0; a<data.length;++a){
									
									var dpValue =
										
									 "<div class='col-md-4'>"+
								        "<div class='thumbnail'>"+
								          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
								          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
								          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
								          "<div class='caption'>"+
								            "<h5 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h5>"+
								            "<p>"+data[a].addr1+"</p>"+
								            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
								            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
								            	"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
								            "</p>"+
								          "</div>"+
								        "</div>"+
								      "</div>";
								      												
									$($(".row")[1]).append(dpValue);
								}
							}else{
								//alert("예외발생 광역단위");
								areaCode= "0";
								nationalPage++;
								$.ajax({
									url:"../trip/json/listSearch/",
									method:"POST",
									asyn :false,
									dataType:"json",
									data: restJSON,
									contentType: "application/json",
									success: function(returnData){
										flag =1;
										var data = returnData.list;
										if(data.length!=0){
																														
											for(var a =0; a<data.length;++a){
												
												var dpValue =
													
												 "<div class='col-md-4'>"+
											        "<div class='thumbnail'>"+
											          "<img data-src='holder.js/100%x200' alt='100%x200' src='" + data[a].firstimage2+ "' data-holder-rendered='true' style='height: 200px; width: 100%; display: block;'>"+
											          "<input type='hidden' name='contentid' value='" +data[a].contentid+"'/>"+
											          "<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
											          "<div class='caption'>"+
											            "<h5 id='thumbnail-label'>"+data[a].title+"<a class='anchorjs-link' href='#thumbnail-label'><span class='anchorjs-icon'></span></a></h5>"+
											            "<p>"+data[a].addr1+"</p>"+
											            "<p> <a href='#' class='btn btn-primary' role='button'>공유</a>"+ 
											            	"<a href='#' class='btn btn-default' role='button'>좋아요</a>"+
											            	"<a href='#'id='wish' class='btn btn-danger' role='button'>위시리스트</a>"+	
											            "</p>"+
											          "</div>"+
											        "</div>"+
											      "</div>";
											      												
												$($(".row")[2]).append(dpValue);
											}
										}
									}
								});
										
							}
						}
					});
				}
			}
		});
	}
	
	//*/

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
		//alert(111);
		
		getTheme(contentid, contenttypeid);
			
		
	  });
	});	
	
	///*
	
	// getTrip 대신에 생겨난 다이얼로그 화면(ajax 실행 후의 데이터를 다이얼로그로 송출)
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
				//alert(contenttypeid);
				//alert(contentid);
				
				$("#tourName").remove();
				$("#tourImg").remove();
				$("#tourAddress").remove();
				$("#tourCharge").remove();
				$("#tourOverView").remove();
				
				
				var tourName = "";
				var tourImage = "";
				var tourAddress ="";
				var tourCharge ="";
				var tourOverView ="";
				
				
				if(common.firstimage2 !=null){
					tourImage = "<img id ='tourImg' src='"+common.firstimage2+"' style='width:300px; height:200px;'/>";
				}else{
					tourImage = "<h5 id ='tourImg'> 제공사진 없음 </h5>";
				}				
				
				if(common.title != null){
					tourName= "<h5 id='tourName'> "+ common.title+"</h5>";
				}else{
					tourName= "<h5 id='tourName'> 제공정보 없음 </h5>";
				}
				
				if(common.addr1 != null){
					tourAddress= "<h5 id='tourAddress'>"+ common.addr1+"</h5>";
				}else{
					tourAddress= "<h5 id='tourAddress'> 제공정보 없음 </h5>";
				}
				
				if(fee.usefee != null){
					tourCharge= "<h5 id='tourCharge'>"+ fee.usefee+"</h5>";
				}else{
					tourCharge= "<h5 id='tourCharge'> 제공정보 없음 </h5>";
				}
				
				if(common.overview != null){
					tourOverView= "<h5 id='tourOverView'>"+ common.overview+"</h5>";
				}else{
					tourOverView= "<h5 id='tourOverView'> 제공정보 없음 </h5>";
				}
				
				$("#imageSpace").append(tourImage);
				$("#titleName").append(tourName);	
				$("#address").append(tourAddress);
				$("#fee").append(tourCharge);
				$("#description").append(tourOverView);
					
					
					
					//*/
				
			
				
				makeMap();
				makeDialog();
				$('#dialog').dialog('open');
				
				
				makeMap();
				makeDialog();
				$('#dialog').dialog('open');
				
				
			}
		});
	}
	
	//우리 디비에 데이터를 호출하고 저장할 때 호출
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
				alert("선저장");
			}
		})
	}
	
	//위시리스트에 저장할 때 사용
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
				//alert("위시리스트에 저장");
				//alert($("a[href='#']:contains('위시리스트')").index(this) );
				//$($("#wish")[$("a[href='#']:contains('위시리스트')").index(this)]).remove();
				
				//var CancelAppend = "<a href='#' class='btn btn-default' role='button' id='deleteWish' >위시리스트 취소</a>";
				
				//$($("#buttonTag")[$("a[href='#']:contains('위시리스트')").index(this)]).append(CancelAppend);
			}
		});
		
	}
	
	
	//리스트에 있는 위시리스트 클릭시 발생하는 이벤트
	$(function() {
	  $(document).on("click","#wish", function(e){
		  	var contentid =$($("input[name = 'contentid']")[$("a[href='#']:contains('위시리스트')").index(this)]).val();
			var contenttypeid =$($("input[name = 'contenttypeid']")[$("a[href='#']:contains('위시리스트')").index(this)]).val();
			//alert($("a[href='#']:contains('위시리스트')").index(this));
			//alert(contentid);
			//alert(contenttypeid);
			//alert("리스트 위시리스트 클릭");
			//해당 컨텐츠아이디에 있는 여행지를 호출없으면 저장, 있으면 업데이트 카운트
			addTripToDB(contentid, contenttypeid);
			
			//위에서 저장한 것을 위시리스트에 재저장 
			addWish(contentid);
			e.preventDefault();
			
			//alert($(".row ").index(this));
			//var CancelAppend = "<a href='#' class='btn btn-default' role='button' id='deleteWish' >위시리스트</a>";
			//alert($("div[class='col-xs-4']").index(this));

			//alert($("a[href='#']:contains('위시리스트')").index(this));
			//$($("#buttonTag")[$("a[href='#']:contains('위시리스트')").index(this)]).append(CancelAppend);
			//$($("#wish")[$("a[href='#']:contains('위시리스트')").index(this)]).remove();
		});
	})
	
		
	//getTheme 내에 있는 위시리스트 클릭시 발생하는 이벤트
	$(function(){
		$("#wishList").on("click",function(e){
			alert(contentid);
			alert(contenttypeid);
			alert("다이얼로그 위시리스트 클릭");
			addTripToDB(contentid, contenttypeid);
			addWish(contentid);
			e.preventDefault();
		});
	})
	
	
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('시구단위')").on("click" , function() {
			self.location = "/trip/list"+'${trip}'+"?pageNo=1&area=local"
		});
	});
		
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('광역단위')").on("click" , function() {
			self.location = "/trip/list"+'${trip}'+"?pageNo=1&area=federal"
		});
	});
	
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('전국단위')").on("click" , function() {
			self.location = "/trip/list"+'${trip}'+"?pageNo=1&area=national"
		});
	});
	
	/*
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$(".btn.btn-default:contains('Go')").on("click" , function() {
			var keyword = $(".form-control").val();
			$("form input:nth-child(2)").val(page-1);
			//alert($("form input:nth-child(2)").val());
			$("form").attr("method","POST").attr("action","/trip/listSearch").submit();
			
			//self.location = "/trip/listSearch?pageNo=1&keyword="+keyword
			//alert(keyword);
		});
	});
	//*/
		
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
	
		//마커를 생성
		var marker = new daum.maps.Marker({
		   position: markerPosition
		});
		
		//마커가 지도 위에 표시
		marker.setMap(map);
	  }
	</script>
	<style>
	
		img {
			cursor: pointer;
		}
		.col-md-4{
		height: 400px;
		
		}
		.row1{
			container :body;
		}
		
		
	</style>
	
	
	<title>여행지 찾기</title>
</head>
<body>
<jsp:include page="../layout/toolbar.jsp"></jsp:include>
 
<div class="container">
	
  <form>
	<div class = "row1" align="right">
	  <div class="col-lg-6">
 	   <div class="input-group">
   
      <input type="text" class="form-control" name="keyword" placeholder="통합 검색" align="right" value="">
      <input type="hidden" name="pageNo" value=""/>
      <input type="hidden" name="areaCode" value="${areaCode}"/>
      <input type="hidden" name="localName" value="${localName}"/>
      
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" align="right">Go</button>
      </span>
    
    </div>
  </div>
</div>
   </form>
<!-- 
	<span class="label label-default">Default</span>
	<input type="text" id="searchKeyword" value=""/>
	<a href="#" class="btn btn-default" role="button">조회</a>
-->	
</br>

</br>
	<ul class="nav nav-tabs">
	  <li role="presentation" ><a href="#">시구단위</a></li>
	</ul>

	<div class="bs-example" data-example-id="thumbnails-with-custom-content">
      	
	    
	    <div class="row">
	
		<c:forEach var ="list" items="${list}">
		<input type="hidden" id="pageNo" value="${pageNo}"/>
		    <div class="col-md-4">
		     
		       	<div class="thumbnail">
		          <img id="thumbnailImage" data-src="holder.js/100%x200" alt="100%x200" src="${list.firstimage2 }" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
		          <input type="hidden" name="contentid" value="${list.contentid}"/>
		          <input type="hidden" name="contenttypeid" value="${list.contenttypeid}"/>
		          <div class="caption">
			      	<h5 id="thumbnail-label">${list.title}
			        	<a class="anchorjs-link" href="#thumbnail-label">
			            	<span class="anchorjs-icon"></span>
			            </a>
			      	</h5>
			        <p>${list.addr1}</p>
			        <p id="buttonTag" name ="buttonTag"> 
			        	<a href="#" class="btn btn-primary" role="button">공유</a> 
			        	<a href="#" class="btn btn-default" role="button">좋아요</a>
			        	<c:if test="${!(list.flag== '1')}">			        	
			            	<a href="#" id="wish" class="btn btn-danger" role="button">위시리스트</a>
			            </c:if>
			            <c:if test="${!(list.flag=='0')}">			        	
			            	<a href="#" id="wish" class="btn btn-default" role="button">위시리스트 취소</a>
			            </c:if>	
			        </p>
		        </div>
			</div>
		</div>
	     	
      </c:forEach>
      
    </div>
    
    <div class="row">
    
	    <ul class="nav nav-tabs">
		  <li role="presentation" ><a href="#">광역단위</a></li> 
		</ul>
	    
    </div>
    
    <div class="row">    
	    <ul class="nav nav-tabs">
		  <li role="presentation"><a href="#">전국단위</a></li>
		</ul>
	    
    </div>
    
  </div>
</div>  
 
   

   
<div id="dialog" title="" >
	<!--  지도를 담는 공간 -->

	<table class="table">
      
      
      <tbody>
        <tr>
        	<td>
	          <div id="map" style="width:400px;height:200px;"></div>
	  		  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
	  	  	  <script type="text/javascript"></script>
        	</td>
        	
        	<td id="imageSpace">
        		
        	</td>
        </tr>
        
        
        <tr >
        
          	<td id="titleName"> </td>
          	<td></td>
          	
        </tr>
        <tr >
        
          	<td id="address"></td>
          	<td></td>
        </tr>
        <tr >
        
          	<td colspan="2"  id="fee"></td>
          	
        </tr>
        <tr >
        
          	<td colspan="2"   id="description"></td>
          	
        </tr>
      </tbody>
    </table>
      

 	<a href="#" class="btn btn-primary" role="button">공유</a> 
    <a href="#" class="btn btn-default" role="button">좋아요</a>
    <a href="#" id="wishList" class="btn btn-danger" role="button">위시리스트</a>

</div>	
 
</body>
</html>