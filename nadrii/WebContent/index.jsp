<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>




<style>
.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}

.img {width:100%; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */
</style>
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	</br>
	</br>
	<div class="container">
<!-- Carousel Start -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<div class="item active">
				<div class="img">
   					<div class="scale">	
   						<img src="/images/chicago01.jpg" alt="chicago01" style="width: 100%;">
   					</div>
				</div>
   						
					<div class="carousel-caption">
						<h1>Beautiful Chicago Sunset</h1>
						<h4>This sunset would be the best one among what you see ever.</h4>
					</div>
				</div>


				<div class="item">
					<div class="img">
   						<div class="scale">
							<img src="/images/chicago02.jpg" alt="chicago02" style="width: 100%;">
						</div>
					</div>
					<div class="carousel-caption">
						<h1>Amazing Architectures</h1>
						<h4>You can enjoy the wonderful architecture forest.</h4>
					</div>
				</div>

				<div class="item">
					<div class="img">
   						<div class="scale">
							<img src="/images/chicago03.jpg" alt="chicago03" style="width: 100%;">
						</div>
					</div>
					<div class="carousel-caption">
						<h1>Fantastic Cloud Bean</h1>
						<h4>This statue of bean is so shine in middle of the park.</h4>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- Carousel End -->
		</div>
		<div class="container">
			<div class="row">
			    <div class="col-xs-6" style="padding-left: 15px; padding-right: 0px;">
			       	<div class="thumbnail">
			       	<div class="img">
   						<div class="scale">
			        	<img id="thumbnailImage" data-src="holder.js/100%x200" alt="100%x200" src="/images/uploadFiles/testImage1.jpg" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
			        	</div>
			        </div>
		    		    <input type="hidden" name="contentid" value="${list.contentid}"/>
		        		<input type="hidden" name="contenttypeid" value="${list.contenttypeid}"/>
		          	  	<div class="caption">
			      			<h4 id="thumbnail-label">여행지 이름은?
			        			<a class="anchorjs-link" href="#thumbnail-label">
			            			<span class="anchorjs-icon"></span>
			            		</a>
			      			</h4>
			        		<p>주소지</p>
			        		
		        		</div>
					</div>
				</div>
				<div class="col-xs-3" style="padding-left: 0px;	padding-right: 0px;">
			       	<div class="thumbnail">
			       		<div class="img">
   							<div class="scale">
			        			<img id="thumbnailImage" data-src="holder.js/100%x200" alt="100%x200" src="/images/uploadFiles/testImage2.jpg" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
			        		</div>
			        	</div>
		    		    <input type="hidden" name="contentid" value="${list.contentid}"/>
		        		<input type="hidden" name="contenttypeid" value="${list.contenttypeid}"/>
		          	  	<div class="caption">
			      			<h4 id="thumbnail-label">여행지 이름은?
			        			<a class="anchorjs-link" href="#thumbnail-label">
			            			<span class="anchorjs-icon"></span>
			            		</a>
			      			</h4>
			        		<p>주소지</p>
			        		
		        		</div>
					</div>
				</div>
				<div class="col-xs-3" style="padding-left: 0px; padding-right: 15px;">
			       	<div class="thumbnail">
			        	<div class="img">
   							<div class="scale">
			        			<img id="thumbnailImage" data-src="holder.js/100%x200" alt="100%x200" src="/images/uploadFiles/testImage3.jpg" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
			        		</div>
			        	</div>		
		    		    <input type="hidden" name="contentid" value="${list.contentid}"/>
		        		<input type="hidden" name="contenttypeid" value="${list.contenttypeid}"/>
		          	  	<div class="caption">
			      			<h4 id="thumbnail-label">여행지 이름은?
			        			<a class="anchorjs-link" href="#thumbnail-label">
			            			<span class="anchorjs-icon"></span>
			            		</a>
			      			</h4>
			        		<p>주소지</p>
			        		
		        		</div>
					</div>
				</div>
	     	</div>
		</div>
   </body>
</html>

