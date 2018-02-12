<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<title>나들이 티켓 목록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!--  ///////////////////////// imperfect templete ////////////////////////// -->
	<link rel="stylesheet" href="../resources/assets/css/main.css?version=1041" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listTicket").submit();
	
}

	//=================== "4 kind of sorting" Event 연결 =================== 
	$(function() {

		$("a[href='#']:contains('제목순')").bind("click", function(event) {
//			alert("제목순")
			event.preventDefault();
			self.location="/ticket/listTicket?searchCondition=A";
		})
	});

	$(function() {
		$("a[href='#']:contains('조회순')").bind("click", function(event) {
			event.preventDefault();
			self.location="/ticket/listTicket?searchCondition=B";
		})
	});

	$(function() {
		$("a[href='#']:contains('수정일순')").bind("click", function(event) {
			event.preventDefault();
			self.location="/ticket/listTicket?searchCondition=C";
		})
	});

	$(function() {

		$("a[href='#']:contains('생성일순')").bind("click", function(event) {
			event.preventDefault();
			self.location="/ticket/listTicket?searchCondition=D";
		})
	});
	
	function fncGetTicketSort(searchCondition) {
		
		alert("[value check] ==> " + searchCondition)
		
		self.location="/ticket/listTicket"
				
	}

	//=================== "상세조회" Event 연결 ===================
	$(function() {
		$("a[href='#' ]:contains('상세조회')").bind("click", function(event) {
//			alert("상세조회")
			
			event.preventDefault();

			var contentId = $( $('input[name="contentId"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var contentTypeId = $( $('input[name="contentTypeId"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var title = $( $('input[name="title"]')[$( ".btn.btn-success" ).index(this)] ).val();
			var encodeTitle = encodeURI(encodeURIComponent(title));
			console.log('contentId : ' + contentId)
			console.log('contentTypeId : ' + contentTypeId)
			console.log('title : ' + title)
			console.log('encodeTitle : ' + encodeTitle)
			
			self.location ="/ticket/getTicket?"
					+ "contentId=" + contentId 
					+ "&contentTypeId=" + contentTypeId
					+ "&title=" + encodeTitle;
			
		});
	});
	
	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/getTicket").submit();
	}
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div id="main">
		<section id="portfolio" class="two">
	<div class="container">

		<div class="page-header text-right">
			<h3>나들이 티켓</h3>
			<h5 class="text-muted">
				조회하실 티켓 정보를 <strong class="text-danger">선택</strong>해 주세요.
			</h5>
		</div>

	<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<!-- JQUERY nav-pills Start -->
			<div>
				<!-- Nav tabs -->
				<header>
				<ul class="nav nav-pills">
					<li role="presentation" class=""><a href="#">제목순</a></li>
					<li role="presentation" class=""><a href="#">조회순</a></li>
					<li role="presentation" class=""><a href="#">수정일순</a></li>
					<li role="presentation" class=""><a href="#">생성일순</a></li>
				</ul>
				</header>
			</div>
			<!-- JQUERY nav-pills End -->

		<div class="col-md-12 text-right">
			<p class="text-primary">
				&lt; 현재 ${ resultPage.pageNo } 페이지 / 전체 ${ resultPage.totalCount } 건수 &gt;
			</p>
		</div>

			<hr />

					<section>
						<h3>Lists</h3>
						<div class="row">
							<div class="6u 12u$(medium)">
								<h4>Unordered</h4>
								<ul>
									<li>Dolor pulvinar etiam.</li>
									<li>Sagittis adipiscing.</li>
									<li>Felis enim feugiat.</li>
								</ul>
								<h4>Alternate</h4>
								<ul class="alt">
									<li>Dolor pulvinar etiam.</li>
									<li>Sagittis adipiscing.</li>
									<li>Felis enim feugiat.</li>
								</ul>
							</div>
							<div class="6u$ 12u$(medium)">
								<h4>Ordered</h4>
								<ol>
									<li>Dolor pulvinar etiam.</li>
									<li>Etiam vel felis viverra.</li>
									<li>Felis enim feugiat.</li>
									<li>Dolor pulvinar etiam.</li>
									<li>Etiam vel felis lorem.</li>
									<li>Felis enim et feugiat.</li>
								</ol>
								<h4>Icons</h4>
								<ul class="icons">
									<li><a href="#" class="icon fa-twitter"><span
											class="label">Twitter</span></a></li>
									<li><a href="#" class="icon fa-facebook"><span
											class="label">Facebook</span></a></li>
									<li><a href="#" class="icon fa-instagram"><span
											class="label">Instagram</span></a></li>
									<li><a href="#" class="icon fa-github"><span
											class="label">Github</span></a></li>
								</ul>
							</div>
						</div>
						<h3>Actions</h3>
						<div class="row">
							<div class="6u 12u$(medium)">
								<ul class="actions">
									<li><a href="#" class="button">Default</a></li>
									<li><a href="#" class="button">Default</a></li>
									<li><a href="#" class="button">Default</a></li>
								</ul>
								<ul class="actions small">
									<li><a href="#" class="button small">Small</a></li>
									<li><a href="#" class="button small">Small</a></li>
									<li><a href="#" class="button small">Small</a></li>
								</ul>
								<ul class="actions vertical">
									<li><a href="#" class="button">Default</a></li>
									<li><a href="#" class="button">Default</a></li>
									<li><a href="#" class="button">Default</a></li>
								</ul>
								<ul class="actions vertical small">
									<li><a href="#" class="button small">Small</a></li>
									<li><a href="#" class="button small">Small</a></li>
									<li><a href="#" class="button small">Small</a></li>
								</ul>
							</div>
							<div class="6u 12u$(medium)">
								<ul class="actions vertical">
									<li><a href="#" class="button fit">Default</a></li>
									<li><a href="#" class="button fit">Default</a></li>
								</ul>
								<ul class="actions vertical small">
									<li><a href="#" class="button small fit">Small</a></li>
									<li><a href="#" class="button small fit">Small</a></li>
								</ul>
							</div>
						</div>
					</section>

					<section>
						<h3>Table</h3>
						<h4>Default</h4>
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>Name</th>
										<th>Description</th>
										<th>Price</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Item One</td>
										<td>Ante turpis integer aliquet porttitor.</td>
										<td>29.99</td>
									</tr>
									<tr>
										<td>Item Two</td>
										<td>Vis ac commodo adipiscing arcu aliquet.</td>
										<td>19.99</td>
									</tr>
									<tr>
										<td>Item Three</td>
										<td>Morbi faucibus arcu accumsan lorem.</td>
										<td>29.99</td>
									</tr>
									<tr>
										<td>Item Four</td>
										<td>Vitae integer tempus condimentum.</td>
										<td>19.99</td>
									</tr>
									<tr>
										<td>Item Five</td>
										<td>Ante turpis integer aliquet porttitor.</td>
										<td>29.99</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"></td>
										<td>100.00</td>
									</tr>
								</tfoot>
							</table>
						</div>

						<h4>Alternate</h4>
						<div class="table-wrapper">
							<table class="alt">
								<thead>
									<tr>
										<th>Name</th>
										<th>Description</th>
										<th>Price</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Item One</td>
										<td>Ante turpis integer aliquet porttitor.</td>
										<td>29.99</td>
									</tr>
									<tr>
										<td>Item Two</td>
										<td>Vis ac commodo adipiscing arcu aliquet.</td>
										<td>19.99</td>
									</tr>
									<tr>
										<td>Item Three</td>
										<td>Morbi faucibus arcu accumsan lorem.</td>
										<td>29.99</td>
									</tr>
									<tr>
										<td>Item Four</td>
										<td>Vitae integer tempus condimentum.</td>
										<td>19.99</td>
									</tr>
									<tr>
										<td>Item Five</td>
										<td>Ante turpis integer aliquet porttitor.</td>
										<td>29.99</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"></td>
										<td>100.00</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</section>

					<section>
						<h3>Buttons</h3>
						<ul class="actions">
							<li><a href="#" class="button big">Big</a></li>
							<li><a href="#" class="button">Default</a></li>
							<li><a href="#" class="button small">Small</a></li>
						</ul>
						<ul class="actions fit">
							<li><a href="#" class="button fit">Fit</a></li>
							<li><a href="#" class="button fit">Fit</a></li>
							<li><a href="#" class="button fit">Fit</a></li>
						</ul>
						<ul class="actions fit small">
							<li><a href="#" class="button fit small">Fit + Small</a></li>
							<li><a href="#" class="button fit small">Fit + Small</a></li>
							<li><a href="#" class="button fit small">Fit + Small</a></li>
						</ul>
						<ul class="actions">
							<li><a href="#" class="button icon fa-download">Icon</a></li>
							<li><a href="#" class="button icon fa-upload">Icon</a></li>
							<li><a href="#" class="button icon fa-save">Icon</a></li>
						</ul>
						<ul class="actions">
							<li><span class="button disabled">Disabled</span></li>
							<li><span class="button disabled icon fa-download">Disabled</span></li>
						</ul>
					</section>

					<section>
						<h3>Form</h3>
						<form method="post" action="#">
							<div class="row uniform">
								<div class="6u 12u$(xsmall)">
									<input type="text" name="demo-name" id="demo-name" value=""
										placeholder="Name" />
								</div>
								<div class="6u$ 12u$(xsmall)">
									<input type="email" name="demo-email" id="demo-email" value=""
										placeholder="Email" />
								</div>
								<div class="12u$">
									<div class="select-wrapper">
										<select name="demo-category" id="demo-category">
											<option value="">- Category -</option>
											<option value="1">Manufacturing</option>
											<option value="1">Shipping</option>
											<option value="1">Administration</option>
											<option value="1">Human Resources</option>
										</select>
									</div>
								</div>
								<div class="4u 12u$(small)">
									<input type="radio" id="demo-priority-low" name="demo-priority"
										checked> <label for="demo-priority-low">Low</label>
								</div>
								<div class="4u 12u$(small)">
									<input type="radio" id="demo-priority-normal"
										name="demo-priority"> <label
										for="demo-priority-normal">Normal</label>
								</div>
								<div class="4u$ 12u$(small)">
									<input type="radio" id="demo-priority-high"
										name="demo-priority"> <label for="demo-priority-high">High</label>
								</div>
								<div class="6u 12u$(small)">
									<input type="checkbox" id="demo-copy" name="demo-copy">
									<label for="demo-copy">Email me a copy</label>
								</div>
								<div class="6u$ 12u$(small)">
									<input type="checkbox" id="demo-human" name="demo-human"
										checked> <label for="demo-human">Not a robot</label>
								</div>
								<div class="12u$">
									<textarea name="demo-message" id="demo-message"
										placeholder="Enter your message" rows="6"></textarea>
								</div>
								<div class="12u$">
									<ul class="actions">
										<li><input type="submit" value="Send Message" /></li>
										<li><input type="reset" value="Reset" /></li>
									</ul>
								</div>
							</div>
						</form>
					</section>

					<section>
						<h3>Image</h3>
						<h4>Fit</h4>
						<div class="box alt">
							<div class="row uniform">
								<div class="12u$">
									<span class="image fit"><img src="/resources/imperfect/images/pic02.jpg"
										alt="" /></span>
								</div>
								<div class="4u">
									<span class="image fit"><img src="/resources/imperfect/images/pic04.jpg"
										alt="" /></span>
								</div>
								<div class="4u">
									<span class="image fit"><img src="/resources/imperfect/images/pic05.jpg"
										alt="" /></span>
								</div>
								<div class="4u$">
									<span class="image fit"><img src="/resources/imperfect/images/pic06.jpg"
										alt="" /></span>
								</div>
								<div class="4u">
									<span class="image fit"><img src="/resources/imperfect/images/pic06.jpg"
										alt="" /></span>
								</div>
								<div class="4u">
									<span class="image fit"><img src="/resources/imperfect/images/pic04.jpg"
										alt="" /></span>
								</div>
								<div class="4u$">
									<span class="image fit"><img src="/resources/imperfect/images/pic05.jpg"
										alt="" /></span>
								</div>
								<div class="4u">
									<span class="image fit"><img src="/resources/imperfect/images/pic05.jpg"
										alt="" /></span>
								</div>
								<div class="4u">
									<span class="image fit"><img src="/resources/imperfect/images/pic06.jpg"
										alt="" /></span>
								</div>
								<div class="4u$">
									<span class="image fit"><img src="/resources/imperfect/images/pic04.jpg"
										alt="" /></span>
								</div>
							</div>
						</div>
						<h4>Left &amp; Right</h4>
						<p>
							<span class="image left"><img src="images/pic07.jpg"
								alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis
							tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
							ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
							iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
							pellentesque praesent tincidunt felis sagittis eget. tempus
							euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
							Blandit adipiscing eu felis iaculis volutpat ac adipiscing
							accumsan eu faucibus. Integer ac pellentesque praesent. Donec
							accumsan interdum nisi, quis tincidunt felis sagittis eget.
							tempus euismod. Vestibulum ante ipsum primis in faucibus
							vestibulum. Blandit adipiscing eu felis iaculis volutpat ac
							adipiscing accumsan eu faucibus. Integer ac pellentesque praesent
							tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
							ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
							iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
							pellentesque praesent. Blandit adipiscing eu felis iaculis
							volutpat ac adipiscing accumsan eu faucibus. Integer ac
							pellentesque praesent tincidunt felis sagittis eget. tempus
							euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
							Blandit adipiscing eu felis iaculis volutpat ac adipiscing
							accumsan eu faucibus. Integer ac pellentesque praesent.
						</p>
						<p>
							<span class="image right"><img src="images/pic04.jpg"
								alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis
							tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
							ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
							iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
							pellentesque praesent tincidunt felis sagittis eget. tempus
							euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
							Blandit adipiscing eu felis iaculis volutpat ac adipiscing
							accumsan eu faucibus. Integer ac pellentesque praesent. Donec
							accumsan interdum nisi, quis tincidunt felis sagittis eget.
							tempus euismod. Vestibulum ante ipsum primis in faucibus
							vestibulum. Blandit adipiscing eu felis iaculis volutpat ac
							adipiscing accumsan eu faucibus. Integer ac pellentesque praesent
							tincidunt felis sagittis eget. tempus euismod. Vestibulum ante
							ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis
							iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac
							pellentesque praesent. Blandit adipiscing eu felis iaculis
							volutpat ac adipiscing accumsan eu faucibus. Integer ac
							pellentesque praesent tincidunt felis sagittis eget. tempus
							euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
							Blandit adipiscing eu felis iaculis volutpat ac adipiscing
							accumsan eu faucibus. Integer ac pellentesque praesent.
						</p>
					</section>

					</article>
					
					
					<section>
						<h3>Image</h3>
						<h4>Fit</h4>
						<div class="box alt">
							<div class="row uniform">
								<div class="12u$">
									<span class="image fit">
										<img src="/resources/imperfect/images/pic02.jpg" alt="" />
									</span>
								</div>
							</div>
						</div>
						<h4>Left &amp; Right</h4>
					</section>
					
					

					<div class="row">
						<c:forEach var="tt" items="${tourTicket}" varStatus="num">
							<div class="col-sm-3">

								<div class="col-sm-12">
									<p>
										<span class="label label-success"> ${ num.count } </span>
									</p>
									<h5>&nbsp;${ tt.title }</h5>
								</div>

								<div class="thumbnail">

									<p class="text-right">조회수 : ${ tt.readcount }</p>

									<img src="${ tt.firstimage }" />

									<div class="caption">

										<h5>
											<hr />

											기&nbsp;간 : ${ tt.eventstartdate } ~ ${ tt.eventenddate }<br>
											장&nbsp;소 : ${ tt.eventplace } <br>
										</h5>
										<br>
										<p class="text-right">

											<a href="#" class="btn btn-success btn-lg" role="button">
												상세조회 
												
												<!-- PageNavigation을 위한 값을 보내는 부분  --> 
												<input type="hidden" name="contentId" value="${ tt.contentid }">
												<input type="hidden" name="contentTypeId" value="${ tt.contenttypeid }"> 
												<input type="hidden" name="title" value="${ tt.title }"> 
												<input type="hidden" name="eventstartdate" value="${ tt.eventstartdate }"> 
												<input type="hidden" name="eventenddate" value="${ tt.eventenddate }">
											</a>
										</p>
									</div>
								</div>

							</div>
						</c:forEach>
					</div>

					<hr />
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<input type="hidden" id="pageNo" name="pageNo" value=""/>
			<input type="hidden" name="searchCondition" id="searchCondition" value="">
			
		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->
	</section>
	</div>
	
	
	
	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->


	<!-- Scripts -->
	<script src="../resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="../resources/assets/js/jquery.scrollzer.min.js"></script>
	<script src="../resources/assets/js/skel.min.js"></script>
	<script src="../resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="../resources/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../resources/assets/js/main.js"></script>
	<script src="../resources/assets/js/1main.js"></script>

</body>

</html>