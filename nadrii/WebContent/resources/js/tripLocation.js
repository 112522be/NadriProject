/**
 * 
 */
$(document).ready(function() {
		if(navigator.geolocation) {
		            navigator.geolocation.getCurrentPosition(
		                function nowLocation(position) {
		                    var lat = position.coords.latitude;
		                    var lon = position.coords.longitude;
		                   
		                    alert(lat);
		                    alert(lon);
		                    
		                    var location ={
		                    		"lat" : lat,
		                    		"lng" : lon
		                    }
		                    
		                    var jsonData = JSON.stringify(location);
		                    
		                    $.ajax({
		                        type: "POST",
		                        url: "../trip/json/getClientAddress/",
		                        contentType: "application/json",
		                        data:jsonData,
		                        dataType: "json",
		                        success: function() {
		                            //alert("난 니가 어딘지 알고 있다 이클립스 콘솔 확인해라");
		                        }
		                    });
		                },
		                function(error) {
		                    //alert("브라우저의 위치추적을 허용하지 않으셨습니다. 기본좌표로 이동합니다.");
		                    var lat = 37.5327619;
		                    var lon = 127.0139427;
		                   
		                    $.ajax({
		                        type: "POST",
		                        url: "Map.do",
		                        data: "json",
		                        success: function(data) {
		                           // $('#mapview').html(data);
		                        }
		                    });  
		                }
		        );
		    }   
		        else {
		           //alert("Your Browser don't support for Geolocation");
		            var lat = 37.5327619;
		            var lon = 127.0139427;
		           
		            $.ajax({
		                type: "POST",
		                url: "Map.do",
		                data: "lat=" + lat + "&lon=" + lon,
		                success: function(data) {
		                 //   $('#mapview').html(data);
		                }
		            });  
		        }
		    });

		