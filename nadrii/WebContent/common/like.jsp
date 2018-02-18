<style type="text/css">
li > span{
	position: relative !important;
	color: #555555 !important;
}
.block::before{
	color: #F05643 !important;
}
</style>
<script type="text/javascript">

var postNo = $("input[name='postNo']").val();

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
			
			if( (JSON.stringify(returnData.list)).indexOf("${loginUser.userId}") != -1){
				$(".icon.fa-heart").toggleClass("block", true);
			}else{
				$(".icon.fa-heart").toggleClass("block", false);
			}
		}
	});	
}

$(function(){

	$(".icon.fa-heart").bind("click", function(){
		if( $(".icon.fa-heart").hasClass("block") ){
			deleteLike();
		}else{
			addLike();
		}
	});
	
});

</script>

<div style="padding: 30px">
<span style="padding-right: 15px">
<a href="#none" class="icon fa-heart">&nbsp;<span class="like"></span></a>
</span>
<span>
<a href="#none" class="icon fa-comment">&nbsp;<span class="comment"></span></a>
</span>
</div>
