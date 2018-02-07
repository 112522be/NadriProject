<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$( function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$(".list-group-item:contains('���� ������')").on("click" , function() {
			//alert("���� ������")
			self.location= "/message/listMessage"
		});
	});
	
	$( function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$(".list-group-item:contains('���� ������')").on("click" , function() {
			//alert("���� ������")
			self.location ="/message/listSendMessage"
		});
	});
	
	$( function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$(".list-group-item:contains('���� ������')").on("click" , function() {
			//alert("���� ������")
			self.location ="/message/listMessageToRead"
		});
	});
	/*
	$(function(){
		$("tr td:nth-child(4)").on("click",function(){
			var messageNo = $($("input[name='messageNo']")[$("tr td:nth-child(4)").index(this)]).val();
			self.location="/message/getMessage?messageNo="+messageNo
			//alert($("tr td:nth-child(3)").index(this));
			//alert("�ٸ޽���");
			
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
		$("a[href='#']:contains('����')").on("click", function(){
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
				alert(count+"���� �޽����� �����Ǿ����ϴ�");
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
				<li class="list-group-item list-group-item-warning" >���� ������</li>
				<li class="list-group-item list-group-item-success" >���� ������</li>
				<li class="list-group-item list-group-item-info" >���� ������</li>
			</div>
			<div class="col-xs-1"></div>
			<div class="col-xs-9" align="center" style="padding-left: 0px; padding-right: 0px;">
				
		<div class="panel panel-warning" >
	      <!-- Default panel contents -->
	      <div class="panel-heading"style="padding-bottom: 0px;padding-top: 0px;">������ ����</div>
	      <div class="panel-body" style="padding-bottom: 0px;padding-top: 0px; height: 0px"></div>
	
	      <!-- Table -->
	      <table class="table">
	        <thead>
	          <tr>
	            <th></th>
	            <th>���� ���</th>
	            <th>�޴� ���</th>
	            <th>����</th>
	            <th>���� �ð�</th>
	          </tr>
	        </thead>
	        <div class="widget">
  				
		        <tbody class="message">
		        	<c:forEach var ="list" items="${list}">
		        	
		          <tr>
		        	
		        	<td>
		        		<input type="checkbox" name="checkbox" id="checkbox" value="${list.messageNo}">
		        	</td>		        	
		        	
		        	
		        	<!-- �̳� Ŭ���� ���� ������ -->
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
		            
		            <!-- �̳� Ŭ���� ���� ���� -->
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
		   <a class="btn btn-default btn-md" href="#" role="button">����</a>
		   <a class="btn btn-default btn-md" href="#" role="button">â �ݱ�</a>
    	</div>
	</div>			
		<!-- row �� -->
		
		</div>
		
	
	<!-- �����̳� �� -->
	</div>

</body>
</html>