<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원가입</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			//정규식
			var idPattern = /^[a-z0-9]{6,20}$/;
			var pwPattern = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
		    var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		    var phonePattern = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		    var namePattern = /^[가-힣]{2,4}$/;
			var blank_pattern = /^\s+|\s+$/g;
			
			// 아이디 중복체크
			$("#m_id").keyup(function()
			{
				$("#idDupleCheck").attr("value", "N");
				$.ajax({
					url : "/idDupleCheck",
					type : "post",
					dataType : "json",
					data : {"m_id" : $("#m_id").val()},
					success : function(data){
						if(data == 1){
							$("#idCheckText").text("사용중인 아이디입니다 다른 아이디를 입력해주세요");
							$("#idCheckText").css("color", "red");
							$("#idCheckText").css("margin-bottom", "8px");
						}else if(data == 0){
							if($("#m_id").val() != "")
							{
								if(!checkSpace($("#m_id").val()))
								{
									if(!idPattern.test($("#m_id").val()))
									{
										$("#idCheckText").text("아이디는 6~20자리의 영어, 숫자만 들어갈 수 있습니다.");
										$("#idCheckText").css("color", "red");
										$("#idCheckText").css("margin-bottom", "8px");
									}
									
									else
									{
										$("#idDupleCheck").attr("value", "Y");
										$("#idCheckText").text("사용가능한 아이디 입니다");
										$("#idCheckText").css("color", "green");
										$("#idCheckText").css("margin-bottom", "8px");
									}
								}
								else
								{
									$("#idCheckText").text("아이디에는 공백이 들어갈 수 없습니다.");
									$("#idCheckText").css("color", "red");
									$("#idCheckText").css("margin-bottom", "8px");
								}
							}
							else
							{
								$("#idCheckText").text("아이디를 입력해주세요.");
								$("#idCheckText").css("color", "red");
								$("#idCheckText").css("margin-bottom", "8px");
							}
						}
					}
				});
			});
			
			//닉네임 중복체크
			$("#m_nick").keyup(function()
			{
				$("#nickDupleCheck").attr("value", "N");
				$.ajax
				({
					url : "/nickDupleCheck",
					type : "post",
					dataType : "json",
					data : {"m_nick" : $("#m_nick").val()},
					success : function(data)
					{
						if(data == 1){
							$("#nickCheckText").text("사용중인 닉네임입니다 다른 닉네임를 입력해주세요");
							$("#nickCheckText").css("color", "red");
							$("#nickCheckText").css("margin-bottom", "8px");
						}
						else if(data == 0)
						{
							if($("#m_nick").val() != "")
							{
								if(!checkSpace($("#m_nick").val()))
								{
										$("#nickDupleCheck").attr("value", "Y");
										$("#nickCheckText").text("사용가능한 닉네임 입니다");
										$("#nickCheckText").css("color", "green");
										$("#nickCheckText").css("margin-bottom", "8px");
								}
								else
								{
									$("#nickCheckText").text("닉네임에는 공백이 들어갈 수 없습니다.");
									$("#nickCheckText").css("color", "red");
									$("#nickCheckText").css("margin-bottom", "8px");
								}
							}
							else
							{
								$("#nickCheckText").text("닉네임을 입력해주세요.");
								$("#nickCheckText").css("color", "red");
								$("#nickCheckText").css("margin-bottom", "8px");
							}
						}
					}
				});
			});

			//비밀번호 동일한지 체크
			$("#rePassword, #m_pw").keyup(function()
			{
			    var password = $("#m_pw").val();
			    var rePassword =$("#rePassword").val();
				if( pwPattern.test(password) == true)
				{
				    if(password == rePassword)
						{
								$("#passwordCheckText").text("비밀번호와 같습니다.");
								$("#passwordCheckText").css("color", "green");
								$("#passwordCheckText").css("margin-bottom", "8px");
						}
					else
						{
							$("#passwordCheckText").text("비밀번호와 같지않습니다.");
							$("#passwordCheckText").css("color", "red");
							$("#passwordCheckText").css("margin-bottom", "8px");
						}
				}
				else
				{
					$("#passwordCheckText").text("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이여야 합니다.");
					$("#passwordCheckText").css("color", "red");
					$("#passwordCheckText").css("margin-bottom", "8px");
				}
			});
			
			$(".cencle").on("click", function(){
				location.href = "/";
			});

			//곻백체크
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

		    //회원가입 
			$("#submit").on("click", function(){
			    
			    var id = document.getElementById("m_id");
			    var password = document.getElementById("m_pw");
			    var rePassword = document.getElementById("rePassword");
			    var userEmail = document.getElementById("m_email");
			    var phone = document.getElementById("m_phoneNum");
			    var name = document.getElementById("m_name");
			    var birth = document.getElementById("m_birth");

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
				
				if($("#idDupleCheck").val()=="N")
				{
				    alert('아이디 중복을 확인해주세요');
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

				if($("#nickDupleCheck").val()=="N")
				{
				    alert('닉네임 중복을 확인해주세요');
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
				if(confirm("가입을 하시겠습니까?")==false)
				{
					return false;
				}
				else
					alert("가입에 성공 하셨습니다.");
			});
		});
	</script>
<body>
	<section id="container" style="max-width: 500px; margin: auto;">
		<form action="/register" method="post">
			<div align="center">
				<img style="max-width: 100%;" src="/resources/images/banner/banner.png" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_id">아이디</label> 
				<input class="form-control" type="text" id="m_id" name="m_id" placeholder="6~20자리 영어 숫자로 이루어져야 합니다." /> 
				<input type="hidden" id="idDupleCheck" name="idDupleCheck" value="N" />
			</div>
			<div id="idCheckText"></div>

			<div class="form-group has-feedback">
				<label class="control-label" for="m_pw">비밀번호</label> <input
					class="form-control" type="password" id="m_pw" name="m_pw"
					placeholder="특수문자 / 문자  / 숫자 포함 형태의 8~15자리" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="rePassword">비밀번호 확인</label> <input
					class="form-control" type="password" id="rePassword"
					name="rePassword" />
			</div>
			<div id="passwordCheckText"></div>
			
			<div class="form-group has-feedback">
				<label class="control-label" for="m_name">이름</label> <input
					class="form-control" type="text" id="m_name" name="m_name"
					placeholder="한글만 입력해주세요." />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="m_nick">닉네임</label> <input
					class="form-control" type="text" id="m_nick" name="m_nick"
					placeholder="닉네임에는 공백이 들어갈 수 없습니다." /> <input type="hidden"
					id="nickDupleCheck" name="nickDupleCheck" value="N" />
			</div>
			<div id="nickCheckText"></div>

			<div class="form-group has-feedback">
				<label class="control-label" for="m_phoneNum">핸드폰</label> <input
					class="form-control" type="text" id="m_phoneNum" name="m_phoneNum"
					placeholder="입력 시 -없이 입력 해주세요" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="m_email">이메일</label> <input
					class="form-control" type="text" id="m_email" name="m_email"
					placeholder="example@exam.com / example@exam.co.kr" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="m_birth">생일</label> <input
					class="form-control" type="date" id="m_birth" name="m_birth" />
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

