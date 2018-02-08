<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$(".list-group-item:contains('받은 쪽지함')").on("click" , function() {
			//alert("받은 쪽지함")
			self.location= "/message/listMessage"
		});
	});
	
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$(".list-group-item:contains('보낸 쪽지함')").on("click" , function() {
			//alert("보낸 쪽지함")
			self.location ="/message/listSendMessage"
		});
	});
	
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$(".list-group-item:contains('읽을 쪽지함')").on("click" , function() {
			//alert("읽을 쪽지함")
			self.location ="/message/listMessageToRead"
		});
	});
	/*
	$(function(){
		$("tr td:nth-child(4)").on("click",function(){
			var messageNo = $($("input[name='messageNo']")[$("tr td:nth-child(4)").index(this)]).val();
			self.location="/message/getMessage?messageNo="+messageNo
			//alert($("tr td:nth-child(3)").index(this));
			//alert("겟메시지");
			
			//alert(messageNo);
		});
	});
	*/
	
	$(function(){
		$("tr td:nth-child(4)").on("click",function(){
			var messageNo = $($("input[name='checkbox']")[$("tr td:nth-child(4)").index(this)]).val();
			alert(messageNo)
			//self.location="/message/getMessage?messageNo="+messageNo
			window.open("/message/getMessage?messageNo="+messageNo,"getMessge","width=300, height=350,status=no, scrollbars=no, location=no");
		});
	});
	
	$(function(){
		$("a[href='#']:contains('삭제')").on("click", function(){
			var checkedMessage = $("input[name=checkbox]").length;
			var checkedMessageCount = $("input[name=checkbox]:checked").length;
			var messageNoList="";
			//var array = new Array();
			
			for (var i = 0; i < checkedMessageCount; i++) {
				if(i != checkedMessageCount-1){
					var value = $($("input[name=checkbox]:checked")[i]).val()+","; 
				}else{
					var value = $($("input[name=checkbox]:checked")[i]).val();
				}
				
				messageNoList += value;
			
			}
			
			alert(messageNoList);
			deleteMessage(messageNoList);
		});
	});
	
	function deleteMessage(messageNoList){
		$.ajax({
			url:"/message/json/deleteMessage/"+messageNoList,
			method:"GET",
			dataType:"json",
			headers :{
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},						
			success: function(returnData){
				var count = returnData.count;
				alert(count+"개의 메시지가 삭제되었습니다");
			}
			
		});
	}
	
</script>


<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-xs-2" align="center" style="padding-left: 0px; padding-right: 0px;">
				<li class="list-group-item list-group-item-warning" >받은 쪽지함</li>
				<li class="list-group-item list-group-item-success" >보낸 쪽지함</li>
				<li class="list-group-item list-group-item-info" >읽을 쪽지함</li>
			</div>
			<div class="col-xs-1"></div>
			<div class="col-xs-9" align="center" style="padding-left: 0px; padding-right: 0px;">
				
		<div class="panel panel-warning" >
	      <!-- Default panel contents -->
	      <div class="panel-heading"style="padding-bottom: 0px;padding-top: 0px;">쪽지함 내용</div>
	      <div class="panel-body" style="padding-bottom: 0px;padding-top: 0px; height: 0px"></div>
	
	      <!-- Table -->
	      <table class="table">
	        <thead>
	          <tr>
	            <th></th>
	            <th>보낸 사람</th>
	            <th>받는 사람</th>
	            <th>내용</th>
	            <th>보낸 시간</th>
	          </tr>
	        </thead>
	        <div class="widget">
  				
		        <tbody class="message">
		        	<c:forEach var ="list" items="${list}">
		        	
		          <tr>
		        	
		        	<td>
		        		<input type="checkbox" name="checkbox" id="checkbox" value="${list.messageNo}">
		        	</td>		        	
		        	
		        	
		        	<!-- 이놈 클릭시 답장 보내기 -->
		        	<td>
		        	<c:if test="${! empty list.senderId}">
		        	${list.senderId}
		    	        <input type="hidden" id ="senderId" name="senderId" value="${list.senderId}"/>
		    	    </c:if>
		            </td>
		            
		            <td>
		            <c:if test="${! empty list.receiverId}">
		            	${list.receiverId }
		            </c:if>
		            
		            
		            </td>
		            
		            <!-- 이놈 클릭시 내용 보기 -->
		            <td>
		            <c:if test="${! empty list.text}">
		            	${list.text}
		            </c:if>	
		            </td>
		            
		            <td>
		            <c:if test="${! empty list.text}">
		            	${list.regDate}
		            </c:if>
		            </td>
		            
		            
		          </tr>
		          </c:forEach>
		          
		        </tbody>
		      </table>
		   </div>
		   <a class="btn btn-default btn-md" href="#" role="button">삭제</a>
		   <a class="btn btn-default btn-md" href="#" role="button">창 닫기</a>
    	</div>
	</div>			
		<!-- row 끝 -->
		
		</div>
		
	
	<!-- 컨테이너 끝 -->
	</div>

</body>
</html>