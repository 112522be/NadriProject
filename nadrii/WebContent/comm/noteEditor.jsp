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
		<textarea id="summernote" name="text">�ȳ��ϼ���</textarea>
        <script>
        	var addPlace = function (context) {
        	 	var ui = $.summernote.ui;

	        	var button = ui.button({
	        		contents: '<i class="fa fa-child"/> Place',
	        		click: function() {
	        			var popUrl = "addPlace.jsp";
	    				var popOption = "width=800, height=600, resizable=no, scrollbars=no, status=no;"
	    				openWin = window.open(popUrl,"",popOption);
	    			}
	        	})
	        	return button.render();
        	}
			var openWin;
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote�� ����ϱ� ���� ����
                    height: 800,
                    toolbar: [
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