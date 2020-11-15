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
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){

				var idPattern = /^[a-z]+[a-z0-9]{5,19}$/g;
				var pwPattern = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
			    var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			    var phonePattern = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			    var namePattern = /^[가-힣]{2,4}$/;
				var blank_pattern = /^\s+|\s+$/g;
			    
			    var id = document.getElementById("id");
			    var pw = document.getElementById("password");
			    var correctPassword = document.getElementById("rePassword");
			    var userEmail = document.getElementById("email");
			    var phone = document.getElementById("phone");
			    var name = document.getElementById("name");
			    var birth = document.getElementById("birth");


			    function checkSpace(str) 
			    { 
			    	if(str.search(/\s/) != -1) 
			    	{ 
			    		return true; 
			    	} 
			    	else 
			    	{ 
			    		return false; 
			    	} 
			    }

				if( id.value == '' || id.value == null )
				{
				    alert( '아이디를 입력해주세요' );
				    return false;
				}

				if( id.value.replace( blank_pattern, '' ) == "" )
				{
				    alert(' 아이디에 공백만 입력되었습니다 ');
				    return false;
				}

				if(checkSpace(id.value))
				{
				    alert(' 아이디에 공백은 사용할 수 없습니다. ');
				    return false;
				}
				
				if( password.value == '' || password.value == null )
				{
				    alert( '비밀번호를 입력해주세요' );
				    return false;
				}
				
				if( pwPattern.test(password.value) != true)
				{
				    alert('비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이여야 합니다.');
				    return false;
				}
				
				if(password.value != rePassword.value)
				{
				    alert(' 비밀번호와 비밀번호 확인이 같지 않습니다. ');
				    return false;
				}

				if( name.value == '' || name.value == null )
				{
				    alert( '이름을 입력해주세요' );
				    return false;
				}
				
				if( namePattern.test(name.value) != true)
				{
				    alert('이름은 한글만 입력 해주세요 ');
				    return false;
				}

				if( name.value.replace( blank_pattern, '' ) == "" )
				{
				    alert(' 이름에 공백만 입력되었습니다 ');
				    return false;
				}
	
				if(checkSpace(name.value))
				{
				    alert(' 이름에 공백은 사용할 수 없습니다. ');
				    return false;
				}
				
				if( nick.value == '' || nick.value == null )
				{
				    alert( '닉네임을 입력해주세요' );
				    return false;
				}
				
				if( nick.value.replace( blank_pattern, '' ) == "" )
				{
				    alert(' 닉네임에 공백만 입력되었습니다 ');
				    return false;
				}
				
				if(checkSpace(nick.value))
				{
				    alert(' 닉네임에 공백은 사용할 수 없습니다. ');
				    return false;
				}
				
				if( phonePattern.test(phone.value) == true)
				{
				    alert(' 휴대폰 번호에 -를 확인해주세요 ');
				    return false;
				}
				
				if( emailPattern.test(email.value) != true)
				{
				    alert(' 이메일 형식을 확인해주세요 ');
				    return false;
				}
				
				if( birth.value == '' || birth.value == null )
				{
				    alert( '생일을 입력해주세요' );
				    return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container-fluid" style="max-width:500px; margin:auto;">
			<form action="/register" method="post">
				<div align="center"><img style="max-width:100%;" src="/resources/images/banner/banner.png" /></div>
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" placeholder="6~20자리 영어 숫자로 이루어져야 합니다." />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="password">비밀번호</label>
					<input class="form-control" type="password" id="password" name="password" placeholder="특수문자 / 문자  / 숫자 포함 형태의 8~15자리" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="rePassword">비밀번호 확인</label>
					<input class="form-control" type="password" id="rePassword" name="rePassword" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="name">이름</label>
					<input class="form-control" type="text" id="name" name="name" placeholder="한글만 입력해주세요."/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="nick">닉네임</label>
					<input class="form-control" type="text" id="nick" name="nick" placeholder="닉네임에는 공백이 들어갈 수 없습니다."/>
					
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="phone">핸드폰</label>
					<input class="form-control" type="text" id="phone" name="phone" placeholder="입력 시 -없이 입력 해주세요"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" placeholder="example@exam.com / example@exam.co.kr" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="birth">생일</label>
					<input class="form-control" type="date" id="birth" name="birth" />
				</div>
				
				<div class="form-group has-feedback" align="right">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
</html>
	</body>
		
		