/**
 * 
 */



$(document).ready(function() {
	
	
		if(navigator.geolocation) {
		  
			
			navigator.geolocation.getCurrentPosition(
		               
					
					
					
						function(position) {
		                    var lat = position.coords.latitude;
		                    var lon = position.coords.longitude;
		                   
		    
		                    
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
		                   

		                        }
		                    });
		                },
		                function(error) {
		              

		                    var lat = 37.5327619;
		                    var lon = 127.0139427;
		                   
		                    $.ajax({
		                    	url: "../trip/json/getClientAddress/",
		                        contentType: "application/json",
		                        data:jsonData,
		                        dataType: "json",
		                        success: function() {
		                       
		                        }
		                    });  
		                }
		        );
		    }   
		        else {

		            var lat = 37.5327619;
		            var lon = 127.0139427;
		           
		            $.ajax({
                    	url: "../trip/json/getClientAddress/",
                        contentType: "application/json",
                        data:jsonData,
                        dataType: "json",
                        success: function() {
                         
                        }
		            });  
		        }
		    });

		