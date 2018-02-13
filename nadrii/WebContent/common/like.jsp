<style type="text/css">
li > span{
	position: relative !important;
	color: #555555 !important;
}
.block::before{
	color: #f43d3d !important;
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

	<footer>
	<ul class="stats">
		<li><a href="#none" class="icon fa-heart"><span class="like"></span></a></li>
		<li><a href="#none" class="icon fa-comment">128</a></li>
	</ul>
	</footer>
