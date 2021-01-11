    /* ----------------상세메뉴 시작----------------- */
	function getSubData(contentTypeId, contentId) {
		$("#trashBtn").removeAttr("onclick");
		
		removeCanMarker();
	
        var subInfo1 = 
		$.ajax({
            type: "GET",
            dataType: 'xml',
			crossOrigin: true,
			proxy: "https://www.festvalcl.tk/proxy.php",
            url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"
             + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
             + "&contentTypeId=" + contentTypeId
             + "&contentId=" + contentId
             + "&MobileOS=ETC"
             + "&MobileApp=TourAPI3.0_Guide"
             + "&defaultYN=Y"
             + "&firstImageYN=Y"
             + "&listYN=Y"
             + "&catcodeYN=Y"
             + "&addrinfoYN=Y"
             + "&mapinfoYN=Y"
             + "&overviewYN=Y"
             + "&transGuideYN=Y"});
		subInfo1.done(subInfoFunc1);
	
        function subInfoFunc1(data) {
            $(data).find('item').each(function () {
                var title = $('title', this).text(); //제목
                var addr1 = $('addr1', this).text(); // 주소
                var tel = $('tel', this).text(); //전화번호
			    var homepage = $('homepage', this).text(); //홈페이지
			    var overview = $('overview', this).text(); //개요
			    var firstimage = $('firstimage', this).text(); //이미지
			    var contentid = $('contentid', this).text(); //콘텐츠아이디
					
                $("#sub_name").text(title);
                $("#sub_tel").text(tel);
                $("#sub_address").text(addr1);
                $("#sub_home").html(homepage);
                $("#sub_contents").html(overview);
				$("#sub_image").attr("src", firstimage);

					
				var subInfo2 = $.ajax({
		            type: "GET",
		            dataType: 'xml',
					crossOrigin: true,
					proxy: "https://www.festvalcl.tk/proxy.php",
		            url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?"
		             + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
		             + "&contentTypeId=" + contentTypeId
		             + "&contentId=" + contentId
		             + "&MobileOS=ETC"
		             + "&MobileApp=TourAPI3.0_Guide"
				});
				subInfo2.done(subInfoFunc2);
				
				 function subInfoFunc2(data){
					  $(data).find('item').each(function () {
			                var agelimit = $('agelimit', this).text(); //이용연령
			                var spendtimefestival = $('spendtimefestival', this).text(); //행사시간
			                var usetimefestival = $('usetimefestival', this).text(); //이용요금
			                var eventenddate = $('eventenddate', this).text(); //행사종료일
			                var eventstartdate = $('eventstartdate', this).text(); //행사시작일
			
			                $("#sub_time").html(spendtimefestival);
			                $("#sub_age").html(agelimit);
			                $("#sub_money").html(usetimefestival);
			                $("#sub_date").html(eventstartdate+" ~ "+eventenddate);
					});
				}
			
				$("#trashBtn").attr("onclick","trashCan_Search("+contentid+");");
            });
        }
    }

    /* ----------------상세메뉴 끝----------------- */

    /* ----------------쓰레기통 검색----------------- */
	function trashCan_Search(contentID) {
		var redMarker = 0;
		var yellowMarker = 1;
		var greenMarker = 2;
		var blueMarker = 3;
		var contentData = {"contentID" : contentID};
		removeCanMarker();
        $.ajax({
			url: "/trashCanSearch.do",
            type: "POST",
			data : {"fc_num" : contentID},
            dataType: 'json',
            success: function (data) {
			console.log("성공");
			for(var i = 0 ; i < data.length; i++){
					var obj = data;
	                var id = obj[i].t_id ;//쓰레기통 id
					console.log(id);
	                var trashHeight = obj[i].t_height; // 쓰레기의 높이
					console.log(trashHeight);
	                var canSize = obj[i].t_can_height; //쓰레기통 사이즈
	
					console.log(canSize);
	                var canX = obj[i].x; //쓰레기통 x
	                var canY = obj[i].y; //쓰레기통 y
	               // var date = $('date', this).text(); //쓰레기통 로그 날짜
	               // var groupName = $('groupName', this).text(); //쓰레기통 설치 축제명
				  //var contentID = contentID; //쓰레기통 설치 축제 아이디
					var canPosition = new kakao.maps.LatLng(canY, canX);
					var canMarker = "";
					var trashPersent = (canSize / trashHeight)/canSize*100;
					
					//퍼센트로 마커 색깔 정하기
					if(trashPersent <= 25)
	       				canMarker = addCanMarker(canPosition, blueMarker);//x,y좌표 넣어서 마커생성
					else if(25 < trashPersent && trashPersent <= 50)
						canMarker = addCanMarker(canPosition, greenMarker);//x,y좌표 넣어서 마커생성
					else if(50 < trashPersent && trashPersent <= 75)
						canMarker = addCanMarker(canPosition, yellowMarker);//x,y좌표 넣어서 마커생성
					else if(75 < trashPersent)
						canMarker = addCanMarker(canPosition, redMarker);//x,y좌표 넣어서 마커생성
						
					//마우스 이벤트로 인포윈도우 생성, 지도 마커로 이동
					(function(canMarker, trashPersent) {
						if(canX!="" && canY!=""){
				            kakao.maps.event.addListener(canMarker, 'mouseover', function() {
				                displayCanInfowindow(canMarker, trashPersent);
				            });

				            kakao.maps.event.addListener(canMarker, 'mouseout', function() {
				                canInfowindow.close();
				            });
						}
			     	})(canMarker, trashPersent);
				}
            }
        });
    }
    /* ----------------쓰레기통 검색 끝----------------- */

    /* ----------------쓰레기통 마커 시작----------------- */
	//상세메뉴 닫기 버튼 누를시 쓰레기통 마커 삭제
	$(document).on('click',".hiddenBtn",function(){
	     removeCanMarker(); 
	});
	var canMarkers = [];
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addCanMarker(canPosition, idx) {
	    var imageSrc = 'http://festival.dothome.co.kr/img/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            canMarker = new kakao.maps.Marker({
	            position: canPosition, // 마커의 위치
	            image: markerImage 
	        });
	
	    canMarker.setMap(map); // 지도 위에 마커를 표출합니다
	    canMarkers.push(canMarker);  // 배열에 생성된 마커를 추가합니다
	
	    return canMarker;
	}
	
	// 지도 위에 표시되고 있는 쓰레기통 마커를 모두 제거합니다
	function removeCanMarker() {
	    for ( var i = 0; i < canMarkers.length; i++ ) {
	        canMarkers[i].setMap(null);
	    }   
	    canMarkers = [];
	}
    /* ----------------쓰레기통 마커 끝----------------- */
    /* ----------------인포윈도우 시작----------------- */
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	var canInfowindow ="";
	function displayCanInfowindow(canMarker, trashPersent) {
		canInfowindow = new kakao.maps.InfoWindow({zIndex:1});
	    var content = '<div style="padding:5px;z-index:1;">' + trashPersent + '% </div>';
	
	    canInfowindow.setContent(content);
	    canInfowindow.open(map, canMarker);
	}
    /* ----------------인포윈도우 끝----------------- */
