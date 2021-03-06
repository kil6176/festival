<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="resources/js/mobile/subMenuScript.js"></script>
<script src="resources/js/mobile/crossScript.js"></script>
<script src="resources/js/mobile/UIScript.js"></script>
<script src="resources/js/mobile/all.min.js"></script>
<script src="resources/js/mobile/jquery.ajax-cross-origin.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>초록축제</title>
<style>


.map-header-bar
{
	position:static;
	top: 0;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 130px;
	margin: 0px;
	overflow-y: auto;
	background: #32cd32;
	z-index: 10;
	font-size: 1rem;
	overflow:hidden;
}

.gonggan-header-bar
{
	position:relative;
	width: 100%;
	height: 130px;
	margin: 0px;
	overflow-y: auto;
	background: #32cd32;
	z-index: 1000;
	font-size: 1rem;
	overflow:hidden;
}

.searchList {
	display:inline-block; 
	width:calc(50% - 10px); 
	margin:0px;
	padding:0px;
	background: rgba(150, 150, 150, 0.5);
	text-align:center;  
	cursor: pointer;
	font-size:15px;
	font-weight:bold;
	height:50px;
	background-color:white;
}
.searchBtn
{
	display:inline-block; 
	height:100%;
	margin-top:15px;
}
.border-none-top
{
  border-bottom:1px solid black;
  border-left:1px solid black; 
  border-right:1px solid black;
}

.displayNone{
	display : none;
}

#placesList li {
	list-style: none;
}

ul {
	padding: 0px;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: normal;
}

#placesList .item .info {
	padding: 10px 0 10px 0px;
}

#placesList .info .gray {
	color: #8a8a8a;
}


#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
#festival-list{
	position:relative;
	top: 50%;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 400px;
	margin: 0px;
	overflow-y: auto;
	z-index: 10;
	font-size: 1rem;
	background-color:white;
	overflow:hidden;
}

.subList {
	display:inline-block; 
	width:40%; 
	text-align:center;  
	border:1px solid black; 
	padding:20px;
	cursor: pointer;
}

.subListClick {
	color: green;
	background: rgb(255, 255, 255);
	border-color: green;
}


.searchInputBox{
	height: 21.33px;
	width:110px;
	top:25px;
	position:relative;
}

.option{
	margin-bottom:40px;
}

.sub_list{
	margin:10px;
}
.sub_list_icon{
	display:inline-block;
}

#sub_contents{
	line-height: 20px;
	font-size: 16px;
	color: #404040;
	line-height: 1.6;
	letter-spacing: 0.25px;
}
.sub_text{
	display:inline-block;
}

#sub_button{
	padding-top:7px;
}

#watchPositionBtn
{
	position: absolute;
	top: 15%;
	width: 50px;
	height: 50px;
	margin: 0px;
	z-index: 1000;
}

