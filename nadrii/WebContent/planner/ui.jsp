<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		body {
			background:gray;
			margin: 0;
			padding: 0;
		}
		#wrap {
			width:100%;
			height:100px;
			background:white;
		}
		#sidebar {
			background: #333;
			width: 300px;
			height: 100%;
			top: 0;
			left: -300px;
			position: fixed;
		}
		#sidebar > ul {
			margin:0;
			padding: 0;
			top:50px;
			left:70px;
			position: absolute;
		}
		#sidebar li {
			margin: 0 0 20px;
			list-style: none;
		}
		#sidebar > button {
			background:#333;
			position: absolute;
			top: 150px;
			left: 300px;
			width: 52px;
			height: 52px;
			border: none;
			color: white;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	$(function(){
		var duration = 300;

		var side = $('#sidebar');
		var sidebt = side.find('button').on('click', function(){
			side.toggleClass('open');

			if(side.hasClass('open')) {
				side.stop(true).animate({left:'0px'}, duration);
				sidebt.find('span').text('CLOSE');
			}else{
				side.stop(true).animate({left:'-300px'}, duration);
				sidebt.find('span').text('OPEN');
			};
		});
	});
</script>
</head>
<body>
	<div id="wrap">
		<aside id="sidebar">
			<ul>
				<li><img src="img1.jpg" width="150" height="100"></li>
				<li><img src="img2.jpg" width="150" height="100"></li>
				<li><img src="img3.jpg" width="150" height="100"></li>
			</ul>
			<button><span class="btn_t"><img src=""></span></button>
		</aside>
	</div>
</body>
</html>