<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<meta charset="utf-8">
<title>쓰레기통 좌표</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		지도를 클릭해주세요!
	</p>
	<div id="clickLatlng"></div>
	<input type="hidden" class="add_x" value="<%=request.getParameter("x")%>">
	<input type="hidden" class="add_y" value="<%=request.getParameter("y")%>">
	<input type="hidden" class="type" value="<%=request.getParameter("type")%>">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee02c1c9ce632acddab0b05095b5e657"></script>
<script>
function setXY(x, y){
	if(type == "add")
	{
		$(".add_x",opener.document).val(x);
		$(".add_y",opener.document).val(y);
	}
	else
	{
		$(".change_x",opener.document).val(x);
		$(".change_y",opener.document).val(y);
	}
	self.close();
}
var x = $(".add_x").val();
var y = $(".add_y").val();
var type = $(".type").val();
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = "마커위치에 쓰레기통을 추가 하시겠습니까? <button onclick='setXY("+latlng.getLng()+","+ latlng.getLat() +")'>확인</button>";
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});
</script>
</body>
</html>