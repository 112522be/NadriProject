<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#commentContainer{
		padding-bottom: 10px;
	}
</style>
<script type="text/javascript"> 
	var postNo;
	function listComment() {
		var postNo = $('input[name="postNo"]').val()
		$.ajax({
				url:"/common/listCommentByPost",
				method:"GET",
				data:{
					"postNo": postNo
				},
				success: function(JSONData) {
					for(i=0;i<JSONData.totalCount;i++){
						var html = '<div class="comments"><div class="col-xs-1" align="right"><input type="hidden" name="commentNo" value="'
						+JSONData.listComment[i].commentNo
						+'"><img src="/resources/images/00742106_105752.jpg" alt="${user.userId}" class="img-circle" width="40px" height="40px"></div><div class="col-xs-10"><span style="color: black;">'
						+JSONData.listComment[i].userId
						+'</span>&nbsp;<span style="color: gray; font-size:10pt;">'
						+JSONData.listComment[i].regDate
						+'</span><br/><span class="text">'+JSONData.listComment[i].text+'</span></div><div class="col-xs-1" align="right">';
						if("${loginUser.userId}"==JSONData.listComment[i].userId){
							html += '<span class="glyphicon glyphicon-pencil" style="font-size:10pt;"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-trash" style="font-size:10pt;"/>';
						}
						html += '</div><br/><hr/></div>'
						$('#commentContainer').append(html);
					}
				}
		})
	}
	function addComment() {
		var params = $("form[name=formData]").serialize();
		$.ajax({
					url:"/common/addComment",
					dataType:"json",
					method:"POST",
					headers : {
						"Accept" : "application/json",
					},
					data:params,
					success: function(JSONData) {
						$('input[name="text"]').val("")
						$('#commentContainer').empty()      
						listComment();
					},
					error: function() {
						alert("알 수 없는 오류가 발생했습니다.")
					}
		})
	}
	function updateComment(commentNo, text) {
		$.ajax({
			url: '/common/updateComment',
			method:'POST',
			headers:{
				"Accept" : "application/json",
			},
			data:{
				"commentNo": commentNo,
				"text": text
			},
			success: function() {
				$('input[name="text"]').val("")
				$('#commentContainer').empty()
				alert('수정을 완료했습니다.')
				listComment();
			},
			error: function() {
				$('input[name="text"]').val("")
				$('#commentContainer').empty()
				alert("수정을 실패했습니다.");
				listComment();
			}
			
		})
	}
	$(function() {
		postNo = $('input[name="postNo"]').val();
		$('button.btn.btn-info[name="submitComment"]').bind('click', function() {
			addComment();
		})
		$('#commentContainer').on('click','span.glyphicon.glyphicon-pencil',function() {
			var text = $('span.text').html()
			var commentNo = $($('input[name="commentNo"]')[$(this).parent().parent().index()]).val()
			$(this).parent().parent().html('<div class="col-xs-11"><input name="editText" class="form-control" type="text" value="'+text+'"/></div><div class="col-zs-1"><button type="button" name="update">수정</button></div><hr/>')
			$('#commentContainer').on('click', 'button[name="update"]', function() {
				text = $('input[name="editText"]').val();
				alert(text)
				updateComment(commentNo, text)
			})
		})
		$('#commentContainer').on('click', 'span.glyphicon.glyphicon-trash',function() {
			if(confirm("삭제하시겠습니까?")==true){
				var commentNo = $($('input[name="commentNo"]')[$(this).parent().parent().index()]).val()
				$.ajax({
					url: '/common/deleteComment',
					method:'POST',
					data:{
						"commentNo": commentNo,
						"postNo": postNo
					}, 
					success: function(JSONData) {
						$('input[name="text"]').val("")
						$('#commentContainer').empty()
						alert('삭제를 완료했습니다.')
						listComment();
					},
					error: function() {
						$('input[name="text"]').val("")
						$('#commentContainer').empty()
						alert("삭제에 실패했습니다.");
						listComment();
					}
					
				})
			}else{
				return;
			}
		})
	})
</script>
</head>
<body onload="listComment()">
		<div>
			<form name="formData">
				<input type="hidden" name="postNo" value="${community.postNo}">
				<input type="hidden" name="userId" value="${loginUser.userId}">
				<div class="col-xs-11">
						<input type="text" name="text" class="form-control" rows="3" placeholder="댓글을 입력하세요...">
				</div>
			</form>
			<div class="col-xs-1">
				<button align="right" type="button" class="btn btn-info" name="submitComment">저 장</button>
			</div>
			<br/><br/>
			<div id="commentContainer"></div>
		</div>
</body>
</html>