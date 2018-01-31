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
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        	for(i=0;i<data.listHashTag.length;i++){
	 	        		$(editor).summernote('editor.insertText', "#"+data.listHashTag[i])
	 	        	}
	 	        },
	 	        error : function() {
					alert("���� ���ε忡 �����߽��ϴ�.")
				}
	 	    });
	 	}
	</script>
</head>
<body>
	<h1>summernote</h1>
	<form name="writeForm" action="./summernote_insert.jsp" method="post">
		<textarea id="summernote">Hello Summernote</textarea>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote�� ����ϱ� ���� ����
                    height: 400,
					callbacks: { // �ݹ��� ���
                        // �̹����� ���ε��� ��� �̺�Ʈ�� �߻�
					    onImageUpload: function(files, editor, welEditable) {
						    sendFile(files[0], this);
						}
					}
				});
			});
		</script>
</body>
</html>