<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>로그인</title>
</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
		})
	</script>
	<body>
		<section id="container-fluid" style="max-width:500px; margin:auto;">
			<form action="/login.do" method="post">
				<div align="center"><a href="/"><img style="max-width:100%;" src="/resources/images/banner/banner.png" /></a></div>
				<div class="form-group has-feedback" style="margin-bottom:7px;">
					<label class="control-label" for="m_id"></label>
					<input class="form-control" type="text" id="m_id" name="m_id" placeholder="아이디" style="height: 50px;"/>
				</div>
				
				<div class="form-group has-feedback" style="margin-bottom:15px;">
					<label class="control-label" for="m_pw"></label>
					<input class="form-control" type="password" id="m_pw" name="m_pw" placeholder="비밀번호" style="height: 50px;"/>
				</div>
				
				<c:if test="${msg == false}">
					<p style="font-align:left; color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
				
				<div class="form-group has-feedback" align="right">
					<button class="btn btn-success" type="submit" id="submit" style="font-size:20px; font-weight:bold; height: 60px; width:100%;">로그인</button>
							
				
				</div>
				<div style="width:100%; text-align:center;">
						<a href="/register.do"> 회원가입 </a>
						&nbsp&nbsp|&nbsp&nbsp
						<a class=""> 아이디 찾기 </a>
						&nbsp&nbsp|&nbsp&nbsp
						<a class=""> 패스워드 찾기 </a>
				</div>
			</form>
		</section>
		
	</body>
</html>
	</body>
		
		