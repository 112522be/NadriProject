<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>listPurchase.jsp</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage)
	$('form').attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}


$( function(){
	$('td:nth-child(1)').bind("click", function(){
		var tranNo = $( $('td:nth-child(1) input[name="tranNo"]')[$('td:nth-child(1)').index(this)] ).val(); 
		self.location = "/purchase/getPurchase?tranNo=" + tranNo
	});
});


$( function(){
	$('td:nth-child(2)').bind("click", function(){
		var buyerUserId = $( $('td:nth-child(2) input[name="buyerUserId"]')[$('td:nth-child(2)').index(this)] ).val(); 
		self.location = "/user/getUser?userId=" + buyerUserId
	});
});


$( function(){
	$('td:nth-child(6)').bind("click", function(){
		var tranNo = $( $('input[name="tranNo"]')[$('td:nth-child(6)').index(this)] ).val(); 
	
		$.ajax({
						url : "/purchase/json/updateTranCode/" + tranNo + "/2",
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							location.reload();
						}

					}); // end of $.ajax
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
	
		<div class="page-header text-info">
	       <h3>구매목록조회</h3>
	    </div>

	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지
		    	</p>
		    </div>

			<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
    	</div>
    	
    	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">구매회원ID</th>
            <th align="left">받으실분 이름</th>
            <th align="left">받으실분 전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">
			  	<input type="hidden" name="tranNo" value="${ purchase.tranNo }">${ i }
		  	  </td>
			  
			  <td align="left">
				<input type="hidden" name="buyerUserId" value="${ purchase.buyer.userId }">${ purchase.buyer.userId }
	          </td>
			  
			  <td align="left">${ purchase.receiverName }</td>
			  
			  <td align="left">${ purchase.receiverPhone }</td>
			  
			  <td align="left">현재
				<c:if test="${ purchase.tranCode == '0' }">
					구매완료
				</c:if>
				<c:if test="${ purchase.tranCode == '1' }">
					배송중
				</c:if>
				<c:if test="${ purchase.tranCode == '2' }">
					배송완료
				</c:if> 상태 입니다.
			  </td>
			  
			  <td align="left">
			  	<c:if test="${ purchase.tranCode == '1' }">
					<input type="hidden" name="tranNo" value="${ purchase.tranNo }">물건도착
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
					
</body>
 
</html>