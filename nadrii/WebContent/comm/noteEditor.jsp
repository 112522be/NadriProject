<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
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
	 	        url : "./listHashTag",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // ó���� ������ ���
                    // �����Ϳ� �̹��� ���
                    console.log(data.listHashTag.length)
	 	        	$(editor).summernote('editor.insertImage', "\n\n"+data.url+"\n\n");
	 	        	for(i=0;i<data.listHashTag.length;i++){
	 	        		$("#cndHashTags").append('<button type="button" class="hashtags" value="'+data.listHashTag[i]+'">#'+data.listHashTag[i]+'</button>');
	 	        	}
	 	        },
	 	        error : function() {
					alert("���� ���ε忡 �����߽��ϴ�.")
				}
	 	    });
	 	    
	 	   $('div#cndHashTags').on('click', 'button.hashtags', function() {
	 		   addHashTag($(this).val());
			})
	 	}
        var hashtagList=",";
        function addHashTag(value) {
			$('button.hashtags:contains("'+value+'")').remove();
			$('#selectedHashTags').append("#"+value+" ")
			hashtagList+=value+",";
			$('input[name=hashtag]').val(hashtagList);
		}
	</script>
</head>
<body>
		<form name="textForm">
		<textarea id="summernote" name="text"></textarea>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote�� ����ϱ� ���� ����
                    height: 800,
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
		<div>
			<textarea id="selectedHashTags" rows="2"></textarea>
		</div>
		<div id="cndHashTags">
		</div>
		<br/>
</body>
</html>