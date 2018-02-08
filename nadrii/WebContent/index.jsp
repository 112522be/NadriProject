<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
   <jsp:forward page="main.jsp" />
</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 위치 정보 가져오는 JS -->
<script type="text/javascript" src="../resources/js/tripLocation.js"></script>
<!-- Facebook Login -->
<!-- HTTPS required. HTTP will give a 403 forbidden response -->
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<script src="https://sdk.accountkit.com/ko_KR/sdk.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
   background-image: url(images\\cropped-1920-1080-819582.jpg);
   background-size: cover;
   background-repeat: no-repeat;
   background-position: center;
}

.row {
   margin: 100px;
}

.jumbotron {
   color: navy;
   background-color: rgba(160, 220, 220, 0.7);
}

.jumbotron p {
   font-weight: bold;
   font-style: italic;
}

.jumbotron h1 {
   font-stretch: wider;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
      
      //============= 회원원가입 화면이동 =============
      $( function() {
         //==> 추가된부분 : "addUser"  Event 연결
         $("a[href='#' ]:contains('회원가입')").on("click" , function() {
            alert("회원가입")
            self.location = "/user/addUser"
         });
      });
      
      //============= 로그인 화면이동 =============
      $( function() {
         //==> 추가된부분 : "addUser"  Event 연결
         $("a[href='#' ]:contains('로 그 인')").on("click" , function() {
            self.location = "/user/login"
         });
      });
      
      //============================== 정보검색 파트 ===================
      $( function() {
         $("a[href='#' ]:contains('박물관')").on("click" , function() {
            self.location = "../trip/listMuseum?pageNo=1&area=local"
         });
      });
      
      $( function() {
         $("a[href='#' ]:contains('전시관')").on("click" , function() {
            self.location = "../trip/listExhibit?pageNo=1&area=local"
         });
      });
      
      $( function() {
         $("a[href='#' ]:contains('미술관')").on("click" , function() {
            self.location = "../trip/listGallery?pageNo=1&area=local"
         });
      });
      
      $( function() {
         $("a[href='#' ]:contains('체험관')").on("click" , function() {
            self.location = "../trip/listExperience?pageNo=1&area=local"
         });
      });
      
      $( function() {
         $("a[href='#' ]:contains('민속마을')").on("click" , function() {
            self.location = "../trip/listTradition?pageNo=1&area=local"
         });
      });
      
      //============= "나들이티켓" 화면이동 =============
      $( function() {
         $("a[href='#' ]:contains('나들이티켓')").bind("click" , function() {
            self.location = "/ticket/listTicket"
         });
      });
      
      //============= "장바구니" 화면이동 =============
      $( function() {
         $("a[href='#' ]:contains('장바구니')").bind("click" , function() {
            self.location = "/purchase/listBasket"
         });
      });
      
      $( function() {
         //==> 추가된부분 : "addUser"  Event 연결
         $("a[href='#' ]:contains('종만아')").on("click" , function() {
            self.location = "/trip/listMuseum?pageNo=1&area=local"
         });
      });
      
      $(function(){
         $("a[href='#' ]:contains('로 그 아 웃')").on("click" , function() {
            if(confirm("로그아웃을 하시겠습니까?")){
            self.location = "/user/logoutProc";
            }
         });
      });
      -
      

   //============= FaceBook 로그인 START =============

   /*
    FirebaseChat.prototype.init = function(){ //...생략
        this.liFacebookBtn = document.getElementById('liFacebookBtn');
     } 
     // 초기 이벤트 바인딩  
           FirebaseChat.prototype.initEvent = function(){ 
        //...생략
           this.liFacebookBtn.addEventListener('click', this.onFacebookBtnClick.bind(this)); 
       }
        // 페이스북 로그인 버튼 클릭 / 
        FirebaseChat.prototype.onFacebookBtnClick = function(){ 
           var facebookProvider = new firebase.auth.FacebookAuthProvider(); 
           this.auth.setPersistence(firebase.auth.Auth.Persistence.SESSION) 
           .then(this.signInWithPopup.bind(this, facebookProvider)).(function(error) { 
              console.error('인증 상태 설정 중 에러 발생' , error); 
              }); 
           }    
        //*/
        
   // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(response);
      // The response object is returned with a status field that lets the
      // app know the current login status of the person.
      // Full docs on the response object can be found in the documentation
      // for FB.getLoginStatus().
      if (response.status === 'connected') {
        // Logged into your app and Facebook.
        testAPI();
      } else {
        // The person is not logged into your app or we are unable to tell.
        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
      }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
      FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
      });
    }

    window.fbAsyncInit = function() {
    FB.init({
      appId      : '{1974223106165873}',
      cookie     : true,  // enable cookies to allow the server to access
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });

    // Now that we've initialized the JavaScript SDK, we call
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      console.log(vm)
      vm.statusChangeCallback(response);
    });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "https://connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
      console.log('Welcome!  Fetching your information.... ');
      FB.api('/me', function(response) {
       /*  console.log('Successful login for: ' + response.name);
        document.getElementById('status').innerHTML =
          'Thanks for logging in, ' + response.name + '!'; */
 
          $("#facebookId").val(response.name);
          $("#facebookForm").submit();
      });
    }
    
    
   //============= FaceBook 로그인 END =============
    
   </script>





