<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>listProduct.jsp</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- jQuery UI 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- JQuery tabs 사용 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        pre {
        	background-color: aqua;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetList(currentPage) {
	
	$("#currentPage").val(currentPage);
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
	
}

function fncLowPrice(currentPage) {
   	
	$("#currentPage").val(currentPage)
   	$("#lowPriceSearch").val("lowPrice")
 	$("#highPriceSearch").val(null)
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
}
 
function fncHighPrice(currentPage) {
	
	$("#currentPage").val(currentPage)
   	$("#lowPriceSearch").val(null)
   	$("#highPriceSearch").val("highPrice")
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
}

$(function(){
	$( "button.btn.btn-default:contains('검색')").bind("click", function(){
		fncGetList('${ search.currentPage }');
	});
});

$(function(){
	$("button:contains('낮은가격순')").bind("click", function(){
		fncLowPrice('${ search.currentPage }');
	});
});
				
$(function(){
	$("a[role='button' ]").bind("click", function(){
		fncHighPrice('${ search.currentPage }');
	});
});

$(function(){
	
//	$( ".ct_list_pop td:nth-child(5)" ).bind("mouseenter" , function() {
	$( "td:nth-child(6) > i" ).bind("click" , function() {

		var proTranCode = $( $('input[name="proTranCode"]')[$( "td:nth-child(6) > i" ).index(this)] ).val();
		var prodNo = $( $('td:nth-child(6) input[name="prodNo"]')[$( "td:nth-child(6)  > i" ).index(this)] ).val();
		
			if (proTranCode == '' || proTranCode == null) {
			var prodName = $(this).next().val().trim();
			
				$.ajax (
						{
							url : "/product/json/getProduct/" + prodNo ,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var displayValue = "<h5><pre>"
													+"상 품 번 호  : " + JSONData.prodNo + "<br/>"
													+"상  품  명 : " + JSONData.prodName + "<br/>"
													+"상품 이미지 : " + JSONData.fileName + "<br/>"
													+"상품상세정보 : " + JSONData.prodDetail + "<br/>"
													+"제 조 일 자 : " + JSONData.manuDate + "<br/>"
													+"가  격 : " + JSONData.price + " 원 <br/>"
													+"등 록 일 자 : " + JSONData.regDate + "<br/>"
													+ "</pre></h5>";

								$("h4").remove();
								$("h5").remove();					
								$( "#"+prodName+"" ).html(displayValue);
							}
					
				}); // end of $.ajax
				
			
			} 
			else if (proTranCode != null) {
				var prodName = $(this).next().val().trim();
				
				$.ajax (
						{
							url : "/product/json/getProduct/" + prodNo ,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var displayValue = '<h4><font color="red">' + "해당상품은 현재 구매하실 수 없습니다. [재고없음]" 
													+ "</font></h4><br/>"
													+ "<h5><pre>"
													+"상 품 번 호 : " + JSONData.prodNo + "<br/>"
													+"상  품  명 : " + JSONData.prodName + "<br/>"
													+"상품 이미지 : " + JSONData.fileName + "<br/>"
													+"상품상세정보 : " + JSONData.prodDetail + "<br/>"
													+"제 조 일 자 : " + JSONData.manuDate + "<br/>"
													+"가  격 : " + JSONData.price + " 원 <br/>"
													+"등 록 일 자 : " + JSONData.regDate + "<br/>"
													+ "</pre></h5>";
													
								$("h4").remove();
								$("h5").remove();
								$( "#"+prodName+"" ).html(displayValue);
							}
				}); // end of $.ajax
			}
		
	});
		
});

$(function(){
	
	$( "td:nth-child(3)" ).bind("dblclick" , function() {
		
		var proTranCode = $( $('input[name="proTranCode"]')[$( "tbody td:nth-child(3)" ).index(this)] ).val();
		var prodNo = $( $('td:nth-child(6) input[name="prodNo"]')[$( "td:nth-child(3)" ).index(this)] ).val();
		
		if ( "${user.userId}" != 'admin' && "${user.userId}" != 'manager' ) { 
			if (proTranCode == '' || proTranCode == null) {
				self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${ menu }";
			} else {
				alert("해당상품은 현재 구매하실 수 없습니다.")
			}
		} else {
			self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${ menu }";
		}
	
	});
});


