
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous"> 
	
	<!-- Optional theme -->	
	<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> -->
	
	
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/helios/assets/css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="/resources/helios/assets/css/ie8.css" /><![endif]-->
	
	<!-- Scripts -->
	
	<script src="/resources/helios/assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
	<script src="/resources/helios/assets/js/jquery.dropotron.min.js"></script>
	
	<script src="/resources/helios/assets/js/jquery.scrolly.min.js"></script>
	
	<script src="/resources/helios/assets/js/jquery.onvisible.min.js"></script> 
	
	<script src="/resources/helios/assets/js/skel.min.js"></script>
	
	<script src="/resources/helios/assets/js/util.js"></script>
	
	<!--[if lte IE 8]><script src="/resources/helios/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources/helios/assets/js/main.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

	
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
		if($(".4u").val()==null){
			listTrip();
		}
	});
	
	////////////////////////////////////////modal chang//////////
	$(function(){
		$('#myModal').modal();  
	})
	
	//스크롤이 끝에 닿을 때를 캐치
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
																
					for(var a =0; a<data.length;++a){
						
						var dpValue =						
							"<article class='4u 12u(mobile) special'>"+
								"<a href='#' class='image featured'><img src='"+data[a].firstimage2+"' alt='' /></a>"+
								"<input type='hidden' name='contentid' value='"+data[a].contentid+"'/>"+
      							"<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"+
								"<header>"+
									"<h3><a href='#'>"+data[a].title+"</a></h3>"+
								"</header>"+
								"<p>"+data[a].addr1+"</p>"+
							"</article>";
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
										
										"<article class='4u 12u(mobile) special'>"
										+"<a href='#' class='image featured'><img src='"+data[a].firstimage2+"' alt='' /></a>"
										+"<input type='hidden' name='contentid' value='"+data[a].contentid+"'/>"
		      							+"<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"
										+"<header>"
											+"<h3><a href='#'>"+data[a].title+"</a></h3>"
										+"</header>"
										+"<p>"+data[a].addr1+"</p>"
									+"</article>";
									$(".row").append(dpValue);
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
													
													"<article class='4u 12u(mobile) special'>"
													+"<a href='#' class='image featured'><img src='"+data[a].firstimage2+"' alt='' /></a>"
													+"<input type='hidden' name='contentid' value='"+data[a].contentid+"'/>"
					      							+"<input type='hidden' name='contenttypeid' value='"+data[a].contenttypeid+"'/>"
													+"<header>"
														+"<h3><a href='#'>"+data[a].title+"</a></h3>"
													+"</header>"
													+"<p>"+data[a].addr1+"</p>"
												+"</article>";
											      												
												$(".row").append(dpValue);
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
	
	function makeDialog(){
		/* 
		$('#dialog').dialog({
			 	modal: true,
			    autoOpen: false,
			    resizable: false,
			    width: 800
		});
		*/
	}
	
	$(function(){
		/*
		$('#dialog').dialog({
		 	modal: true,
		    autoOpen: false,
		    resizable: false,
		    width: 800
		});
		//*/
	});
	
	
	var contenttypeid;
	var contentid;
	
	$(function() {
	  $(document).on("click","img", function(e){
	    
		contentid =$($("input[name = 'contentid']")[$("img").index(this)]).val();
		contenttypeid =$($("input[name = 'contenttypeid']")[$("img").index(this)]).val();
		e.preventDefault();	 
		alert(contentid);
		alert(contenttypeid);
		
		getTheme(contentid, contenttypeid);
		
		
	  });
	});	
	
	///*
	
	// getTrip 대신에 생겨난 다이얼로그 화면(ajax 실행 후의 데이터를 다이얼로그로 송출)
	// ajax로 나온 좌표값을 기존에 생성했던 지도로 옮기기 위한 전역 변수
	
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
				
				/*
				makeMap();
				makeDialog();
				$('#dialog').dialog('open');
				
				
				makeMap();
				makeDialog();
				$('#dialog').dialog('open');
				*/
				
			}
		});
	}
	
	//우리 디비에 데이터를 호출하고 저장할 때 호출
	function addTripToDB(contentid, contenttypeid){
		$.ajax({
			url:"../trip/json/getTrip/"+contentid+"/"+contenttypeid+"",
			method:"GET",
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
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success:function(){
			}
		});
		
	}
	
	
	//리스트에 있는 위시리스트 클릭시 발생하는 이벤트
	$(function() {
	  $(document).on("click","#wish", function(e){
		  	var contentid =$($("input[name = 'contentid']")[$("#wish").index(this)]).val();
			var contenttypeid =$($("input[name = 'contenttypeid']")[$("#wish").index(this)]).val();

			///*
			alert(contentid);
			alert(contenttypeid);
			//*/

			//해당 컨텐츠아이디에 있는 여행지를 호출없으면 저장, 있으면 업데이트 카운트
			addTripToDB(contentid, contenttypeid);
			
			//위에서 저장한 것을 위시리스트에 재저장 
			addWish(contentid);
			e.preventDefault();
			
		});
	})
	
		
	//getTheme 내에 있는 위시리스트 클릭시 발생하는 이벤트
	$(function(){
		$("#wishList").on("click",function(e){
			e.preventDefault();
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
	
	///*
	$( function() {
		$("a[href='#']:contains('Go')").on("click" , function() {
			var keyword = $(".form-control").val();
			$("form input:nth-child(2)").val(page-1);
			$("form").attr("method","POST").attr("action","/trip/listSearch").submit();
		});
	});
	//*/
	
	$(function() {
		$(document).on("click",".btn.btn-default:contains('좋아요')", function(e){
			alert("좋아요");
			
		});
	});
	
	
	$(function() {
		$(document).on("click",".btn.btn-default:contains('공유')", function(e){
			alert("공유");
		});
	});
	
	
	
	
	////////////////////모달////////////////////
	
	$(function() {
		$("a[href='#']:contains('장바구니 담기')").bind('click', function(e) {
			contentid =$($("input[name = 'contentid']")[$("a[href='#']:contains('장바구니 담기')").index(this)]).val();
			contenttypeid =$($("input[name = 'contenttypeid']")[$("a[href='#']:contains('장바구니 담기')").index(this)]).val();
			e.preventDefault();	 
			alert(contentid);
			alert(contenttypeid);
			
			
			getTheme(contentid, contenttypeid);
		})
	});

		
		
	</script>
	<!-- 지도 생성하는 CDN 및 맵에 담을 내용 확인 -->
	
	  <script type="text/javascript">
	  function makeMap(){
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(mapy,mapx), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
		
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
		
		#dialog{
			background-color: #8f8287;
		
		}
		
		.wrapper.style1{
			background-color: #e6f9ff;
		}
		.4u header{
			background-color:#fff 
		}
		#wish{
			background: #000000;
			padding-bottom: 4px;
			padding-top: 4px;
			padding-left: 4px;
			padding-right: 4px;
		}
	</style>

	<title>여행지 찾기</title>
</head>
<body class="no-sidebar">
		<div id="page-wrapper">

				<div id="header">

						<div class="inner">
							<header>
								<h1><a href="index.html" id="logo">나들이 정보</a></h1>
							</header>
						</div>
						
						<jsp:include page="/layout/toolbar.jsp" />

				</div>
				<div class="wrapper style1">

					<section id="features" class="container special">
						<div class="row">
							<c:forEach var ="list" items="${list}">
								<article class="4u 12u(mobile) special">
									<a href="#" class="image featured"><img src="${list.firstimage2}" alt="" width="282px" height="187px"/></a>
									<input type="hidden" name="contentid" value="${list.contentid}"/>
		          					<input type="hidden" name="contenttypeid" value="${list.contenttypeid}"/>
									<header>
										<h3><a href="#">${list.title}</a></h3>
										<h3></h3>
										<a href="#" name="basket" class="button" data-toggle="modal" data-target="#myModal">장바구니 담기</a>
									</header>
									<p>${list.addr1}</p>
								</article>
								
							</c:forEach>
						</div>
					</section>

				</div> 				
				
				
		<!-- 		
	<div id="dialog" title="" >
		<table class="table">
    		<tbody>
        		<tr>
        			<td>
			        	<div id="map" style="width:400px;height:200px;"></div>
			  			
			  	  		
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
        		<tr>
					<td colspan="2"  id="fee"></td>
          	    </tr>
        		<tr>
                  	<td colspan="2"   id="description"></td>
          		</tr>
      		</tbody>
      		
    	</table>
    	
     	<footer>
		<a href="#banner" class="button circled scrolly">좋아요</a>
		<a href="#banner" class="button circled scrolly">공유</a>
		<a href="#banner" id="wish" class="button circled scrolly">위시리스트</a>
		</footer>
	</div>	-->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-copy" aria-hidden="true"> </span>
						
					</h4>
				</div>
			
				<div class="modal-body">
					<h2 class="text-center title"></h2><br>
					<table class="table">
    		<tbody>
        		<tr>
        			<td>
        			
        			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4ea92513a5052cd0e179704e1e5f5f"></script>
			        <div id="map" style="width:400px;height:200px;"></div>	
			  			
			  	  		
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
        		<tr>
					<td colspan="2"  id="fee"></td>
          	    </tr>
        		<tr>
                  	<td colspan="2"   id="description"></td>
          		</tr>
      		</tbody>
      		
    	</table>
				</div>
			
				<div class="modal-footer">
					<button type="button" class="button" data-dismiss="modal">저장하기</button>
					<button type="button" class="button" name="modalCancel" data-dismiss="modal">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button>
				</div>
			</div>
		</div>
	</div>
	
	
						
</body>
</html>