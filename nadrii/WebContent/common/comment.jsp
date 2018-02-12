<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
	img {
	    width: 100px;
	    height:100px;
	    border-radius: 50px; /* 이미지 반크기만큼 반경을 잡기*/
	}	
	
	.radius-box {
		 width: 100px;
		 height: 100px;
		 background-image:url("배경이미지경로");
		 border-radius: 150px; /* 레이어 반크기만큼 반경을 잡기*/    
		 display: table-cell;
		 vertical-align: middle;
		 color: #ffffff;
		 font-weight: bold;
		 text-align: center;
	}
</style> -->
<script type="text/javascript"> 
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
						$('#commentContainer').append('<hr/><div class="container"><h4>'+JSONData.listComment[i].userId+'</h4><div class="col-xs-9"><p/>'+JSONData.listComment[i].text+'</div><div class="col-xs-3" align="right">'+JSONData.listComment[i].regDate+'</div></div>');
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
	$(function() {

		$('button.btn.btn-info[name="submitComment"]').bind('click', function() {
			addComment();
		})
	})
</script>
</head>
<body onload="listComment()">
	<div class="container" align="center">
		<div>
			<form name="formData">
				<input type="hidden" name="postNo" value="${community.postNo}">
				<input type="hidden" name="userId" value="${loginUser.userId}">
				<div class="col-xs-10">
						<input type="text" name="text" class="form-control" rows="3" placeholder="댓글을 입력하세요...">
				</div>
			</form>
			<div class="col-xs-2">
				<button align="right" type="button" class="btn btn-info" name="submitComment">저 장</button>
			</div>
			<div id="commentContainer"></div>
		</div>
	</div>
</body>
</html>