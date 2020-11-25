<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/logout.do";
		})
		
	})
</script>
<body>
	<form name='homeForm' method="post" action="/login">
			<div>
			
				<c:choose>
					<c:when test="${member == null}">
						<p>로그인 안 되어있음</p>
					</c:when>
				
					<c:when test="${member != null }">
							<p>${member.m_id}님 환영 합니다.</p>
							<button id="logoutBtn" type="button">로그아웃</button>
					</c:when>
				</c:choose>
				<br>
				<a href="/register.do">가입페이지</a>
				<br>
				<a href="/login.do">로그인페이지</a>
				<br>
				<a href="/trashMap.do">지도 페이지</a>
				<br>
				<a href="/mTrashMap.do">모바일 지도 페이지</a>
				<br>
				<a href="/manager.do">마이 페이지 겸 관리 페이지</a>
			</div>
	</form>
</body>
</html>