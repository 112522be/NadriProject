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
	

	//============= "장바구니" 화면이동 =============
    $( function() {
       $("a[href='#']:contains('Logout')").bind("click" , function() {
			alert("나갈거임");
	        self.location = "/user/logout";
       });
    });
	
	</script>

<!-- Nav -->
<nav id="nav">
	<ul>
		<li><a href="/user/login">Login</a></li>
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

