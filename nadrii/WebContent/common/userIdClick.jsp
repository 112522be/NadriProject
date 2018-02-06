<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<style type="text/css">
html
{
	margin: 0;
	padding: 0;
	height: 100%;
	background: #C7B7A7 url( "http://oi64.tinypic.com/i3zbs7.jpg" );
	-webkit-tap-highlight-color: rgba( 0, 0, 0, 0 );
}
.cog
{
	position: absolute;
	top: 0;
	right: 0;
	padding: 5px;
	margin-top: 5px;
	margin-right: 6px;
	border: none;
	color: #f5fafa;
	font-size: 20px;
}

.admin-text:hover, .cog:hover { cursor: pointer; color: #555555; }

input#toggle { display: none; }
input#toggle ~ .menu { display: block; }
input#toggle:checked ~ .menu { display: none; }

#toggle{
	background-color: transparent;
}

.menu a
{
	display: block;
	background: #F8F8F8;
	width: 120px;
	height: 40px;
	padding: 0 0 0 10px;
	font: bold 13px Helvetica, sans-serif;
	text-transform: uppercase;
	text-decoration: none;
	color: transparent;
	color: rgba( 0, 0, 0, 0.7 );
	line-height: 40px;
	box-shadow: 0 1px 1px rgba( 0, 0, 0, 0.2 );
}

.menu a:nth-child( 2 )
{
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.menu a:last-child
{
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
}

.menu a:hover { color: #555555; }

.menu a:hover > .octicon { color: #555555; }

.glyphicon
{
	float: right;
	margin-top: 12px;
	margin-right: 12px;
	font-size: 15px;
	color: #000000;
	color: rgba( 0, 0, 0, 0.7 );
	opacity: 0.8;
}

.arrow
{
	width: 0;
	height: 0;
	margin-left: 15px;
	border-left: 7px solid transparent;
	border-right: 7px solid transparent;
	border-bottom: 9px solid #F8F8F8;
}

</style>
</head>
<body>
<div class="content">
	<div class="admin-panel"><label for="toggle" class="admin-text">Admin Settings</label></div>
	<input type="checkbox" id="toggle">
	<label class="cog octicon octicon-gear" for="toggle"></label>
	<div class="menu">
		<div class="arrow"></div>
			<a href="#">프로필 조회<span class="glyphicon glyphicon-user"></span></a>
			<a href="#">쪽지 보내기<span class="glyphicon glyphicon-envelope"></span></a>
	</div>
</div>
</body>
</html>