<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>updateProduct.jsp</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- 상품제조일자 Calendar Event -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- //////////////////// CSS //////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
    </style>

<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

$(function(){
	$( "button" ).bind("click", function(){
		self.location = "/product/listProduct?menu=manage"
				$("form").attr("method" , "POST")
	});
});


	</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodNo }</div>
		</div><hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodName }</div>
		</div><hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">
			<c:if test = "${ product.fileName == null }">
				<img src="http://placehold.it/300X300" />
			</c:if>
			<c:if test = "${ product.fileName != null }">
				<img src="/images/uploadFiles/${ product.fileName }" height="240"/><br/>
			</c:if>
		</div>
		</div><hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${ product.price }</div>
		</div><hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${ product.regDate }</div>
		</div><hr/>
		
		<div class="row">
		    <div class="col-md-12 text-center">
		      <button type="button" class="btn btn-primary">확&nbsp;인</button>
		    </div>
		  </div>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
</body>
</html>