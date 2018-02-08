<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"><!--    -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  <style type="text/css">
  	.selectedhashtagButtons {
			  height: 30px;
			  font-size:15px;
			  font-family: 'Nanum Gothic';
			  color: white;
			  text-align: center;
			  background: #2fade2;
			  border: solid 2px #2fade2;
			  border-radius: 30px;
	}
	.hashtagButtons {
			  height: 30px;
			  font-size:15px;
			  font-family: 'Nanum Gothic';
			  color: black;
			  text-align: center;
			  background: #edeeef;
			  border: solid 2px #edeeef;
			  border-radius: 30px;
	}
	#selectedThumbnail{
		border: solid 2px red;
	}
  </style>
  <script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	function sendFile(file, editor) {              
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "uploadImage",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('editor.insertImage', "\n\n"+data.relativeUrl+"\n\n");
	 	      		$('div#cndThumbnail').append('<img class="cndThumbnail" border="2" alt="'+data.relativeUrl+'" src="'+data.relativeUrl+'" width="100px" height="120px"/>&nbsp;')
	 	        	listHashTag(data.url);
	 	        },
	 	        error : function() {
					alert("파일 업로드에 실패했습니다.")
				}
	 	    });
	 	}
        function deleteFile(file) {
			
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
        				if(data[i]==("음식")){
        					data[i] = "맛집"
        				}
	 	        		$("#cndHashTags").append('<button type="button" class="hashtagButtons" value="'+data[i]+',"><span class="glyphicon glyphicon-plus"></span>&nbsp;#'+data[i]+'</button>&nbsp;');
	 	        	}
				},
				error : function() {
					$("#cndHashtags").append("<p>분석 결과를 찾을 수 없습니다.</p>")
				}
        	})
        }
        function addHashTag(value) {
        	$('button.hashtagButtons[value="'+value+'"]>span').attr('class', 'glyphicon glyphicon-ok');
			$('button.hashtagButtons[value="'+value+'"]').attr('class', 'selectedhashtagButtons');
		}
        function deleteHashTag(value) {
        	$('button.selectedhashtagButtons[value="'+value+'"]>span').attr('class', 'glyphicon glyphicon-plus');
			$('button.selectedhashtagButtons[value="'+value+'"]').attr('class', 'hashtagButtons');
		}
        $(function() {
	 	    
 	 	   $('div#cndHashTags').on('click', 'button.hashtagButtons', function() {
 	 		   addHashTag($(this).val());
 			})
 			
  			$('div#cndThumbnail').on('click', 'img.cndThumbnail', function() {
  				$('div#cndThumbnail>img').removeAttr("id")
  				$('input[name="thumbNailFileName"]').val($(this).attr('src'));
  				$(this).attr("id", "selectedThumbnail");
  				console.log($('input[name="thumbNailFileName"]').val());
 			}) 
 			
 			$('div#cndHashTags').on('click', 'button.selectedhashtagButtons', function() {
 	 		   deleteHashTag($(this).val());
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
	    				    	var html =$('#summernote').summernote('code')+'<button type="button" class="btn btn-default" placement="left">'+
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
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
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
		<h5 align="left">썸네일을  선택해주세요</h5>
		<div id="cndThumbnail"></div>
		<br/>
		</form>
</body>
</html>