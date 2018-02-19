<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../resources/helios/assets/css/main.css" />
</head>
<body>

<div id="header">
				<div class="inner">
					<header>
						<h1><a href="../index.jsp" id="logo">나들이 정보</a></h1>
					</header>
				</div>
						
				<jsp:include page="/layout/toolbar.jsp" />
			</div>

<section class="carousel">
				<div class="reel" style="overflow: visible; transform: translate(0px, 0px);">
					
					<article class="">
						<a href="#" class="image featured"><img name = "museum" src="../resources/images/tripIcon/gyeongbok-palace-3077864_1920.jpg" alt="" style="height: 250.42px;"></a>
						<header>
							<h3><a href="#">박물관</a></h3>
						</header>
						<p>휴식과 배움을 동시에</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img name = "exhibition" src="../resources/images/tripIcon/snow-708859_1920.jpg	" alt="" style="height: 250.42px;"></a>
						<header>
							<h3><a href="#">전시관</a></h3>
						</header>
						<p>새로운 것을 보고 싶다면</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img name = "gallery" src="../resources/images/tripIcon/pohang-1613923_1920_eidt.jpg" alt="" style="height: 250.42px;"></a>
						<header>
							<h3><a href="#">미술관</a></h3>
						</header>
						<p>섬세하고 감각적이라면</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img name = "experience" src="../resources/images/tripIcon/art-1837073_1920.jpg" alt="" style="height: 250.42px;"></a>
						<header>
							<h3><a href="#">체험관</a></h3>
						</header>
						<p>보는 게 다 가 아니다</p>
					</article>

					<article class="">
						<a href="#" class="image featured"><img name = "tradition" src="../resources/images/tripIcon/republic-of-korea-2675868_1920.jpg" alt="" style="height: 250.42px;"></a>
						<header>
							<h3><a href="#">민속마을</a></h3>
						</header>
						<p>그 속에서 살아가리</p>
					</article>

				</div>
				<span class="forward" style="display: block;"></span>
				<span class="backward" style="display: block;"></span>
			</section>
			
		<script src="../resources/helios/assets/js/jquery.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.dropotron.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.scrolly.min.js"></script>
		<script src="../resources/helios/assets/js/jquery.onvisible.min.js"></script>
		<script src="../resources/helios/assets/js/skel.min.js"></script>
		<script src="../resources/helios/assets/js/util.js"></script>
		<script src="../resources/helios/assets/js/main.js"></script>
</body>
</html>