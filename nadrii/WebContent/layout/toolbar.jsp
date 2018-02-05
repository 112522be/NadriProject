<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<!-- javascript -->
	<!--<script src="/resources/js/jquery.js"></script>-->
	<script src="/resources/js/bootstrap.min.js"></script>
	
	<!-- css -->
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="/resources/css/flexslider.css" rel="stylesheet" />
	<link href="/resources/css/style.css" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="/resources/skins/default.css" rel="stylesheet" />
	<script type="text/javascript">
	
	
	$( function() {
		$("a[href='#' ]:contains('������ ����')").on("click" , function() {
			self.location = "../trip/getTheme"
		});
	});
	
	$(function(){
		$("a[href='#']:contains('������ �÷���')").on("click", function(){
			self.location = "../planner/json/getMyPlannerList"
		})
	})
	
	</script>
	
</head>
<body>
	<header>
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                   	</button>
					<a class="navbar-brand" href="../index.jsp"><span>Na</span>drii</a>
				</div>
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li><a href="#">������ ����</a></li>
						<li><a href="/comm/listComm">������ ������</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">������ �÷��� <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/planner/listPlanner">�÷��� �Խ���</a></li>
								<li><a href="/planner/addPlannerView.jsp">�÷��� �ۼ�</a></li>
							</ul>
						</li>
						<li><a href="/ticket/listTicket">������Ƽ��</a></li>
						<li><a href="/group/listGroup">�����̸���</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>