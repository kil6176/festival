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
<script src="resources/js/mobile/subMenuScript.js"></script>
<script src="resources/js/mobile/script.js"></script>
<script src="resources/js/mobile/UIScript.js"></script>
<script src="resources/js/mobile/all.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2020-10-27</title>
<style>


.map-header-bar
{
	position:absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 130px;
	margin: 0px;
	overflow-y: auto;
	background: #32cd32;
	z-index: 1;
	font-size: 1rem;
	overflow:hidden;
}

.gonggan-header-bar
{
	position:relative;
	width: 100%;
	height: 70px;
	margin: 0px;
	overflow-y: auto;
	background: #32cd32;
	z-index: 1;
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
</style>
</head>
<body style="padding:0px; margin:0px;">
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; padding:0px; margin:0px"></div>
		
		<div class="map-header-bar" class="input-group input-group-lg">
			<div style="width: calc(100% - 10px); height:100%; margin:10px 5px 10px 5px;">
				<div style="height:50px; margin-bottom:10px;">
					<button style="position:relative; height:100%;">로고</button>
					<span>초록축제</span>
					<button style="float:right; height:100%;">메뉴</button>
				</div>
		  		<div align="center" style="width:100%; height:50px;">
		  			<div id="datePageBtn" class="SearchList" style="float:left;" >
		  				<span class="searchBtn">
		  				기간으로 축제 검색
		  				</span>
		  			</div>
		  			<div id="namePageBtn" class="searchList" style="float:right;">
		  				<span class="searchBtn">축제명으로 축제 검색</span>
		  			</div>
		  		</div>
	  		</div>
		</div>
	</div>

	<div id="serach-gonggan" class="displayNone">
		<div class="gonggan-header-bar">
			<div style="width: calc(100% - 10px); height:100%; margin:10px 5px 10px 5px;">
		  		<div align="center" style="width:100%; height:50px;">
		  			<div id="dateSearch" class="searchList" style="float:left;" >
		  				<span class="searchBtn">
		  				 	기간+지역
		  				</span>
		  			</div>
		  			<div id="nameSearch" class="searchList" style="float:right;">
		  				<span class="searchBtn">축제명</span>
		  			</div>
		  		</div>
	  		</div>
  		</div>
  		<div class="gonggan-search-bar" style="width:100%; height:auto;">
  			<div style="height:50px; border: 1px solid black; overflow:hidden;">
  				<span id="searchExit">
  					<span class="fas fa-chevron-left" style="display:inline-block; margin-top: 7px; height:70%; width:50px;"></span>
  				</span>
	  			<span id="dateSearchBtn">
					<span  class="fa fa-search" style="display:inline-block; float:right; margin-top: 7px; height:70%; width:50px;"></span>
				</span>
  			</div>
  			<div id="dateOption">
	  			<div class="border-none-top" style="height:60px;" align="center">
	  				<p style="margin:0; height:40px;  font-size:30px;">지역</p>
	  				<p style="margin:0; height:20px; font-size:1rem">▼</p>
	  			</div>
	  			<div class="border-none-top" style="height:60px;" align="center">
	  				<div style="margin-top:3px;">
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
	  			
	  			<div class="border-none-top" style="height:60px;" align="center">
	  				<div style="margin-top:3px;">
						<input type="date" id="startDate" class="searchInputBox"  name="startDate" value="" autocomplete="off" style="font-size: 1.2rem; overflow-y:scroll; width:40%; height:55px;">
						<input type="date" id="endDate" class="searchInputBox"  name="endDate" value="" autocomplete="off" style="font-size: 1.2rem; overflow-y:scroll; width:40%; height:55px;">
	  				</div>
	  			</div>
  			</div>
  			
  			<div id="nameOption" class="optionHidden">
	  			<div class="border-none-top" style="height:110px;" align="center">
	  				<p style="margin:0; height:50px;  font-size:30px;">축제명</p>
  					<input type="text" style="height: 50px; width:80%" id="keyword" name="keyword" value="">
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