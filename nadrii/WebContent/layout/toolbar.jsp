<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">
	
	//========== '나들이 정보' 버튼 처리 Event ==========
	$( function() {
		$("a[href='#' ]:contains('나들이 정보')").on("click" , function() {
			self.location = "../trip/getTheme"
		});
	});

	$( function() {

		console.log("세션 정보 : ${session}")
		
		$("a[href='#' ]:contains('나들이 티켓')").bind("click" , function() {
			self.location = "/ticket/listTicket"
		});

	});


	$( function() {

        $(".glyphicon.glyphicon-envelope").bind("click" , function() {
        	//alert("쪽지함")
      		self.location = "/message/listMessage"
        });
    });
	

	
	$(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".dropbtn01").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
	
	$(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".dropbtn02").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
	
	//============="login" ==============
		
		function validateCheck(){
			var id = $("#userId").val();
			var password = $("#password").val();
			//alert(id+ ":::"+password);
			
			if(id == null || id ==""){
				alert("아이디 입력해라");
				return;
			}
			
			if(password == null || password=="" ){
				alert("비번은 쳐야지 그래야 안쳐맞지")
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").submit();
		}
	
		//============= '로그인' 버튼 클릭 Event 처리 =============
		$( function() {
			$(".btn.btn-primary.joinBtn:contains('로 그 인')").bind("click" , function() {
				alert("로그인");
				validateCheck();
			});
		});
	

	//============= "장바구니" 화면이동 =============
    $( function() {
       $("a[href='#']:contains('Logout')").bind("click" , function() {
			alert("나갈거임");
	        self.location = "/user/logout";
       });
    });
	
  //================= '로그아웃' 버튼 클릭 Event 처리========================
	
	$(function(){
     $("a[href='#' ]:contains('로 그 아 웃')").on("click" , function() {
        if(confirm("로그아웃을 하시겠습니까?")){
        self.location = "/user/logout";
        }
     });
  });
  
//================= '추가정보 입력' 버튼 클릭 Event 처리========================
	
	$(function(){
     $("a[href='#' ]:contains('추가정보 입력')").on("click" , function() {
        self.location = "/user/addUserViewPlus.jsp";
     });
  });
  
//================= '내정보 보기' 버튼 클릭 Event 처리========================
	
	$(function(){
     $("a[href='#' ]:contains('내정보 보기')").on("click" , function() {
        self.location = "/user/getUser.jsp";
     });
  });

	
	</script>

<!-- Nav -->
<nav id="nav">
	<ul>
		<li><a href="../user/login">Login</a></li>
		<li><a href="../trip/getTheme">나들이 정보</a></li>
		<li><a href="../comm/listComm">나만의 나들이</a></li>
		<li><a href="#">나들이 플래너</a>
			<ul>
				<li><a href="/planner/getUserPlannerList">플래너 게시판</a></li>
				<li><a href="/planner/addPlannerView">플래너 작성</a></li>
				<li><a href="/planner/getMyPlannerList">나만의 플래너</a></li>
				<!-- 
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Phasellus consequat</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
							</ul>
							 --></li>
		<!-- 					<li><a href="#">Veroeros feugiat</a></li> -->
	</ul>
	</li>
	<li><a href="/ticket/listTicket">나들이 티켓</a>
		<ul>
			<li><a href="/purchase/listBasket">장바구니</a></li>
			<li><a href="/purchase/listPurchase">구매한 티켓</a></li>
		</ul>
	</li>
	
	
	
	
	
	<li><a href="/group/listGroup">나들이 모임</a></li>
	<!-- 	
				<li><a href="left-sidebar.html">Left Sidebar</a></li>
				<li><a href="right-sidebar.html">Right Sidebar</a></li>
				<li><a href="no-sidebar.html">No Sidebar</a></li>
		 		-->
	</ul>
	
</nav>
