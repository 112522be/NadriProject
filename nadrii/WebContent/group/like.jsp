<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style type="text/css">
li > span{
	position: relative !important;
	color: #555555 !important;
}
.icon.fa-heart.block::before{
	color: #f43d3d !important;
}
.icon.fa-heart.none::before{
	color: rgba(160, 160, 160, 0.3) !important;
}
</style>
<script type="text/javascript">

var postNo = $("input[name=postNo]").val();

function addLike(){
	
	$.ajax({
		url: "../like/json/addLike/"+postNo,
		method: "POST",
		dataType: "json",
		success:function(returnData){
			getLike();
		}
	});	
}

function deleteLike(){
	
	$.ajax({
		url: "../like/json/deleteLike/"+postNo,
		method: "POST",
		dataType: "json",
		success:function(returnData){
			getLike();
		}
	});	
}

var likeCount;

function getLike(){
	
	$.ajax({
		url: "../like/json/getLikeUserList/"+postNo,
		dataType: "json",
		success:function(returnData){
			$(".like").empty();
			$(".like").append(returnData.totalCount);
			
			if( (JSON.stringify(returnData.list)).indexOf("${loginUser.userId}") == -1){
				$(".icon.fa-heart").addClass('none');
				$(".icon.fa-heart").removeClass('block');
				
			}else{
				$(".icon.fa-heart").addClass('block');
				$(".icon.fa-heart").removeClass('none');
			}

			$(".icon.fa-heart.none").bind("click", function(){
				addLike();
			});
			$(".icon.fa-heart.block").bind("click", function(){
				deleteLike();
			});
			
		}
	});	
	
}

</script>

	<footer>
	<ul class="stats">
		<li><a href="#none" class="icon fa-heart"><span class="like"></span></a></li>
		<li><a href="#none" class="icon fa-comment">128</a></li>
	</ul>
	</footer>
