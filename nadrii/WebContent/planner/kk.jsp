<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>


<style type="text/css">

.box{
	animation-duration: 3s;
  animation-name: slidein;
}
@keyframes slidein {
  from {
    margin-left: 100%;
    width: 300%
  }

  to {
    margin-left: 0%;
    width: 100%;
  }
}



div {
    width: 100px;
    height: 50px;
    background-color: red;
    font-weight: bold;
    position: relative;
    -webkit-animation: mymove 5s infinite; /* Safari 4.0 - 8.0 */
    animation: mymove 5s infinite;
}


#div1 {animation-timing-function: linear;}

@keyframes mymove {
    from {left: 0px;}
    to {left: 300px;}
}


.btn{
	border:0px;
}




.wrap-loading{ /*화면 전체를 어둡게 합니다.*/

    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');

}

    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }

    .display-none{ /*감추기*/
        display:none;
    }
</style>


</head>
<body>
<script type="text/javascript">
$(function () {
  $('[data-toggle="popover"]').popover()
})




$(function() {
   
   
   var name = new Array();
   var img = new Array();
   var code = new Array();
   var item1 = new Array();
   var item2 = new Array();
   var item3 = new Array();
   
   
          $.ajax( 
            {
               url : "/livingInfo/rest/movieInfo",
               method : "GET" ,
               dataType : "json" ,
               
               headers : {
                  "Accept" : "application/json",
                  "Content-Type" : "application/json"
               },
               success : function(JSONData , status) {
                           
                  
                  for(var i=0; i<10; i++){
                     
                  }
                  
                   for(var i=0; i<10; i++){
                  
                      $.ajax( 
                              {
                                 
                                 });   
                   }
                   
                   for(var i=0; i<10; i++){
                      $.ajax( 
                              {

                                 
                                 });   
                   }
                   
                  
                   for(var i=0; i<5; i++){
                      $.ajax( 
                              {
                                 
                                 });   
                   }
                   
               
                  
                  
                  for(var i=0; i<10; i++){
                     
                           
                  }
                   
                  $(".container").html(displayValue);
                   
               },beforeSend:function(){


                    $('.wrap-loading').removeClass('display-none');  //여거~~~~~~~~~~~~

                }
                ,complete:function(){


                    $('.wrap-loading').addClass('display-none');//이거~~~~~~~~~~~~

             

                }

      });
</script>

<div class="wrap-loading display-none">

    <div><img src="/resources/images/planner/test01.gif" /></div> 

</div>   

<div class="box">kkkkk</div>

<div id="div1">linear</div>


<button class="btn"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png"></button>



<button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>

</body>


</html>