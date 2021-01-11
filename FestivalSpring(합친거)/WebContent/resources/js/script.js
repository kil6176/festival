$(function () {
    /*------------지역코드------------*/
 	var areaCode = "";
 	var sigunguCode = "";
    $.ajax({
        type: "GET",
        dataType: 'xml',
		crossOrigin: true,
		proxy: "https://www.festvalcl.tk//proxy.php",
        url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?"
         + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
         + "&numOfRows=20"
         + "&MobileOS=ETC"
         + "&MobileApp=TourAPI3.0_Guide",
        success: function (data) {
            $(data).find('item').each(function () {
                var code = $('code', this).text();
                var name = $('name', this).text();
                var area = "<option value='" + code + "'>" + name + "</option>"
                    $(".areacode").append(area);
            });
        }
    });

    $(".areacode").change(function () {
		areaCode = $(':selected', this).val(); // 전달받은 "셀렉트박스 요소" 에서 선택된 것 찾기
		sigunguCode = ""; // 전달받은 "셀렉트박스 요소" 에서 선택된 것 찾기
        getSigunguCode(this); // 셀렉트 박스 선택이 바뀔때 "셀렉트박스 요소" 를 함수로 전달

    });

    $(".sigunguCode").change(function () {
		sigunguCode = $(':selected', this).val(); // 전달받은 "셀렉트박스 요소" 에서 선택된 것 찾기
    });

	/*검색종류 바꿀시 지역검색 값 초기화*/
	$('#dateSearch').click(function(){
		areaCode = "";
		sigunguCode = "";
	});
	
	$('#nameSearch').click(function(){
		areaCode = "";
		sigunguCode = "";
	});
	/******************************/
	
    function getSigunguCode(o) {
        
        $(".sigunguCode").empty();
        $(".sigunguCode").append("<option value=''>시군구 선택</option>");
        if (areaCode != "") {
            $.ajax({
                type: "GET",
                dataType: 'xml',		
				crossOrigin: true,
				proxy: "https://www.festvalcl.tk/proxy.php",
                url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?"
                 + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
                 + "&areaCode=" + areaCode
                 + "&numOfRows=99"
                 + "&MobileOS=ETC"
                 + "&MobileApp=TourAPI3.0_Guide",
                success: function (data) {
                    $(data).find('item').each(function () {
                        var code = $('code', this).text();
                        var name = $('name', this).text();
                        var sigungu = "<option value='" + code + "'>" + name + "</option>"
                            $(".sigunguCode").append(sigungu);
                    });
                }
            });
        } 
    }

    /*------------지역코드 끝------------*/

    /*------------달력---------------*/
    //날짜 디폴트 값 주기
    var date = new Date();
    var date2 = new Date();

    date2.setMonth(date2.getMonth() + 1);
    date = getFormatDate(date);
    date2 = getFormatDate(date2);

	var startDate2 = date.replace(/-/gi, ""); 
	var endDate2 = date2.replace(/-/gi, ""); 

    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    if (endDate == "" && startDate == "") {
        document.getElementById("startDate").value = date;
        document.getElementById("endDate").value = date2;
    }

	/*날짜에 -없앰*/
	$("#startDate").change(function () {
   	 	startDate = document.getElementById("startDate").value;
		startDate2 = startDate.replace(/-/gi, ""); 
    });

	$("#endDate").change(function () {
   	 	endDate = document.getElementById("endDate").value;
		endDate2 = endDate.replace(/-/gi, ""); 
    });

    /*날짜 yyyy-mm-dd로 형식변환 */
    function getFormatDate(date) {
        var year = date.getFullYear(); //yyyy
        var month = (1 + date.getMonth()); //M
        month = month >= 10 ? month : '0' + month; //month 두자리로 저장
        var day = date.getDate(); //d
        day = day >= 10 ? day : '0' + day; //day 두자리로 저장
        return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
    }

    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $("#startDate").datepicker({
        changeMonth: true,
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dateFormat: "yy-mm-dd",
        maxDate: 365, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
        onClose: function (selectedDate) {
            //시작일(startDate) datepicker가 닫힐때
            //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#endDate").datepicker("option", "minDate", selectedDate);
        }

    });
    $("#endDate").datepicker({
        changeMonth: true,
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dateFormat: "yy-mm-dd",
        maxDate: 365, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
        onClose: function (selectedDate) {
            // 종료일(endDate) datepicker가 닫힐때
            // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
            $("#startDate").datepicker("option", "maxDate", selectedDate);
        }

    });

    /*------------달력끝---------------*/

    /* 페스티벌 정보 API */
    function getFestivalData(startDate, endDate, areaCode, sigunguCode, pageNo, keyword) {
		removeMarker();
        $("#placesList").empty();
        var count = 1;
		if(keyword == ""){
	        $.ajax({
	            type: "GET",
	            dataType: 'xml',
				crossOrigin: true,
				proxy: "https://www.festvalcl.tk/proxy.php",
	            url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?"
	             + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
	             + "&eventStartDate=" + startDate
	             + "&eventEndDate=" + endDate
	             + "&areaCode=" + areaCode
	             + "&sigunguCode=" + sigunguCode
	             + "&cat1=A02"
	             + "&cat2=A0207"
	             + "&cat3="
	             + "&listYN=Y"
	             + "&MobileOS=ETC"
	             + "&MobileApp=TourAPI3.0_Guide"
	             + "&arrange=A"
	             + "&numOfRows=10"
	             + "&pageNo=" + pageNo,
	            success: function (data) {
	
	                $(data).find('body').each(function () {
	                    var totalCount = $('totalCount', this).text();
	                    var pageNo = $('pageNo', this).text();
	                    paging(totalCount, 10, 5, pageNo);
	                });
	
	                $(data).find('item').each(function () {
	                    var title = $('title', this).text(); //제목
	                    var addr1 = $('addr1', this).text(); // 주소
	                    var addr2 = $('addr2', this).text(); //상세주소
	                    var tel = $('tel', this).text(); //전화번호
	                    var mapX = $('mapx', this).text(); //x좌표
	                    var mapY = $('mapy', this).text(); //y좌표
	                    var mlevel = $('mlevel', this).text(); //맵레벨
	                    var firstimage = $('firstimage', this).text(); //대표이미지(원본)
	                    var firstimage2 = $('firstimage2', this).text(); //대표이미지(썸네일)
	                    var eventstartdate = $('eventstartdate', this).text(); //행사시작일
	                    var eventenddate = $('eventenddate', this).text(); //행사종료일
	                    var contentid = $('contentid', this).text(); //행사아이디
	                    var contenttypeid = $('contenttypeid', this).text(); //행사타입
	
						var placePosition = new kakao.maps.LatLng(mapY, mapX),
	           				marker = addMarker(placePosition, count-1);//x,y좌표 넣어서 마커생성
	
						var el = document.createElement('li');
							el.className = 'item';//아이템 엘리먼트 생성
							
	                    var txt = 
	                         "<span class='markerbg marker_" + count + "'>"
	                         + "</span>"
	                         + "<div class='info' onClick='javascript:getSubData("+contenttypeid+","+contentid+")'>"
	                         + "<img src='"+firstimage2+"' style='width:150px; height:100px;'></img>"
	                         + "<h3>" + title + "</h3>"
	                         + "<span>" + addr1 + "</span>"
	                         + "<span class='tel'>" + tel + "</span>"
	                         + "<span class='date'>축제기간 : " + eventstartdate + " ~ " + eventenddate + "</span>";
							el.innerHTML = txt;
	                  		count = count + 1;
	                       	$("#placesList").append(el);
	
						//마우스 이벤트로 인포윈도우 생성, 지도 마커로 이동
						(function(marker, title) {
							if(mapX!="" && mapY!=""){
					            kakao.maps.event.addListener(marker, 'mouseover', function() {
					                displayInfowindow(marker, title);
					            });
					
					            kakao.maps.event.addListener(marker, 'mouseout', function() {
					                infowindow.close();
					            });
		
					            el.onclick =  function () {
					                displayInfowindow(marker, title);
									panTo(mapY, mapX);
					            };
							}
				     	   })(marker, title);
	                });
	            }
	        });
		}
		else
			$.ajax({
		            type: "GET",
		            dataType: 'xml',
					crossOrigin: true,
					proxy: "https://www.festvalcl.tk//proxy.php",
		            url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?"
		             + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
		             + "&keyword=" + encodeURI(keyword)
		             + "&areaCode=" + areaCode
		             + "&sigunguCode=" + sigunguCode
		             + "&cat1=A02"
		             + "&cat2=A0207"
		             + "&cat3="
		             + "&listYN=Y"
		             + "&MobileOS=ETC"
		             + "&MobileApp=TourAPI3.0_Guide"
		             + "&arrange=A"
		             + "&numOfRows=10"
		             + "&pageNo=" + pageNo,
		            success: function (data) {
		
		                $(data).find('body').each(function () {
		                    var totalCount = $('totalCount', this).text();
		                    var pageNo = $('pageNo', this).text();
		                    paging(totalCount, 10, 5, pageNo);
		                });
		
		                $(data).find('item').each(function () {
		                    var title = $('title', this).text(); //제목
		                    var addr1 = $('addr1', this).text(); // 주소
		                    var addr2 = $('addr2', this).text(); //상세주소
		                    var tel = $('tel', this).text(); //전화번호
		                    var mapX = $('mapx', this).text(); //x좌표
		                    var mapY = $('mapy', this).text(); //y좌표
		                    var mlevel = $('mlevel', this).text(); //맵레벨
		                    var firstimage = $('firstimage', this).text(); //대표이미지(원본)
		                    var firstimage2 = $('firstimage2', this).text(); //대표이미지(썸네일)
		                    var contentid = $('contentid', this).text(); //행사아이디
		                    var contenttypeid = $('contenttypeid', this).text(); //행사타입
		
							var placePosition = new kakao.maps.LatLng(mapY, mapX),
		           				marker = addMarker(placePosition, count-1);//x,y좌표 넣어서 마커생성
		
							var el = document.createElement('li');
								el.className = 'item';//아이템 엘리먼트 생성
								
		                    var txt = 
		                         "<span class='markerbg marker_" + count + "'>"
		                         + "</span>"
		                         + "<div class='info' onClick='javascript:getSubData("+contenttypeid+","+contentid+")'>"
		                         + "<img src='"+firstimage2+"' style='width:150px; height:100px;'></img>"
		                         + "<h3>" + title + "</h3>"
		                         + "<span>" + addr1 + "</span>"
		                         + "<span class='tel'>" + tel + "</span>"
		                        
								el.innerHTML = txt;
		                  		count = count + 1;
		                       	$("#placesList").append(el);
		
							//마우스 이벤트로 인포윈도우 생성, 지도 마커로 이동
							(function(marker, title) {
								if(mapX!="" && mapY!=""){
						            kakao.maps.event.addListener(marker, 'mouseover', function() {
						                displayInfowindow(marker, title);
						            });
						
						            kakao.maps.event.addListener(marker, 'mouseout', function() {
						                infowindow.close();
						            });
			
						            el.onclick =  function () {
						                displayInfowindow(marker, title);
										panTo(mapY, mapX);
						            };
								}
					     	   })(marker, title);
		                });
		            }
		        });
    }

    /* 페스티벌 정보 API 끝 */

    /*-----------------페이징------------  */
    function paging(totalData, dataPerPage, pageCount, currentPage) {
        var totalPage = Math.ceil(totalData / dataPerPage); // 총 페이지 수
        var pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹

        var last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
        if (last > totalPage)
            last = totalPage;
        var first = last - (pageCount - 1); // 화면에 보여질 첫번째 페이지 번호
        var next = last + 1;
        var prev = first - 1;

        var $pingingView = $("#pagination");

        var html = "";

        if (prev > 0)
            html += "<a href=# id='prev'><</a> ";

        for (var i = first; i <= last; i++) {
			if(i > 0)
            	html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }

        if (last < totalPage)
            html += "<a href=# id='next'>></a>";

        $("#pagination").html(html); // 페이지 목록 생성
        $("#pagination a").css("color", "black");
        $("#pagination a#" + currentPage).css({
            "text-decoration": "none",
            "color": "red",
            "font-weight": "bold"
        }); // 현재 페이지 표시

        $("#pagination a").click(function () {
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();

            if ($id == "next")
                selectedPage = next;
            if ($id == "prev")
                selectedPage = prev;

			var keyword = $("#keyword").val();
            paging(totalData, dataPerPage, pageCount, selectedPage);
			getFestivalData(startDate2, endDate2, areaCode, sigunguCode, selectedPage, keyword);

        });
    }

    /*-----------------페이징 끝------------  */

    /* ----------------검색----------------- */

    $('#dateSearchBtn').click(function () {
		getFestivalData(startDate2, endDate2, areaCode, sigunguCode, 1, "");
		console.log("areaCode = "+areaCode);
		console.log("sigunguCode = "+sigunguCode);
    });

    $('#nameSearchBtn').click(function () {
		var keyword = $("#keyword").val();
		getFestivalData(startDate2, endDate2, areaCode, sigunguCode, 1, keyword);
		console.log("areaCode = "+areaCode);
		console.log("sigunguCode = "+sigunguCode);
		console.log("keyword = "+keyword);
    });
    /* ----------------검색 끝----------------- */

	
    /* ----------------축제 마커 찍기 시작----------------- */
	var markers = [];
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

    /* ----------------축제 마커 찍기 끝----------------- */

    /* ----------------맵 중심좌표 이동----------------- */
	function panTo(mapX, mapY) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(mapX, mapY);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        
    /* ----------------맵 중심좌표 끝----------------- */

    /* ----------------인포윈도우 시작----------------- */
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
    /* ----------------인포윈도우 끝----------------- */
	
	getFestivalData(startDate2, endDate2, areaCode, sigunguCode, 1, "");
});

