<style type="text/css">
li > span{
	position: relative !important;
	color: #555555 !important;
}
.block::before{
	color: #F05643 !important;
}
.full{
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
		url: "../like/json/listLikeByPost/"+postNo,
		dataType: "json",
		success:function(returnData){
			$(".like").empty();
			$(".like").append(returnData.totalCount);
			
			$("span.heart").empty();
			if( ((JSON.stringify(returnData.list)).indexOf("${loginUser.userId}") == -1) || ("${loginUser.userId}"=='') || ("${loginUser.userId}" == null) ){
            	$("span.heart").append('<i class="far fa-heart"></i>');
            }else{
                $("span.heart").append('<i class="fas fa-heart full"></i>');
            }
		}
	});	
}

$(function(){

	$("a.heart").bind("click", function(){
		
		if( $("span.heart svg").attr("data-prefix") == 'fas' ){
			deleteLike();
		}else{
			addLike();
		}
		
	});
	
});

</script>

<div style="padding: 30px">
<span style="padding-right: 15px">
<a href="#none" class="heart"><span class="heart"></span>&nbsp;<span class="like"></span></a>
</span>
<span>
<a href="#none" class="icon fa-comment">&nbsp;<span class="comment"></span></a>
</span>
</div>
