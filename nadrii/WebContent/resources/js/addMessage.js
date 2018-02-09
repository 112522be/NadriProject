$( function() {
          $("a[href='#' ]:contains('쪽지 보내기')").on("click" , function() {
        	var recevierId = $("#recevierId").val();
        	alert(recevierId);
        	window.open("/message/addMessage?receiverId="+recevierId,"addMessgeView","width=300, height=350,status=no, scrollbars=no, location=no");
          });
      });