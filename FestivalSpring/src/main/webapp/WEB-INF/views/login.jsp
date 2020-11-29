<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<title>로그인</title>
		
		
		<style>
			.displayNone
			{
				display:none;
			}
		</style>
	</head>
	
	<body>
		<section id="container-fluid" style="max-width:500px; margin:auto;">
			<div id="login_view">
				<form action="/login.do" method="post">
					<div align="center"><a href="/"><img style="max-width:100%;" src="/resources/images/banner/banner.png" /></a></div>
												
					<div class="form-group has-feedback" style="margin-bottom:7px;">
						<h2>로그인</h2>
						<hr>
					</div>
					
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
							<a class="find_id_view_btn"> 아이디 찾기 </a>
							&nbsp&nbsp|&nbsp&nbsp
							<a class="find_pw_view_btn"> 패스워드 찾기 </a>
					</div>
				</form>
			</div>
			
			<div id="find_id_view"  class="displayNone">
				<div align="center"><a href="/"><img style="max-width:100%;" src="/resources/images/banner/banner.png" /></a></div>
				
				<div class="form-group has-feedback" style="margin-bottom:7px;">
					<h2>아이디 찾기</h2>
					<hr>
				</div>
				
				<div class="form-group has-feedback" style="margin-bottom:7px;">
					<input class="form-control" type="text" id="find_id_m_name" name="find_id_m_name" placeholder="이름을 입력 해주세요" style="height: 50px;"/>
				</div>
				
				<div class="form-group has-feedback" style="margin-bottom:15px;">
					<input class="form-control" type="text" id="find_id_m_email" name="find_id_m_email" placeholder="이메일을 입력 해주세요" style="height: 50px;"/>
				</div>
				
				<div class="form-group has-feedback" align="right">
					<button onClick="find_ID()" class="btn btn-success" type="button" id="find_id_btn" style="font-size:20px; font-weight:bold; height: 60px; width:100%;">확인</button>
				</div>
				<div style="width:100%; text-align:center;">
						<a href="/register.do"> 회원가입 </a>
						&nbsp&nbsp|&nbsp&nbsp
						<a class="login_view_btn"> 로그인 </a>
						&nbsp&nbsp|&nbsp&nbsp
						<a class="find_pw_view_btn"> 패스워드 찾기 </a>
				</div>
			</div>
			
			<div id="find_pw_view" class="displayNone">
				<div align="center"><a href="/"><img style="max-width:100%;" src="/resources/images/banner/banner.png" /></a></div>
				
				<div class="form-group has-feedback" style="margin-bottom:7px;">
					<h2>패스워드 찾기 / 변경</h2>
					<hr>
				</div>
				
				<div class="form-group has-feedback" style="margin-bottom:7px;">
					<label class="control-label" for="find_pw_m_id"></label>
					<input class="form-control" type="text" id="find_pw_m_id" name="find_pw_m_id" placeholder="아이디를 입력 해주세요" style="height: 50px;"/>
				</div>
				
				<div class="form-group has-feedback" style="margin-bottom:15px;">
					<label class="control-label" for="find_pw_m_name"></label>
					<input class="form-control" type="text" id="find_pw_m_name" name="find_pw_m_name" placeholder="이름을 입력 해주세요" style="height: 50px;"/>
				</div>
				
				<div class="form-group has-feedback" style="margin-bottom:15px;">
					<label class="control-label" for="find_pw_m_email"></label>
					<input class="form-control" type="text" id="find_pw_m_email" name="find_pw_m_email" placeholder="이메일을 입력 해주세요" style="height: 50px;"/>
				</div>
				
				<div class="form-group has-feedback" align="right">
					<button onclick="find_PW()" class="btn btn-success" type="button" id="find_pw_btn" style="font-size:20px; font-weight:bold; height: 60px; width:100%;">확인</button>
				</div>
				<div style="width:100%; text-align:center;">
						<a href="/register.do"> 회원가입 </a>
						&nbsp&nbsp|&nbsp&nbsp
						<a class="login_view_btn"> 로그인 </a>
						&nbsp&nbsp|&nbsp&nbsp
						<a class="find_id_view_btn"> 아이디 찾기 </a>
				</div>
			</div>
		</section>
		<script>
		function find_ID()
		{
			var name = $("#find_id_m_name").val();
			var email = $("#find_id_m_email").val();
			$.ajax(
			{
				url: "/selectFindID.do",
				data: 
				{
				    "m_name": name,
				    "m_email": email
				},
				dataType: "JSON",
				async: false,
				type: "POST",
				success: function(data)
				{
					var str ="";
					for(var i=0 ; i<data.length ; i++)
					{
						str = str + data[i].m_id + "\n";	
					}
					if(data!="")
						alert("입력하신 정보로 가입된 아이디 : \n"+ str);
					else
						alert("입력하신 정보의 아이디가 없습니다.");
					
				}
			});
		}
		
		function find_PW()
		{
			var id = $("#find_pw_m_id").val();
			var name = $("#find_pw_m_name").val();
			var email = $("#find_pw_m_email").val();
			
			$.ajax(
			{
				url: "/updateFindPW.do",
				data: 
				{
				    "m_id": id,
				    "m_name": name,
				    "m_email": email
				},
				dataType: "text",
				async: false,
				type: "POST",
				success: function(data)
				{
					console.log("성공");
					if(data!="")
						window.prompt("임시비밀번호가 발급 되었습니다. 로그인 하시고 바로 비밀번호를 바꿔주세요 \n 임시 비밀번호 : ", data);
					
					else
						alert("입력하신 정보가 없어 패스워드 변경이 불가합니다.");	
				}
			});
		}
		
		$(".login_view_btn").click(function()
		{
			$("#login_view").removeClass("displayNone");
			$("#find_id_view").addClass("displayNone");
			$("#find_pw_view").addClass("displayNone");
		});

		$(".find_id_view_btn").click(function()
		{
			$("#find_id_view").removeClass("displayNone");
			$("#login_view").addClass("displayNone");
			$("#find_pw_view").addClass("displayNone");
		});

		$(".find_pw_view_btn").click(function()
		{
			$("#find_pw_view").removeClass("displayNone");
			$("#find_id_view").addClass("displayNone");
			$("#login_view").addClass("displayNone");
		});
		</script>
	</body>
</html>
		
		