.watchPosition
{
	background-color:green;
}
</style>
</head>
<body style="padding:0px; margin:0px;">
	<div class="map_wrap">
		<div class="map-header-bar" class="input-group input-group-lg">
			<div style="width: calc(100% - 10px); height:100%; margin:10px 5px 10px 5px;">
				<div style="height:50px; margin-bottom:10px;">
				<img src="resources/images/main/header_logo.png" style="background-color:#32cd32; max-width:30%; height:50px">
					<button style="float:right; height:100%;">메뉴</button>
				</div>
		  		<div align="center" style="width:100%; height:50px;">
		  			<div id="datePageBtn" class="SearchList" style="float:left;" >
		  				<span class="searchBtn">
		  				기간+지역으로 축제 검색
		  				</span>
		  			</div>
		  			<div id="namePageBtn" class="searchList" style="float:right;">
		  				<span class="searchBtn">축제명으로 축제 검색</span>
		  			</div>
		  		</div>
	  		</div>
		</div>
		<div id="map_size_wrap" style="width:100%; position:relative;height:calc(100% - 130px); overflow: hidden; padding:0px; margin:0px">
			<div id="map" style="width:100%; position:relative;height:100%; overflow: hidden; padding:0px; margin:0px">
			</div>
			<button id="watchPositionBtn">현재 위치</button>
		</div>
		
		<div id="festival-list" class="displayNone" style="overflow-y:scroll; height:70%;" align="center">
			<div style="z-index:100; border-bottom:1px solid black; background-color:white; width:100%; height:50px;" align='right'>
  				<span id="listExit">
  					<span class="fas fa-times" style="display:inline-block; margin-top: 4px; height:80%; width:50px;"></span>
  				</span>
  			</div>
  			<div>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		
		<div id="sub_wrap" class="displayNone"  style="overflow-y:scroll; height:70%;" align="center">
				<div id="sub_button">
					<span  class="fa-stack" style="width:100%; height:34px;">
						<button id="trashBtn" style="height: 40px;width: 200px;margin-top: 0px;margin-left: 33px;bottom: 3px;display: inline;position: relative;">빈 쓰레기통 찾기</button>
						<i id="hiddenBtn" class="fas fa-times hiddenBtn" style="margin-left: 7px;float: right;font-size: 2.6em;bottom: 5px;position: relative;"></i>
					</span>
				</div>
				<hr>
				<div id="sub_info">
					<div id="sub_main" style="text-align:center;">
						<img id="sub_image" width="280px" height="200px" src=""></img>
						<h1 id="sub_name"></h1>
					</div>
					
					<div id="sub_detail">	
						<ul style="list-style:none;">
							<li class="sub_list">
								<span class="sub_list_icon">
									<i class="fas fa-phone-alt" style="font-size:17px;"></i>
									<span id="sub_tel" class="sub_text"></span>
								</span>	
							</li>
							<hr>
							<li class="sub_list">
								<span class="sub_list_icon">
									<i class="fas fa-map-marker-alt" style="font-size:17px;"></i>
									<span id="sub_address" class="sub_text"></span>
								</span>
							</li>
							<hr>
							<li class="sub_list">
								<span class="sub_list_icon">
									<i class="fas fa-user-alt" style="font-size:17px;"></i>
									<span id="sub_age" class="sub_text"></span>
								</span>	
							</li>
							<hr>					
							<li class="sub_list">
								<span class="sub_list_icon">
									<i class="far fa-calendar-alt " style="font-size:17px;"></i>
									<span id="sub_date" class="sub_text"> </span>
								</span>
							</li>		
							<hr>			
							<li class="sub_list">
								<span class="sub_list_icon">
									<i class="far fa-clock " style="font-size:17px;"></i>
									<span id="sub_time" class="sub_text"></span>
								</span>
							</li>			
							<hr>							
							<li class="sub_list">
								<span class="sub_list_icon">
								<i class="fas fa-coins" style="font-size:17px;"></i>
								<span id="sub_money" class="sub_text"></span>
								</span>
							</li>
							<hr>
							<li class="sub_list">
								<span class="sub_list_icon">
									<i class="fas fa-home" style="font-size:17px;"></i>
									<span id="sub_home" class="sub_text"></span>
								</span>
							</li>
							<hr>
							<li class="sub_list">
								<p id="sub_contents">축제내용</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
	</div>

	<div id="serach-gonggan" class="displayNone">
		<div class="gonggan-header-bar">
	  		<div style="width: calc(100% - 10px); height:100%; margin:10px 5px 10px 5px;">
					<div style="height:50px; margin-bottom:10px;">
						<button style="position:relative; height:100%;">로고</button>
						<span>초록축제</span>
						<button style="float:right; height:100%;">메뉴</button>
					</div>
			  		<div align="center" style="width:100%; height:50px;">
			  			<div id="dateSearch" class="SearchList" style="float:left;" >
			  				<span class="searchBtn">
			  				기간+지역으로 축제 검색
			  				</span>
			  			</div>
			  			<div id="nameSearch" class="searchList" style="float:right;">
			  				<span class="searchBtn">축제명으로 축제 검색</span>
			  			</div>
			  		</div>
		  	</div>
  		</div>
  		<div class="gonggan-search-bar" style="width:100%; height:100%;">
  			<div style="height:50px; border: 1px solid black; overflow:hidden;">
  				<span id="searchExit">
  					<a href="#" style="color:black;"><span class="fas fa-chevron-left" style="display:inline-block; margin-top: 7px; height:70%; width:50px;"></span></a>
  				</span>
  			</div>
  			<div id="dateOption">
	  			<div class="border-none-top" style="height:60px;" align="center">
	  				<p style="margin:0; height:40px;  font-size:30px;">지역</p>
	  				<p style="margin:0; height:20px; font-size:1rem">▼</p>
	  			</div>
	  			<div class="border-none-top" style="height:110px; " align="center">
	  				<div style="">
						<select class="areacode searchInputBox" style="font-size: 1.5rem; overflow-y:scroll; width:40%;  height:55px;">
							<option value="" >지역 선택</option>
						</select>
		
						<select  class="sigunguCode searchInputBox" style="font-size: 1.5rem; overflow-y:scroll; width:40%; height:55px;">
							<option value="" >시군구 선택</option>
						</select>
					</div>
	  			</div>
	  			
	  			<div class="border-none-top" style="height:60px;"align="center">
	  				<p style="margin:0; height:40px;  font-size:30px;">기간</p>
	  				<p style="margin:0; height:20px; font-size:1rem">▼</p>
	  			</div>
	  			
	  			<div class="border-none-top" style="height:110px;" align="center">
	  				<div style="">
						<input type="date" id="startDate" class="searchInputBox"  name="startDate" value="" autocomplete="off" style="font-size: 1.2rem; overflow-y:scroll; width:40%; height:55px;">
						<input type="date" id="endDate" class="searchInputBox"  name="endDate" value="" autocomplete="off" style="font-size: 1.2rem; overflow-y:scroll; width:40%; height:55px;">
	  				</div>
	  			</div>
	  			<div  class="border-none-top" style="height:60px;">
		  			<span id="dateSearchBtn">
						<a href="#" style="color:black;"><span  class="fa fa-search" style="display:inline-block; float:right; margin-top: 7px; height:45px; width:100%;"></span></a>
					</span>
	  			</div>
  			</div>
  			
  			<div id="nameOption" class="optionHidden">
	  			<div class="border-none-top" style="height:110px;" align="center">
	  				<p style="margin:0; height:50px;  font-size:30px;">축제명</p>
  					<input type="text" style="height: 50px; width:80%" id="keyword" name="keyword" value="">
	  			</div>
	  			<div  class="border-none-top" style="height:60px;">
		  			<span id="nameSearchBtn">
						<a href="#" style="color:black;"><span  class="fa fa-search" style="display:inline-block; float:right; margin-top: 7px; height:45px; width:100%;"></span></a>
					</span>
	  			</div>
  			</div>
  		</div>
	</div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee02c1c9ce632acddab0b05095b5e657"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	    /* ----------------맵 중심좌표 이동----------------- */
		function panTo(mapX, mapY) {
			if(mapX == 0 || mapY == 0)
			{
				alert("좌표 정보가 등록 되어있지 않은 축제입니다.");	
			}
			else
			{
	    	relayOut();
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(mapY, mapX);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);
			}
		}        
	    /* ----------------맵 중심좌표 끝----------------- */
	    function relayOut() {
	    	map.relayout();
		}      
		var id, target, option;
		var watchPosition;
		$("#watchPositionBtn").off().click(function(){
		   	if (!$(this).hasClass("watchPosition")) 
		   	{
		   		$("#watchPositionBtn").addClass('watchPosition');

				if (navigator.geolocation) {
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				 watchPosition = setInterval(function()
				    {
					    navigator.geolocation.getCurrentPosition(function(position) {
					        removeMarker();
					        var lat = position.coords.latitude, // 위도
					            lon = position.coords.longitude; // 경도

								panTo(lon, lat);
					        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					        

							var placePosition = new kakao.maps.LatLng(lat, lon),
		           				marker = addMarker(placePosition);//x,y좌표 넣어서 마커생성
					            
					      });
				    },1000);
				}
		   	}
		   	else
		   	{
		   		removeMarker();
		   		clearInterval(watchPosition);
		   		$("#watchPositionBtn").removeClass('watchPosition');
		   	}
		}); 
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		 /* ----------------축제 마커 찍기 시작----------------- */
		var markers = [];
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position) {
		    var imageSrc = 'http://festival.dothome.co.kr/img/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (3*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
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
/*
		if(navigator.geolocation)
		{ // geolocation 을 지원한다면 위치를 요청한다. 
	   		$("#watchPositionBtn").addClass('watchPosition');
			function success(pos) 
			{
			   	if (!$(this).hasClass("watchPosition")) 
			   	{
			    	console.log('Congratulation, you reach the target');
			    	navigator.geolocation.clearWatch(id);
			    }
		   	
		    	function error(err) 
		    	{
		    	  console.warn('ERROR(' + err.code + '): ' + err.message);
		    	};

		    	target = 
		    	{
		    	  latitude : 0,
		    	  longitude: 0,
		    	}
	
		    	options = 
		    	{
		    	  enableHighAccuracy: false,
		    	  timeout: 100,
		    	  maximumAge: 0
		    	};

	    	id = navigator.geolocation.watchPosition(success, error, options);
			}
		}
		else
	        elt.innerHTML = "이 브라우저에서는 Geolocation이 지원되지 않습니다.";
	        */
	</script>
</body>
</html>