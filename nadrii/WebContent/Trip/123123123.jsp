<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Moderna - Bootstrap 3 flat corporate template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<!-- css -->
	<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="../resources/css/jcarousel.css" rel="stylesheet">
	<link href="../resources/css/flexslider.css" rel="stylesheet">
	<link href="../resources/css/style.css" rel="stylesheet">

	<!-- Theme skin -->
	<link href="../resources/skins/default.css" rel="stylesheet">
	<script type="text/javascript">

	jQuery(function() {
	    
	    var sort = '';
	    var gu = '';
	    if (! isEmpty(sort)) {
	        $("input[id='areaCode']").val(sort);
	        $(".siDoList").find("a[targetId='areaCode'][idValue='"+sort+"']").parent().parent().prev().html($("a[targetId='areaCode'][idValue='"+sort+"']").text() + '<span class="ico_arrow1"></span>');
	        ajaxGetGu(sort, gu);
	    }
	    
	    $(".siDoList > li > a").click(function() {
	        ajaxGetGu($(this).attr("idValue"));
	    });
	    
	    $(".store_map ul li").mouseover(function(){
	        $(this).find("img").attr("src", $(this).find("img").attr("src").replace(".png", "_on.png"));
	        $(this).addClass("overmap");
	    }).mouseout(function(){
	        $(this).find("img").attr("src", $(this).find("img").attr("src").replace("_on.png", ".png"));
	        $(".store_map ul li").removeClass("overmap");
	    });
	    
	    $(".store_map").find("a").click(function() {
	        $("input").val("");
	        $("input[name='sort']").val($(this).attr("idValue"));
	        $("form[name='areaSearchForm']").submit();
	    });
	    
	    $(".new_storebox li:odd() , .store_service li:odd()").addClass("lbox");
	    
	    
	    $(".store_gbn > a").click(function() {
	        if ($(this).attr("targetId") == "gbnSort") {
	            $("input[name='gbnSort']").val("");
	        } else {
	            if (isEmpty($("input[id="+$(this).attr("targetId")+"]").val())) {
	                $("input[id="+$(this).attr("targetId")+"]").val($(this).attr("idValue"));
	            } else {
	                $("input[id="+$(this).attr("targetId")+"]").val("");
	            }
	            var gbnSort = "";
	            for (var i = 1; i < 7; i++) {
	                if (! isEmpty($("input[name='gbnSort" + i + "']").val())) {
	                    if (! isEmpty(gbnSort)) {
	                        gbnSort += ",";
	                    }
	                    gbnSort += $("input[name='gbnSort" + i + "']").val();
	                }
	            }

	            $("input[name='gbnSort']").val(gbnSort);
	            if (gbnSort.length == 11) {
	                $("input[name='gbnSort']").val("");
	            }
	        }
	        $("form[name='areaSearchForm']").submit();
	    });
	    
	    $(".store_serv > a").click(function() {
	        if ($("input[id='"+$(this).attr("targetId")+"']").val() == 'true') {
	            $("input[id='"+$(this).attr("targetId")+"']").val("");
	        } else {
	            $("input[id='"+$(this).attr("targetId")+"']").val("true");
	        }
	        $("form[name='areaSearchForm']").submit();
	    });
	});

	function ajaxGetGu(areaCode, gu) {
	    $.ajax({
	        type: 'post'
	        , data: {
	            prntCode : areaCode
	        }
	        , url: 'http://www.abcmart.co.kr/abc/customer/ajaxGetGu',
	        dataType: 'html'
	        , success: function(data) {
	            $("input[name='gu']").val("");
	            $(".guGunList").prev().html('전체<span class="ico_arrow1"></span>')
	            $('.guGunList').html("");
	            $('.guGunList').html("<li><a href='javascript://' targetId='gu' idValue=''>전체</a></li>" + data);
	            $(".guGunList > li > a").click(function(e) {
	                $(this).parent().parent().prev().html($(this).text() + '<span class="ico_arrow1"></span>');
	                $(this).parent().parent().prev().toggleClass("on");
	                $(this).parent().parent().toggleClass("on");
	                $("input[id='"+$(this).attr("targetId")+"']").val($(this).attr("idValue"));
	            });
	            
	            if (! isEmpty(gu)) {
	                $("input[id='gu']").val(gu);
	                $(".guGunList").find("a[targetId='gu'][idValue='"+gu+"']").parent().parent().prev().html($("a[targetId='gu'][idValue='"+gu+"']").text() + '<span class="ico_arrow1"></span>');
	            }
	        }
	    });
	}

	function searchValueCheck() {
	    $("input[name='searchValue']").val($.trim($("input[name='searchValue']").val()));
	}

	function formSubmit(page) {
	    $("input[name='page']").val(page);
	    $("form[name='areaSearchForm']").submit();
	}

	
	</script>
    
</head>
<body>
	<div class="store_map">
                <ul>
                    <li class="map01 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="01"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_01.png" alt="서울"></a><span>서울 <em>62개</em></span></div></li>
                    <li class="map02"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="06"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_02.png" alt="경기도"></a><span>경기도 <em>50개</em></span></div></li>
                    <li class="map03 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="07"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_03.png" alt="인천광역시"></a><span>인천광역시 <em>10개</em></span></div></li>
                    <li class="map04"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="02"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_04.png" alt="강원도"></a><span>강원도 <em>4개</em></span></div></li>
                    <li class="map05 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="03"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_05.png" alt="대전광역시"></a><span>대전광역시 <em>8개</em></span></div></li>
                    <li class="map06"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="04"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_06.png" alt="충청남도"></a><span>충청남도 <em>9개</em></span></div></li>
                    <li class="map07"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="05"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_07.png" alt="충청북도"></a><span>충청북도 <em>7개</em></span></div></li>
                    <li class="map08 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="08"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_08.png" alt="광주광역시"></a><span>광주광역시 <em>6개</em></span></div></li>
                    <li class="map09"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="10"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_09.png" alt="전라북도"></a><span>전라북도 <em>6개</em></span></div></li>
                    <li class="map10"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="09"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_10.png" alt="전라남도"></a><span>전라남도 <em>5개</em></span></div></li>
                    <li class="map11 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="14"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_11.png" alt="대구광역시"></a><span>대구광역시 <em>11개</em></span></div></li>
                    <li class="map12"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="13"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_12.png" alt="경상북도"></a><span>경상북도 <em>8개</em></span></div></li>
                    <li class="map13"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="12"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_13.png" alt="경상남도"></a><span>경상남도 <em>10개</em></span></div></li>
                    <li class="map14 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="15"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_14.png" alt="울산광역시"></a><span>울산광역시 <em>4개</em></span></div></li>
                    <li class="map15 top_map"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="11"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_15.png" alt="서울"></a><span>부산광역시 <em>14개</em></span></div></li>
                    <li class="map16"><div class="positR"><a href="javascript://" targetid="areaCode" idvalue="16"><img src="http://image.abcmart.co.kr/nexti/images/abcmart_new/map_16.png" alt="제주도"></a><span>제주도 <em>5개</em></span></div></li>
                </ul>
            </div>
</body>
</html>