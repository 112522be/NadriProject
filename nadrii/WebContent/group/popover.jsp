<!DOCTYPE html>

<html>

  <head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  	<script>

  	$(function () {
  	  $('[data-toggle="popover"]').popover({ html: true,
  													 container: 'body' });
  	  
  	});

   </script>

  </head>

  <body>
<div class="container">


	<span data-container="body" data-toggle="popover" data-placement="bottom" data-content="profile <hr/> message">
		Popover on bottom
	</span>

</div>
  </body>

</html>
