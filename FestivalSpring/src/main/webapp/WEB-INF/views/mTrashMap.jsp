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
<meta name="viewport" content="width=1080, initial-scale=1">
<title>2020-10-27</title>
<style>

#serach-bar
{
	position:absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 15%;
	margin: 0px;
	overflow-y: auto;
	background: #32cd32;
	z-index: 1;
	font-size: 1rem;
}

</style>
</head>
<body style="padding:0px; margin:0px;">
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; padding:0px; margin:0px"></div>
		<div id="serach-bar" class="input-group input-group-lg">
			<div style="width:100%; height:45%; margin:0.5% 1% 0.5% 1%;">
				<button style="position:relative; height:100%;">로고</button>
				<span>초록축제</span>
				<button style="float:right; margin-right:2% ; height:100%;">메뉴</button>
			</div>
	  		<div align="center" style="width:100%; height:45%;">
	  			<input type="text" class="form-control" placeholder="축제 검색" aria-describedby="sizing-addon1" style="height:100%; width:98%;">
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