$(function(){
	$( "tbody td:nth-child(5):contains('배송하기')" ).bind("click" , function() {
		
		var prodNo = $( $('input[name="prodNo"]')[$( "tbody td:nth-child(5)" ).index(this)] ).val();
			
	$.ajax({
						url : "/purchase/json/updateTranCodeByProd/" + prodNo + "/1",
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
	
/*	
$( function() {

    $( "#searchKeyword" ).autocomplete({
      source : function(request, response){
    	  
    	  $.ajax ({
    			method : "POST",
    			dataType : "json",
    			headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					response( $.map( data, function( item ) {
				        return {
				            label: item.name,
				            value: item.value,
				        }
				}));
				},
    	  })
      },
      minLength : 1
    });
  });
*/

	

	
	
	</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->


	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>${ menu == 'manage' ? "판매상품관리" : "판매상품목록" }</h3>
	    </div>


	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Nunc tincidunt</a></li>
			<li><a href="#tabs-2">Proin dolor</a></li>
			<li><a href="#tabs-3">Aenean lacinia</a></li>
		</ul>
		<div id="tabs-1">
			<p>TEST Screen[1]</p>
		</div>
		<div id="tabs-2">
			<p>TEST Screen[2]</p>
		</div>
		<div id="tabs-3">
			<p>TEST Screen[3]</p>
		</div>
	</div>
	
	
	 <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>



	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지
		    	</p>
		    </div>

			<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				  <!-- 가격정렬에 대한 값을 보내는 부분 -->
				  <input type="hidden" class="lowPrice" id="lowPriceSearch" name="lowPriceCondition" value=""/>
				  <input type="hidden" class="highPrice" id="highPriceSearch" name="highPriceCondition" value=""/>
				  
				</form>
	    	</div>
	    	
    	<div class="col-md-6 text-left">
    		<p>
	  			<button type="button" class="btn btn-info btn-xs" >
	  				<span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span> 낮은가격순
	  			</button> 
   		  		<a class="btn btn-info btn-xs" href="#" role="button">
   		  			<span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span>
   		  				높은가격순
   		  		</a>
			</p>
		</div>

    	</div>
    	
    	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">상품이미지</th>
            <th align="left">상품명</th>
            <th align="left">가격</th>
            <th align="left">${ menu == 'manage' ? "배송현황" : "판매현황" }</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  
			  <td align="left">
			  	<c:if test = "${ empty product.fileName }">
					<img src="http://placehold.it/50X50" />
				</c:if>
				<c:if test = "${ product.fileName != null }">
					<img src="/images/uploadFiles/${ product.fileName }" height="50px"/>
				</c:if>
			  </td>
			  
		  	  <td align="left" title="더블클릭 : 상품정보 확인">
					${ product.prodName }
		  	  </td>
		  	  
			  <td align="left">${ product.price }</td>
			  
			  <td align="left">
			  	<c:if test = "${ menu == 'search' }">
					<c:if test = "${ product.proTranCode == null }">판매중</c:if> 
					<c:if test = "${ product.proTranCode != null }">재고 없음</c:if>
				</c:if>
				<c:if test = "${ menu == 'manage' }">
					<c:if test = "${ product.proTranCode == null }">판매중</c:if>
					<c:if test = "${ product.proTranCode == '0' }">구매완료 
						<input type="hidden" name="prodNo" value="${ product.prodNo }">배송하기
					</c:if>
					<c:if test = "${ product.proTranCode == '1' }">배송중</c:if>
					<c:if test = "${ product.proTranCode == '2' }">배송완료</c:if>
				</c:if>
			  </td>
			  
			  <td align="left"  >
			  	<i class="glyphicon glyphicon-ok" id="${ product.prodName }"></i>
				<input type="hidden" name="prodName" value="${ product.prodName }">		  
				<input type="hidden" name="prodNo" value="${ product.prodNo }">
				<input type="hidden" name="proTranCode" value="${ product.proTranCode }">
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
