<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="euc-kr">

<head>
	<meta charset="utf-8">
	<title>Moderna - Bootstrap 3 flat corporate template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<!-- css -->
	<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="../resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="../resources/css/jcarousel.css" rel="stylesheet" />
	<link href="../resources/css/flexslider.css" rel="stylesheet" />
	<link href="../resources/css/style.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- Theme skin -->
	<link href="../resources/skins/default.css" rel="stylesheet" />

	<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->
	<style type="text/css">
	body {
		background: #fff;
		font-family: 'Source Sans Pro', sans-serif;
		font-size: 19pt;
		font-weight: 300;
		line-height: 1.75em;
		color: #888;
	}
		.item {
			box-shadow: 0 0.05em 0.15em 0 rgba(0, 0, 0, 0.05);
			margin-bottom: 40px;
		}

		.item header {
			background: #fff;
			margin: 0;
			padding: 1em 0 1em 0;
			font-size: 0.8em;
		}

		.item header h3 {
			font-size: 1em;
		}
		
	</style>
</head>

<body>
	<div id="wrapper">

		<!-- start header -->
		<header>
			<jsp:include page="/layout/toolbar.jsp"></jsp:include>
		</header>
		<!-- end header -->
	
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="portfolio-categ filter">
							<li class="all active"><a href="#">All</a></li>
							<li class="web"><a href="#" title="">cate1</a></li>
							<li class="web"><a href="#" title="">cate2</a></li>
							<li class="icon"><a href="#" title="">cate3</a></li>
							<li class="graphic"><a href="#" title="">cate4</a></li>
						</ul>
						<div class="clearfix">
						</div>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="web">
									
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
							
									<li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
						
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
								
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="graphic">
								
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
						
									<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="web">
					
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
			
									<li class="item-thumbs col-lg-3 photography" data-id="id-4" data-type="web">
					
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
				
									<li class="item-thumbs col-lg-3 photography" data-id="id-5" data-type="icon">
										
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									
									
									<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="web">
										
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
										<header>
											<h3>Ipsum Feugiat</h3>
										</header>
									</li>
								
									<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="graphic">
										
										<img src="../resources/images/8.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
										<header>
											<h3>Ipsum Feugiat</h3>
										</header>
									</li>
									
								</ul>
							</section>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../resources/js/jquery.easing.1.3.js"></script>
	<script src="../resources/js/jquery.fancybox.pack.js"></script>
	<script src="../resources/js/jquery.fancybox-media.js"></script>
	<script src="../resources/js/google-code-prettify/prettify.js"></script>
	<script src="../resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="../resources/js/portfolio/setting.js"></script>
	<script src="../resources/js/jquery.flexslider.js"></script>
	<script src="../resources/js/animate.js"></script>
	<script src="../resources/js/custom.js"></script>

</body>

</html>
