<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">  -->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  
  <script type="text/javascript">
        /* summernote���� �̹��� ���ε�� ������ �Լ� */
	 	function sendFile(file, editor) {              
            // ���� ������ ���� ������
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax�� ���� ���� ���ε� ó��
	 	        data : data,
	 	        type : "POST",
	 	        url : "uploadImage",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // ó���� ������ ���
                    // �����Ϳ� �̹��� ���
	 	        	$(editor).summernote('editor.insertImage', "\n\n"+data.url+"\n\n");
	 	      		$('div#cndThumbnail').append('<img class="cndThumbnail" border="2" alt="'+data.url+'" src="'+data.url+'" width="100px" height="120px"/>&nbsp;')
	 	        	listHashTag(data.url);
	 	        },
	 	        error : function() {
					alert("���� ���ε忡 �����߽��ϴ�.")
				}
	 	    });
	 	}
        function deleteFile(file) {
			
		}
        function addThumbnail(filePath) {
			$('input[name="thumbNailFileName"]').val(filePath);
			$('img.cndThumbnail[value="'+filePath+'"]').attr("class", "selected")
			console.log($('input[name="thumbNailFileName"]').val());
		}
        var hashtagList=",";
        function listHashTag(filePath) {
        	$.ajax({
        		url : "listHashTag",
        		type : "POST",
        		data : {
        			"filePath" : filePath
        		},
        		success : function(data) {
        			for(i=0;i<data.length;i++){
        				if(data[i]==("����")){
        					data[i] = "����"
        				}
	 	        		$("#cndHashTags").prepend('<button type="button" class="hashtags" value="'+data[i]+'">#'+data[i]+'</button>');
	 	        	}
				},
				error : function() {
					$("#cndHashtags").append("<p>�м� ����� ã�� �� �����ϴ�.</p>")
				}
        	})
        }
        function addHashTag(value) {
			$('button.hashtags:contains("'+value+'")').remove();
			$('#selectedHashTags').append("#"+value+" ")
			hashtagList+=value+",";
			$('input[name="hashtag"]').val(hashtagList);
		}
        $(function() {
	 	    
 	 	   $('div#cndHashTags').on('click', 'button.hashtags', function() {
 	 		   addHashTag($(this).val());
 			})
 			
  			$('div#cndThumbnail').on('click', 'img.cndThumbnail', function() {
  				addThumbnail($(this).attr('src'))
 			}) 
		})
	</script>
</head>
<body>
		<form name="textForm">
		<textarea id="summernote" name="text"></textarea>
        <script>
	        var openDialog = function (uri, name, options, closeCallback) {
			    var win = window.open(uri, "", options);
			    var interval = window.setInterval(function() {
			        try {
			            if (win == null || win.closed) {
			                window.clearInterval(interval);
			                closeCallback(win);
			            }
			        }
			        catch (e) {
			        }
			    }, 1000);
			    return win;
	        }
        	var addPlace = function (context) {
        	 	var ui = $.summernote.ui;

	        	var button = ui.button({
	        		contents: '<i class="glyphicon glyphicon-map-marker"/> Place',
	        		click: function() {
	    				//openWin = window.open(popUrl,"",popOption);    
	    				    var uri = "addPlace.jsp";
		    				var options = "width=800, height=600, resizable=no, scrollbars=no, status=no;"
	    				    openDialog(uri, "", options, function(win) {
	    				    	alert($('#content_pr').val());
	    				    	alert($('#lat').val());
	    				    	alert($('#lng').val());
	    				    	var html =$('#summernote').summernote('code')+'<button type="button" class="btn btn-default">'+
	    									'<div class="col-xs-3" align="left">'+
	    									'<img src="../resources/images/marker/marker_uc.png" width="50px" height="80px" align="middle">'+
	    									'</div>'+
	    									'<div class="col-xs-9" align="left">'+$('#content_pr').val()+'</div></button><p></p>';
	    				    	$('#summernote').summernote('code', html);
						})
	    			}
	        	}) 
	        	return button.render();
        	}
			var openWin;
            $(document).ready(function() {
                $('#summernote').summernote({
                    height: 800,
                    toolbar: [
                    	['style', ['bold', 'italic', 'underline', 'clear']],
                        ['fontsize', ['fontsize']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert', ['picture']],
                    	['mybutton', ['place']]
                    ],
                    buttons: {
                       place: addPlace
                    },
					callbacks: { // �ݹ��� ���
                        // �̹����� ���ε��� ��� �̺�Ʈ�� �߻�
					    onImageUpload: function(files, editor, welEditable) {
					    	for(i=0;i<files.length;i++){
					    		sendFile(files[i], this);
					    	}
						}
					}
				});
			});
		</script>
		<input type="hidden" name="hashtag">
		<input type="hidden" name="lat" id="lat">
		<input type="hidden" name="lng" id="lng">
		<input type="hidden" name="thumbNailFileName">
		<input type="hidden" id="content_pr">
		<div id="cndThumbnail"></div>
		<br/>
		<div>
			<textarea class="form-control" id="selectedHashTags" rows="2"></textarea>
		</div>
		<br/>
		<div id="cndHashTags"></div>
		<br/>
		</form>
</body>
</html>