<!-- Bootstrap core CSS 
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template 
    <link href="css/4-col-portfolio.css" rel="stylesheet">
   -->

</head>

<body>

   <!-- ToolBar Start /////////////////////////////////////-->
<%--    <div class="navbar  navbar-default">

      <div class="container">

         <a class="navbar-brand" href="#">나들이 TEST</a>

         <!-- toolBar Button Start //////////////////////// -->
         <div class="navbar-header">
            <button class="navbar-toggle collapsed" data-toggle="collapse"
               data-target="#target">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
         </div>
         <!-- toolBar Button End //////////////////////// -->

         <div class="collapse navbar-collapse" id="target">
            <ul class="nav navbar-nav navbar-right">
               <c:if test="${loginUser eq null }">
                  <li><a href="#">회원가입</a></li>
                  <li><a href="#">로 그 인</a></li>
                  <li><a href="#">상품검색</a></li>
                  <li><a href="#">박물관</a></li>
                  <li><a href="#">전시관</a></li>
                  <li><a href="#">미술관</a></li>
                  <li><a href="#">체험관</a></li>
                  <li><a href="#">민속마을</a></li>
                  <li><a href="#">나들이티켓</a></li>
                  <li><a href="#"> 
                  
                  <!--  facebook login --> <script>
                      (function(d, s, id) {
                         var js, fjs = d.getElementsByTagName(s)[0];
                         if (d.getElementById(id)) return;
                         js = d.createElement(s); js.id = id;
                         js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=1974223106165873';
                         fjs.parentNode.insertBefore(js, fjs);
                       }(document, 'script', 'facebook-jssdk'))</script> <fb:login-button
                           scope="public_profile,email" onlogin="checkLoginState();">
                        Facebook Login                  
                     </fb:login-button>

                        <div id="status"></div> 
                        <!--  facebook login  end-->
                        
                        
                  </a></li>
               </c:if>

               <c:if test="${loginUser ne null }">
                  <li><a href="#">로 그 아 웃</a></li>
                  <li><a href="#">박물관</a></li>
                  <li><a href="#">전시관</a></li>
                  <li><a href="#">미술관</a></li>
                  <li><a href="#">체험관</a></li>
                  <li><a href="#">민속마을</a></li>
                  <li><a href="#">나들이티켓</a></li>
               </c:if>
            </ul>
         </div>

      </div>
   </div> --%>
   <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   <!-- ToolBar End /////////////////////////////////////-->

   <!--  화면구성 div Start /////////////////////////////////////-->
   <div class="container">

      <!-- 다단레이아웃  Start /////////////////////////////////////-->
      <div class="row">

         <!--  Main start /////////////////////////////////////-->
         <div class="col-md-9">
            <div class="jumbotron">
               <h1>나들이 TEST</h1>
               <p>If you got some good emotion for about your memory, that was
                  good memory to you.</p>
               <p>But, if you got some bad emotion, that was good experience
                  to you.</p>
               <div class="text-center">
                  <a class="btn btn-primary btn-lg" href="#" role="button">회원가입</a>
                  <a class="btn btn-warning btn-lg" href="#" role="button">로 그 인</a>
                  <a class="btn btn-danger btn-lg" href="#" role="button">나들이티켓</a>
                  <a class="btn btn-danger btn-lg" href="#" role="button">장바구니</a>
                  <a class="btn btn-warning btn-lg" href="#" role="button">종만아</a>
               </div>

            </div>
         </div>
         <!--  Main end /////////////////////////////////////-->



         <!--  Menu 구성 Start /////////////////////////////////////-->
                  <!--  Menu 구성 end /////////////////////////////////////-->
         <div class="fb-like" data-share="true" data-width="450"
            data-show-faces="true"></div>

      </div>
      <!-- 다단레이아웃  end /////////////////////////////////////-->

   </div>
   <!--  화면구성 div end /////////////////////////////////////-->


   

</body>

</html>