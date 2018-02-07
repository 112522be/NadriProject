<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

// var userId = '${group.join.userId}';
var groupNo = ${group.join.groupNo};

$(function(){
	
});

function addJoin(){
	
	$.ajax({
		url: "../join/json/addJoin/"+groupNo,
		method: "POST",
		dataType: "json",
		success:function(returnData){
			$('.userIdContainer').empty();
			getMemberList();			
		}
	});	
}

function deleteJoin(){
	$.ajax({
		url: "../join/json/deleteJoin/"+groupNo,
		method: "POST",
		dataType: "json",
		success:function(returnData){
			$('.userIdContainer').empty();
			getMemberList();	
		}	
	});	
}

function getMemberList(){
	
	$.ajax({
		url: "../join/json/getJoinMemberList/"+groupNo,
		method: "GET",
		dataType: "json",
		success:function(returnData){
			
			$('.totalCount').empty();
			$(".totalCount").append("<sub>총 참여자 수 "+returnData.totalCount+"명</sub>");
			
			for(var i=0; i<returnData.totalCount; i++){
				$(".userIdContainer").append("<tr><td>"+returnData.list[i].userId+"</td></tr>");
				
				if( ( JSON.stringify(returnData) ).indexOf( '${loginUser.userId}' ) != -1){
					$('.joinButtonContainer').empty();
					$(".joinButtonContainer").append('<a href="#" class="button fit delete" name="concel" style="float: right">join concel</a>');
				}else{
					$('.joinButtonContainer').empty();
					$(".joinButtonContainer").append('<a href="#" class="button fit modify" name="join" style="float: right">join</a>');
				}
				
				
			}
			
			$("a[name='join']").on("click", function(){
				addJoin();
			});	
			
			$("a[name='concel']").on("click", function(){
				if(returnData.totalCount == 1){
					alert("모임 마스터는 모임 참여를 취소할 수 없습니다.");
					return;
				}
				if(confirm("참여를 취소하시겠습니까?")==true){
					deleteJoin();
					alert("취소되었습니다.");
				}else{
					return;	
				}	
			});	
		}
	});	
}

</script>
</head>
<body onload="getMemberList()">
	<table>

		<thead>
			<tr>
				<th>참여자 목록<div class="totalCount" style="position: relative; float: right;"></div></th>
			</tr>
		</thead>
		
		<tbody class="userIdContainer"></tbody>
		
		<tfoot>
			<tr>
				<td class="joinButtonContainer"></td>
			</tr>
		</tfoot>

	</table>
</body>
</html>