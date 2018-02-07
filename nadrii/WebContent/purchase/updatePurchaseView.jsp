<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="utf-8">

<title>updatePurchaseView.jsp</title>

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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncUpdatePurchase() {
	
	// Validation Check
	var name = $("input[name='receiverName']").val();
	var addr = $("input[name='dlvyAddr']").val();
	var phone = $("input[name='receiverPhone']").val();
	
	if(name == null || name.length < 1) {
		alert("구매자 이름은 필수 입력 사항입니다.");
	}
	if(addr == null || name.length < 1) {
		alert("구매자 주소는 필수 입력 사항입니다.");
	}
	if(phone == null || name.length < 1) {
		alert("구매자 연락처는 필수 입력 사항입니다.");
	}
	
	$("form").attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${ purchase.tranNo }").submit();
	
}

$(function(){
	$("button").bind("click", function(){
		fncUpdatePurchase();
	});
});

$(function(){
	$("a[href='#']").bind("click", function(){
		//history.go(-1);
		self.location = "/purchase/getPurchase?tranNo=${ purchase.tranNo }"
	});
});

//=================== "희망배송일자" Event 연결 ===================
$(function() {
	$("#dlvyDate").datepicker({
		dateFormat: "yymmdd",
		minDate: 1,
		changeMonth: true,
		changeYear: true 
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
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	       <!-- 
	       	<h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	       -->
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${ user.userId }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">구매자 아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    	<select class="form-control" name="paymentOption">
					<option value="1" ${ purchase.paymentOption == '1' ? 'selected' : '' }>현금구매</option>
					<option value="2" ${ purchase.paymentOption == '2' ? 'selected' : '' }>신용구매</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">받으실분 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${ purchase.receiverName }" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">받으실분 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ purchase.receiverPhone }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">받으실분 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ purchase.dlvyAddr }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${ purchase.dlvyRequest }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" placeholder="미 기입시 입금 확인 후 바로 출고합니다.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수&nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>