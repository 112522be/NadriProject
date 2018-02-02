<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>������ Ƽ�� ���</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- ���ѽ�ũ�� -->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- //////////////////// CSS //////////////////// -->

	<style>
		body {
            padding-top : 50px;
        }
	</style>


<!-- //////////////////// JavaScript //////////////////// -->
<script type="text/javascript">

function fncGetList(pageNo) {
	
	$("#pageNo").val(pageNo);
	$("form").attr("method", "POST").attr("action", "/ticket/listTicket").submit();
	
}

	//=================== "��ȸ" Event ���� =================== 
	$(function() {
		$(".btn.btn-primary#option1").bind("click", function() {
			//			alert("��ư [1] :: OK")
			//			alert("����� :: " + $("input[name='title']").val())
			console.log("����� :: " + $("input[name='title']").val())
		});

		$(".btn.btn-primary#option2").bind("click", function() {
			//			alert("��ư [2] :: OK")
			//			alert("��ȸ�� :: " + $("input[name='click']").val())
			console.log("��ȸ�� :: " + $("input[name='click']").val())
		});

		$("#option3").bind("click", function() {
			//			alert("��ư [3] :: OK")
			//			alert("�����ϼ� :: " + $("input[name='modify']").val())
			console.log("�����ϼ� :: " + $("input[name='modify']").val())
		});

		$("#option4").bind("click", function() {
			//			alert("��ư [4] :: OK")
			//			alert("�����ϼ� :: " + $("input[name='create']").val())
			console.log("�����ϼ� :: " + $("input[name='create']").val())
		});

	});

	//=================== "��ȸ" Event ���� =================== 
	$(function() {
		$("button.btn.btn-primary").bind("click", function() {
			fncGetTicket();
		});
	});

	//=================== "���" Event ���� =================== 
	$(function() {
		$("a[href='#' ]").bind("click", function() {
			$("form")[0].reset();
		});
	});

	//=================== "����ȸ" Event ���� ===================
	$(function() {
		$("a[href='#' ]:contains('����ȸ')").bind("click", function() {
			
			var contentId = $( $('input[name="contentId"]')[$( ".btn.btn-warning" ).index(this)] ).val();
			var contentTypeId = $( $('input[name="contentTypeId"]')[$( ".btn.btn-warning" ).index(this)] ).val();
			var title = $( $('input[name="title"]')[$( ".btn.btn-warning" ).index(this)] ).val();
			var encodeTitle = encodeURI(encodeURIComponent(title));
			/*
			console.log('contentId : ' + contentId)
			console.log('contentTypeId : ' + contentTypeId)
			console.log('title : ' + title)
			console.log('encodeTitle : ' + encodeTitle)
			//*/
			self.location ="/ticket/getTicket?"
					+ "contentId=" + contentId 
					+ "&contentTypeId=" + contentTypeId
					+ "&title=" + encodeTitle;
		});
	});
	
	function fncGetTicket() {
		$("form").attr("method", "POST").attr("action", "/ticket/testTicket").submit();
	}
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class="text-info">
				<p class="bg-warning">������Ƽ�� �׽�Ʈ</p>
			</h3>
			<h5 class="text-muted text-left">
				��ȸ�Ͻ� Ƽ�� ������ <strong class="text-danger">����</strong>�� �ּ���.
			</h5>
		</div>

	<!-- JQUERY TAB Start -->
		<div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs " role="tablist">
				<li role="presentation" class="active">
					<a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a>
				</li>
				<li role="presentation">
					<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
				</li>
				<li role="presentation">
					<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a>
				</li>
				<li role="presentation">
					<a href="#settings"	aria-controls="settings" role="tab" data-toggle="tab">Settings</a>
				</li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">...</div>
				<div role="tabpanel" class="tab-pane" id="profile">...</div>
				<div role="tabpanel" class="tab-pane" id="messages">...</div>
				<div role="tabpanel" class="tab-pane" id="settings">...</div>
			</div>
			
			<div class="tab-content">
  				<div role="tabpanel" class="tab-pane fade in active" id="home">...</div>
  				<div role="tabpanel" class="tab-pane fade" id="profile">...</div>
 				<div role="tabpanel" class="tab-pane fade" id="messages">...</div>
  				<div role="tabpanel" class="tab-pane fade" id="settings">...</div>			
			</div>

		</div>
	<!-- JQUERY TAB End -->

		<div class="col-md-6 text-left">
			<p class="text-primary">
				<code>
				&lt; ���� ${ resultPage.pageNo } ������ / ��ü ${ resultPage.totalCount } �Ǽ� &gt;
				</code>
			</p>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

<!-- 
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-primary" id="option1"> 
					<input type="radio" name="title" value="A" autocomplete="off">
					�����
				</label> 
				
				<label class="btn btn-primary active" id="option2"> 
					<input type="radio" name="click" value="B" autocomplete="off" checked>
					��ȸ��
				</label> 
				
				<label class="btn btn-primary" id="option3"> 
					<input type="radio" name="modify" value="Q" autocomplete="off">
					�����ϼ�
				</label> 
				
				<label class="btn btn-primary" id="option4"> 
					<input type="radio" name="create" value="R" autocomplete="off">
					�����ϼ�
				</label>
			</div>
-->		

			<hr />

		 	<div class="row">  
				<c:forEach var="tt" items="${tourTicket}">
					<div class="col-sm-3">
						<h4>
							<span class="label label-success"> ${ tt.title } </span>
						</h4>
						<div class="thumbnail">
						<p class = "text-right">��ȸ�� : ${ tt.readcount }</p>
							<img src="${ tt.firstimage }" class="img-responsive" />
							<div class="caption">
								<p> ����� : 
								<c:forEach items="${ tt.usetimefestival }" varStatus="status">
									${ tt.usetimefestival[status.index] }
								</c:forEach>
									<hr/>
									��&nbsp;�� : ${ tt.eventstartdate } ~ ${ tt.eventenddate }<br>
									��&nbsp;�� : ${ tt.eventplace } <br>
								</p>
								<p class="text-right">
									<a href="#" class="btn btn-warning" role="button">
										����ȸ
										<!-- PageNavigation�� ���� ���� ������ �κ�  -->
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
				<br>
			</div>

			<hr />
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<input type="hidden" id="pageNo" name="pageNo" value=""/>
			
		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	
	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_openApi.jsp"/>
	<!-- PageNavigation End... -->
	 -->

</body>

</html>