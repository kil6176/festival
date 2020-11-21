<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.sql.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="resources/js/subMenuScript.js"></script>
<script src="resources/js/script.js"></script>
<script src="resources/js/UIScript.js"></script>
<script src="resources/js/all.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2020-10-27</title>
<style>
.hasDatepicker {
	width :70px;
}

.hidden{
	display: none;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: '맑은 고딕', sans-serif;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 100%;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 300px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.9);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px 0 0 10px;
}

#sub_wrap {
	border-left:1px solid #909090;
	position: absolute;
	top: 0;
	left: 310px;
	bottom: 0;
	width: 300px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.9);
	z-index: 1;
	font-size: 12px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#sub_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 5px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
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
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
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

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
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

.searchList {
	display:inline-block; 
	width:50%; 
	margin:0px;
	padding:0px;
	background: rgba(150, 150, 150, 0.5);
	text-align:center;  
	border-bottom:1px solid black; 
	cursor: pointer;
	font-size:15px;
	font-weight:bold;
	height:25px;
}
.searchListClick {
	color: green;
	background: rgb(255, 255, 255);
	border-color:green;
}

.subList {
	display:inline-block; 
	width:40%; 
	text-align:center;  
	border:1px solid black; 
	padding:2.0%;
	cursor: pointer;
}

.subListClick {
	color: green;
	background: rgb(255, 255, 255);
	border-color: green;
}

.optionHidden{
	display : none;
}

.searchInputBox{
	height: 21.33px;
	width:110px;
}

.option{
	margin-bottom:40px;
}

.sub_list{
	margin:10px;
}
.sub_list_icon{
	display:inline-block;
	width:13%;
}

#sub_contents{
	line-height: 20px;
	font-size: 13px;
	color: #404040;
	line-height: 1.6;
	letter-spacing: 0.25px;
}
.sub_text{
display:inline-block; width:80%
}
</style>
</head>
<body>
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<div id="menu_wrap" class="bg_white">
				<div id="dateOption" class="option">
						<table style="margin-left: auto; margin-right: auto; border-spacing: 0 5px;">
							<tr>
								<th style="margin: 50px;" >지역</th>
								<td rowspan="3"><div style="width:36px;"></div></td>
								<th style="margin: 50px;" >기간</th>
							</tr>
							<tr>
								<td>
									<select class="areacode searchInputBox">
										<option value="" >지역 선택</option>
									</select>
								</td>
								<td>
									<input type="text" id="startDate" class="searchInputBox"  name="startDate" value="" autocomplete="off">
								</td>
							</tr>
							
							<tr>
								<td>
									<select class="sigunguCode searchInputBox">
										<option value="" >시군구 선택</option>
									</select>
			 					</td>
								<td>
									<input type="text" id="endDate" class="searchInputBox" name="endDate" value="" autocomplete="off">
								</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td  id="dateSearchBtn" colspan="3" style=" border:1px solid black; text-align:center;">
									<p class="fas fa-search" style="font-size:20px;  margin-top:5px; margin-bottom:5px;"></p>
								</td>
							</tr>
					</table>
				</div>
				
				<div id="nameOption" class="option optionHidden">
						<table style="margin-left: auto; margin-right: auto; border-spacing: 0 5px;">
							<tr>
								<th colspan="3">축제 명</th>
							</tr>
							<tr>
								<td  colspan="3">
									<input type="text" style="height: 25px; width:254px" id="keyword" name="keyword" value="">
								</td>
							</tr>
							<tr></tr>
							<tr>
								<td  id="nameSearchBtn" colspan="3" style=" border:1px solid black; text-align:center;">
									<p class="fas fa-search" style="font-size:20px;  margin-top:5px; margin-bottom:5px;"></p>
								</td>
							</tr>
					</table>
				</div>
				
				<div align="center" style="overflow:hidden;">
					<span id="dateSearch" style="float:left;" class="searchList searchListClick">기간으로 검색</span>
					<span id="nameSearch" style="float:right;" class="searchList">축제 명으로 검색</span>
				</div>
				
				<ul id="placesList"></ul>
				
				<div id="pagination"></div>
			</div>
			<div id="sub_wrap" class="hidden">
				<div id="sub_button" align="right">
					<span id="trashBtn" class="fa-stack">
						<i class="fas fa-trash fa-stack-1x" style="font-size:2.5em;"></i>
						<i class="fas fas fa-search fa-stack-1x" style=" left:7px; top:9px; color:white; font-size:1.5em;"></i>
					</span>
					<i id="hiddenBtn" class="fas fa-times" style="margin-left:7px; font-size:2.6em;"></i>
				</div>
				<hr>
				<div id="sub_menu" align="center">
					<span id="sub_detail_view" class="subList subListClick">축제 정보</span>
					<span id="sub_image_view" class="subList">축제 이미지</span>
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
								<span class="sub_list_icon"><i class="fas fa-phone-alt" style="font-size:17px;"></i></span>	
								<span id="sub_tel" class="sub_text"></span>
							</li>
							<hr>
							<li class="sub_list">
								<span class="sub_list_icon"><i class="fas fa-map-marker-alt" style="font-size:17px;"></i></span>
								<span id="sub_address" class="sub_text"></span>
							</li>
							<hr>
							<li class="sub_list">
								<span class="sub_list_icon"><i class="fas fa-user-alt" style="font-size:17px;"></i></span>	
								<span id="sub_age" class="sub_text"></span>
							</li>
							<hr>					
							<li class="sub_list">
								<span class="sub_list_icon"><i class="far fa-calendar-alt " style="font-size:17px;"></i></span>
								<span id="sub_date" class="sub_text"> </span>
							</li>		
							<hr>			
							<li class="sub_list">
								<span class="sub_list_icon"><i class="far fa-clock " style="font-size:17px;"></i></span>
								<span id="sub_time" class="sub_text"></span>
							</li>			
							<hr>							
							<li class="sub_list">
								<span class="sub_list_icon"><i class="fas fa-coins" style="font-size:17px;"></i></span>
								<span id="sub_money" class="sub_text"></span>
							</li>
							<hr>
							<li class="sub_list">
								<span class="sub_list_icon"><i class="fas fa-home" style="font-size:17px;"></i></span>
								<span id="sub_home" class="sub_text"></span>
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
	<script type="text/javascript"
		src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=ee02c1c9ce632acddab0b05095b5e657"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	</script>
</body>
</html>