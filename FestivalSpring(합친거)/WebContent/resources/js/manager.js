$(document).ready(function()
		{
			var pwPattern = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
			var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var phonePattern = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
			var namePattern = /^[가-힣]{2,4}$/;
			var blank_pattern = /^\s+|\s+$/g;
			
			/*--------회원정보 시작----------*/
			var user_info = 1;
			var user_management = 2;
			var can_management = 3;
			var login_log = 4;
			$("#view_user_pw_btn").click(function()
			{
				
				$("#user_pw_change").removeClass("displayNone");
				$("#user_info_change").addClass("displayNone");
				$("#user_info_view").addClass("displayNone");
				$(".m_pw").val("");
				$(".newPassword").val("");
				$(".rePassword").val("");
				$(".passwordCheckText").text("");
				$(".passwordCheck").val("N");
				
			});
			
			$("#view_user_info_btn").click(function()
			{
				$("#user_info_change").removeClass("displayNone");
				$("#user_pw_change").addClass("displayNone");
				$("#user_info_view").addClass("displayNone");
				$(".m_pw").val("");
				$(".passwordCheckText").text("");
				$(".passwordCheck").val("N");
			});
			
			$("#user_info").click(function()
			{
				$("#user_info_view").removeClass("displayNone");
				$("#user_pw_change").addClass("displayNone");
				$("#user_info_change").addClass("displayNone");
				menuLink_click(user_info);
			});
			
			$("#user_management").click(function()
			{
				menuLink_click(user_management);
			});
			
			$("#can_management").click(function()
			{
				menuLink_click(can_management);
			});
			
			$("#login_log").click(function()
			{
				menuLink_click(login_log);
			});
			
			
			$("#user_management_festival_list_back_btn").click(function()
			{
				$("#user_management_festival_list").addClass("displayNone");
				$("#user_management_view").removeClass("displayNone");
			});
			
			function menuLink_click(idx)
			{
				switch (idx)
				{
					case user_info:
						$("#user_info").addClass("menuLink_hover");
						$("#user_management").removeClass("menuLink_hover");
						$("#can_management").removeClass("menuLink_hover");
						$("#login_log").removeClass("menuLink_hover");
						$("#user_info_wrap").removeClass("displayNone");
						$("#user_management_wrap").addClass("displayNone");
						$("#can_management_wrap").addClass("displayNone");
						$("#login_log_wrap").addClass("displayNone");
						$("#can_management_festival_can_add").addClass("displayNone");
						$("#can_management_festival_can_change").addClass("displayNone");
						$("#user_management_festival_list").addClass("displayNone");
						break;
						
					case user_management:
						$("#user_management").addClass("menuLink_hover");
						$("#user_info").removeClass("menuLink_hover");
						$("#can_management").removeClass("menuLink_hover");
						$("#login_log").removeClass("menuLink_hover");
						$("#user_management_wrap").removeClass("displayNone");
						$("#user_info_wrap").addClass("displayNone");
						$("#can_management_wrap").addClass("displayNone");
						$("#login_log_wrap").addClass("displayNone");
						$("#can_management_festival_can_add").addClass("displayNone");
						$("#can_management_festival_can_change").addClass("displayNone");
						$("#user_management_festival_list").addClass("displayNone");
						$("#user_management_view").removeClass("displayNone");
						break;
						
					case can_management:
						$("#can_management").addClass("menuLink_hover");
						$("#user_management").removeClass("menuLink_hover");
						$("#user_info").removeClass("menuLink_hover");
						$("#login_log").removeClass("menuLink_hover");
						$("#can_management_wrap").removeClass("displayNone");
						$("#user_management_wrap").addClass("displayNone");
						$("#user_info_wrap").addClass("displayNone");
						$("#login_log_wrap").addClass("displayNone");
						$("#can_management_festival_list").removeClass("displayNone");
						$("#can_management_festival_can_addChange").addClass("displayNone");
						$("#can_management_festival_can_list").addClass("displayNone");
						$("#can_management_festival_can_add").addClass("displayNone");
						$("#can_management_festival_can_change").addClass("displayNone");
						$("#user_management_festival_list").addClass("displayNone");		
						
						break;
						
					case login_log:
						$("#login_log").addClass("menuLink_hover");
						$("#user_management").removeClass("menuLink_hover");
						$("#can_management").removeClass("menuLink_hover");
						$("#user_info").removeClass("menuLink_hover");
						$("#login_log_wrap").removeClass("displayNone");
						$("#user_management_wrap").addClass("displayNone");
						$("#can_management_wrap").addClass("displayNone");
						$("#user_info_wrap").addClass("displayNone");
						$("#can_management_festival_can_add").addClass("displayNone");
						$("#can_management_festival_can_change").addClass("displayNone");
						$("#user_management_festival_list").addClass("displayNone");
						break;
				}
			}
			/*--------회원정보 끝---------*/
			
			/*--------쓰레기통 관리 시작----------*/
			$(".festival_name").click(function()
			{
				$("#can_management_festival_can_list").removeClass("displayNone");
				$("#can_management_festival_list").addClass("displayNone");
				$("#can_management_festival_can_add").addClass("displayNone");
				$("#can_management_festival_can_change").addClass("displayNone");
			});
			
			$(".t_id").click(function()
			{
				$("#can_management_festival_can_addChange").removeClass("displayNone");
				$("#can_management_festival_list").addClass("displayNone");
				$("#can_management_festival_can_list").addClass("displayNone");
			});
			
			$("#can_management_festival_can_list_back_btn").click(function()
			{
				$("#can_management_festival_list").removeClass("displayNone");
				$("#can_management_festival_can_list").addClass("displayNone");
			});
			

			
			$("#can_management_festival_can_add_btn").click(function()
			{
				
				$("#can_management_festival_can_list").addClass("displayNone");
				$("#can_management_festival_can_add").removeClass("displayNone");
				
			});
			
			$("#can_management_festival_can_add_back_btn").click(function()
			{
				$("#can_management_festival_can_list").removeClass("displayNone");
				$("#can_management_festival_list").addClass("displayNone");
				$("#can_management_festival_can_add").addClass("displayNone");
			});
			
			
			$("#can_management_festival_can_change_back_btn").click(function()
			{
				$("#can_management_festival_can_list").removeClass("displayNone");
				$("#can_management_festival_list").addClass("displayNone");
				$("#can_management_festival_can_change").addClass("displayNone");
			});
			/*--------쓰레기통 관리 끝----------*/
			
			/*--------회원정보 시작----------*/
			//곻백체크
			function checkSpace(str)
			{
				if (str.search(/\s/) != -1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			/*--------회원정보 패스워드 체크 시작----------*/
			$(".m_pw").keyup(function()
			{
				$.ajax(
				{
					url: "/passwordCheck.do",
					type: "post",
					dataType: "json",
					data:
					{
						"m_pw": $(this).val(),
						"m_id":  $("#sessionId").val()
					},
					success: function(data)
					{
						if (data == 1)
						{
							$(".passwordCheck").attr("value", "Y");
							$(".passwordCheckText").text("패스워드가 맞습니다");
							$(".passwordCheckText").css("color", "green");
							$(".passwordCheckText").css("margin-bottom", "8px");
						}
						else if (data == 0)
						{
							$(".passwordCheck").attr("value", "N");
							$(".passwordCheckText").text("패스워드가 다릅니다.");
							$(".passwordCheckText").css("color", "red");
							$(".passwordCheckText").css("margin-bottom", "8px");
						}
					}
				});
			});
			//비밀번호 동일한지 체크
			$("#rePassword, #newPassword").keyup(function()
			{
				var password = $("#newPassword").val();
				var rePassword = $("#rePassword").val();
				if (pwPattern.test(password) == true)
				{
					if (password == rePassword)
					{
						$("#rePasswordCheck").attr("value", "Y");
						$("#rePasswordCheckText").text("비밀번호와 같습니다.");
						$("#rePasswordCheckText").css("color", "green");
						$("#rePasswordCheckText").css("margin-bottom", "8px");
					}
					else
					{
						$("#rePasswordCheck").attr("value", "N");
						$("#rePasswordCheckText").text("비밀번호와 같지않습니다.");
						$("#rePasswordCheckText").css("color", "red");
						$("#rePasswordCheckText").css("margin-bottom", "8px");
					}
				}
				else
				{
					$("#rePasswordCheck").attr("value", "N");
					$("#rePasswordCheckText").text("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이여야 합니다.");
					$("#rePasswordCheckText").css("color", "red");
					$("#rePasswordCheckText").css("margin-bottom", "8px");
				}
			});
			/*--------회원정보 패스워드 체크 끝----------*/
			/*--------닉네임 중복체크 시작----------*/
			$("#m_nickname").keyup(function()
			{
				var sessionNick = '${member.m_nickname}';
				console.log(sessionNick);
				var m_nickname = $("#m_nickname").val();
				console.log(m_nickname);
				if (sessionNick != m_nickname)
				{
					$("#nickDupleCheck").attr("value", "N");
					$.ajax(
					{
						url: "/nickDupleCheck.do",
						type: "post",
						dataType: "json",
						data:
						{
							"m_nickname": $("#m_nickname").val()
						},
						success: function(data)
						{
							if (data == 1)
							{
								$("#nickCheckText").text("사용중인 닉네임입니다 다른 닉네임을 입력해주세요");
								$("#nickCheckText").css("color", "red");
								$("#nickCheckText").css("margin-bottom", "8px");
							}
							else if (data == 0)
							{
								if ($("#m_nickname").val() != "")
								{
									if (!checkSpace($("#m_nickname").val()))
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
				}
				else $("#nickCheckText").text("");
			});
			/*--------닉네임 중복체크 끝----------*/
			/*--------비밀번호 바꾸기 동일체크 시작----------*/
			//비밀번호 동일한지 체크
			$("#rePassword, #m_pw").keyup(function()
			{
				var password = $("#m_pw").val();
				var rePassword = $("#rePassword").val();
				if (pwPattern.test(password) == true)
				{
					if (password == rePassword)
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
			/*--------비밀번호 바꾸기 동일체크 끝----------*/
			/*--------회원 정보 바꾸기 검사 시작----------*/
			$("#user_info_change_btn").click(function()
			{
				/*
				$.ajax({
					url : "/infoChange",
					async:false,
					type : "post",
					dataType : "json",
					data : {"m_nickname" : $("#m_nickname").val(),
						"m_name" : $("#m_name").val(),
						"m_phoneNum" : $("#m_phoneNum").val(),
						"m_address" : $("#m_address").val(),
						"m_email" : $("#m_email").val(),
						"m_birth" : $("#m_birth").val(),
						"m_id" : '${member.m_id}'
					},
					success : function(result){
					}
				});
				 */
				var userEmail = document.getElementById("m_email");
				var phone = document.getElementById("m_phoneNum");
				var name = document.getElementById("m_name");
				var birth = document.getElementById("m_birth");
				var nick = document.getElementById("m_nickname");
				
				if ($(".passwordCheck").val() == "N")
				{
					alert("현재 비밀번호가 다릅니다");
					return false;
				}
				else if (name.value == '' || name.value == null)
				{
					alert('이름을 입력해주세요');
					return false;
				}
				else if (namePattern.test(name.value) != true)
				{
					alert('이름은 한글만 입력 해주세요 ');
					return false;
				}
				else if (name.value.replace(blank_pattern, '') == "")
				{
					alert(' 이름에 공백만 입력되었습니다 ');
					return false;
				}
				else if (checkSpace(name.value))
				{
					alert(' 이름에 공백은 사용할 수 없습니다. ');
					return false;
				}
				else if (nick.value == '' || nick.value == null)
				{
					alert('닉네임을 입력해주세요');
					return false;
				}
				else if (nick.value.replace(blank_pattern, '') == "")
				{
					alert(' 닉네임에 공백만 입력되었습니다 ');
					return false;
				}
				else if (checkSpace(nick.value))
				{
					alert(' 닉네임에 공백은 사용할 수 없습니다. ');
					return false;
				}
				else if ($("#nickDupleCheck").val() == "N")
				{
					alert('닉네임 중복을 확인해주세요');
					return false;
				}
				else if (phonePattern.test(phone.value) != true)
				{
					alert(' 휴대폰 번호를 확인해주세요 ');
					return false;
				}
				else if (phone.value == '' || phone.value == null)
				{
					alert(' 휴대폰 번호를 입력해주세요 ');
					return false;
				}
				else if (emailPattern.test(userEmail.value) != true)
				{
					alert(' 이메일 형식을 확인해주세요 ');
					return false;
				}
				else if (userEmail.value == '' || userEmail.value == null)
				{
					alert(' 이메일을 입력해주세요 ');
					return false;
				}
				else if (birth.value == '' || birth.value == null)
				{
					alert('생일을 입력해주세요');
					return false;
				}
				if (confirm("회원 정보를 수정하시겠습니까?") == false)
				{
					return false;
				}
			});
			/*--------회원 정보 바꾸기 검사 끝----------*/
			/*--------패스워드 바꾸기 검사 끝----------*/
			$("#user_pw_change_btn").click(function()
			{
				if ($(".passwordCheck").val() == "N")
				{
					alert("현재 비밀번호가 다릅니다");
					return false;
				}
				if ($("#rePasswordCheck").val() == "N")
				{
					alert("변경 비밀번호와 비밀번호 확인을 확인 해주세요.");
					return false;
				}
				if (confirm("비밀번호를 변경하시겠습니까?") == false)
				{
					return false;
				}
			});
			
				getUserList();
				getFestivalList();
				
				$("#userSearchKeyword").keyup(function()
				{
					getUserList();
				});
		}); 
		
function authorityChange(userID)
{
	var m_id = userID.getAttribute('id');
	var authority = userID.value;

	console.log(m_id);
	console.log(authority);

	$.ajax(
	{
		url: "/authorityChange.do",
		data: 
		{
			"m_id": m_id,
		    "m_authority": authority
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			if(data == 1)
				alert("권한 변경하였습니다.");
			else
				alert("권한 변경을 하지 못하였습니다.");
		}
	});
	
	
}

function getUserList(currentPageNo)
{
	if (currentPageNo === undefined)
	{
		currentPageNo = "1";
	}
	
	$("#current_page_no").val(currentPageNo);
	
	$.ajax(
	{
		url: "/getUserList.do",
		data: $("#userForm").serialize(),
		dataType: "JSON",
		cache: false,
		async: true,
		type: "POST",
		success: function(obj)
		{
			getUserListCallback(obj);
		},
		error: function(xhr, status, error) {}
	});
}

/** 유저 목록 조회  콜백 함수 */
function getUserListCallback(obj)
{
	var state = obj.state;
	if (state == "SUCCESS")
	{
		var data = obj.data;
		var list = data.list;
		var listLen = list.length;
		var totalCount = data.totalCount;
		var pagination = data.pagination;
		var str = "";
		if (listLen > 0)
		{
			for (var a = 0; a < listLen; a++)
			{
				var m_id = list[a].m_id;
				var m_name = list[a].m_name;
				var m_phonenum = list[a].m_phonenum;
				var m_address = list[a].m_address;
				var m_authority = list[a].m_authority;
				var m_nickname = list[a].m_nickname;
				var m_email = list[a].m_email;
				var m_joindate = list[a].m_joindate;
				var m_birth = list[a].m_birth;
				var normalUser = "1";
				var festivalManager = "2";
				var siteManager = "3";
				
				
				console.log(m_authority);
				str += "<tr>";
				str += "<td><a href='"+"javaScript:userDetail(\""+m_id+"\")'>" + m_id + "</a></td>";
				str += "<td>" + m_name + "</td>";
				str += "<td>" + m_nickname + "</td>";
				str += "<td>";
				str += "<select id="+m_id+" style=' margin-bottom:2px; '>";
				
				if(m_authority == normalUser)
				{
					str += "<option value='1' selected>일반 사용자</option>";
					str += "<option value='2'>축제 관리자</option>";
					str += "<option value='3'>운영자</option>";
				}

				if(m_authority == festivalManager)
				{
					str += "<option value='1' >일반 사용자</option>";
					str += "<option value='2' selected>축제 관리자</option>";
					str += "<option value='3'>운영자</option>";
				}

				if(m_authority == siteManager)
				{
					str += "<option value='1' >일반 사용자</option>";
					str += "<option value='2'>축제 관리자</option>";
					str += "<option value='3' selected>운영자</option>";
				}
				
				str += "</select>";
				str += "<span onclick='authorityChange("+m_id+")' class='autorityChange' style='border:1px solid black; height: 30px; width:43px; background-color: white;'>변경</span>";
				str += "</td>";
				str += "</tr>";
			}
		}
		else
		{
			str += "<td colspan='4'>등록된 유저가 존재하지 않습니다.</td>";
		}
		$("#user_list").html(str);
		//$("#total_count").text(totalCount);
		$("#paging").html(pagination);
	}
	else
	{
		alert("관리자에게 문의하세요.");
		return;
	}
}


function getFestivalList(t_CurrentPageNo)
{
	if (t_CurrentPageNo === undefined)
	{
		t_CurrentPageNo = "1";
	}
	
	$("#t_current_page_no").val(t_CurrentPageNo);
	
	$.ajax(
	{
		url: "/getFestivalList.do",
		data: $("#festivalForm").serialize(),
		dataType: "JSON",
		cache: false,
		async: true,
		type: "POST",
		success: function(obj)
		{
			getFestivalListCallback(obj);
		},
		error: function(xhr, status, error) {}
	});
}

/** 유저 목록 조회  콜백 함수 */
function getFestivalListCallback(obj)
{
	var state = obj.state;
	if (state == "SUCCESS")
	{
		var data = obj.data;
		var list = data.list;
		var listLen = list.length;
		var totalCount = data.totalCount;
		var pagination = data.pagination;
		var str = "";
		if (listLen > 0)
		{
			for (var a = 0; a < listLen; a++)
			{
				(function(a){
					var m_id = list[a].m_id;
					var x = list[a].x;
					var y = list[a].y;
					var fc_num = list[a].fc_num;
					var fc_name = list[a].fc_name;
					var t_id = list[a].t_id;
					var t_can_height = list[a].t_can_height;
					var t_height = list[a].t_height;
					var trashCanCount = 0;
					var normalUser = "1";
					var festivalManager = "2";
					var siteManager = "3";
					
				    $.ajax({
				        type: "POST",
				        async: false,
				        data: {"fc_num": fc_num},
				        dataType: 'json',
				        url: "/getTrashCanCnt.do",
				        success: function (data) {
				        	trashCanCount = data;
				        }
				    });
	
				    $.ajax({
				        type: "GET",
				        async: false,
				        dataType: 'xml',
						crossOrigin: true,
						proxy: "https://www.festvalcl.tk//proxy.php",
				        url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"
				             + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
				             + "&contentTypeId=15"
				             + "&contentId=" + fc_num
				             + "&MobileOS=ETC"
				             + "&MobileApp=TourAPI3.0_Guide"
				             + "&defaultYN=Y"
				             + "&firstImageYN=Y"
				             + "&listYN=Y"
				             + "&catcodeYN=Y"
				             + "&addrinfoYN=Y"
				             + "&mapinfoYN=Y"
				             + "&overviewYN=Y"
				             + "&transGuideYN=Y",
				        success: function (data) {
				            $(data).find('item').each(function () {
				                fc_name = $('title', this).text();
	
								str += "<tr>";
								//str += "<td><a class='festivalDetail' href='"+"javaScript:festivalDetail(" + fc_num + ","+"1,"+ fc_name + ")'>" + fc_name + "</a></td>";
								str += `<td><a class='festivalDetail' href='javaScript:festivalDetail(`+ fc_num + `, 1, "` + fc_name + `")'>`+fc_name+`</a></td>`;
								str += "<td><a href='"+"javaScript:festivalDetail("+fc_num+")'>" + fc_num + "</a></td>";
								str += "<td>" + trashCanCount + "</td>";
								str += "</tr>";
					
								$("#festival_list").html(str);
								//$("#total_count").text(totalCount);
								$("#festival_list_paging").html(pagination);
				            });
				        }
				    });
			    })(a);
			}
		}
		else
		{
			str += "<td colspan='4'>등록된 축제가 존재하지 않습니다.</td>";
		}
	}
	else
	{
		alert("관리자에게 문의하세요.");
		return;
	}
}


function festivalDetail(fc_num, currentPageNo, fc_name)
{					

		$("#can_management_festival_can_list").removeClass("displayNone");
		$("#can_management_festival_list").addClass("displayNone");
		$("#can_management_festival_can_addChange").addClass("displayNone");
		$(".add_fc_name").val(fc_name);
		console.log(fc_name);
		if (currentPageNo === undefined)
		{
			currentPageNo = "1";
		}
		
		if (fc_name === undefined)
		{
			fc_name = "";
		}
		console.log("currentPageNo"+currentPageNo);
		$("#can_current_page_no").val(currentPageNo);
		
		$.ajax(
		{
			url: "/getTrashCanList.do",
			data: {"fc_num" : fc_num,
				  "current_page_no" : currentPageNo,
				  "function_name" : $("#can_function_name").val()
				  },
					
			dataType: "JSON",
			cache: false,
			async: true,
			type: "POST",
			success: function(obj)
			{
				getCanListCallback(obj);
			}
		});

	/** 유저 목록 조회  콜백 함수 */
	function getCanListCallback(obj)
	{
		var state = obj.state;
		if (state == "SUCCESS")
		{
			var data = obj.data;
			var list = data.list;
			var listLen = list.length;
			var totalCount = data.totalCount;
			var pagination = data.pagination;
			var str = "";
			if (listLen > 0)
			{
				for (var a = 0; a < listLen; a++)
				{
					var t_id = list[a].t_id;
					var x = list[a].x;
					var y = list[a].y;
					var fc_num = list[a].fc_num;
					var fc_name = list[a].fc_name;
					var t_can_height = list[a].t_can_height;
					var trash_persent = list[a].trash_persent;
					
					str += "<tr>";
					str += "<td><a href='"+"javaScript:trashCanDetail("+fc_num+","+t_id+")'>" + t_id + "</a></td>";
					str += "<td>" + fc_num + "</td>";
					str += "<td>" + x + "</td>";
					str += "<td>" + y + "</td>";
					str += "<td>" + t_can_height + "</td>";
					str += "<td>" + trash_persent + "</td>";
					str += "</tr>";
					
					$(".add_fc_num").val(fc_num);
					$(".add_x").val(x);
					$(".add_y").val(y);
					
				}
			}
			else
			{
				str += "<td colspan='6'>등록된 쓰레기통이 존재하지 않습니다.</td>";
			}
			$("#can_list").html(str);
			//$("#total_count").text(totalCount);
			$("#can_list_paging").html(pagination);
			
		}
		else
		{
			alert("관리자에게 문의하세요.");
			return;
		}
	}

}

function trashCanDetail(fc_num, t_id)
{
	$("#can_management_festival_can_list").addClass("displayNone");
	$("#can_management_festival_can_add").addClass("displayNone");
	$("#can_management_festival_can_change").removeClass("displayNone");
	
	$.ajax(
	{
		url: "/selectOneTrashCan.do",
		data: 
		{
			"fc_num": fc_num,
		    "t_id": t_id
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			var t_id = data[0].t_id;
			var x = data[0].x;
			var y = data[0].y;
			var fc_num = data[0].fc_num;
			var fc_name = data[0].fc_name;
			var t_can_height = data[0].t_can_height;
			var trash_persent = data[0].trash_persent;
			
			$(".change_x").val(x);
			$(".change_y").val(y);
			$(".change_fc_num").val(fc_num);
			$(".change_can_height").val(t_can_height);
			$(".change_t_id").val(t_id);
		}
	});
	
}


function searchLocation(type)
{
	if(type=="add")
	{
		var x = $(".add_x").val();
		var y = $(".add_y").val();
	}
	else
		var x = $(".change_x").val();
		var y = $(".change_y").val();
	var openWin;
	// window.name = "부모창 이름"; 
    window.name = "trashCanAdd";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/searchLocation.do?x="+x+"&y="+y+"&type="+type,
            "searchLocation", "width=600, height=600, resizable = no, scrollbars = no");    
}

	
function insertTrashCan()
{
	var x = $(".add_x").val();
	var y = $(".add_y").val();
	var fc_name = $(".add_fc_name").val();
	var fc_num = $(".add_fc_num").val();
	var t_can_height = $(".add_can_height").val();
				
	$.ajax(
	{
		url: "/insertTrashCan.do",
		data: 
		{
			"x": x,
		    "y": y,
		    "t_can_height": t_can_height,
		    "fc_num": fc_num,
		    "fc_name": fc_name
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			if(data == 1)
				alert("쓰레기통을 추가 하였습니다");
			else
				alert("오류가 발생하여 쓰레기통을 추가 하지 못하였습니다.");
		}
	});
}

function updateTrashCan()
{
	var x = $(".change_x").val();
	var y = $(".change_y").val();
	var t_can_height = $(".change_can_height").val();
	var t_id = $(".change_t_id").val();
	if(confirm("쓰레기통을 수정 하시겠습니까?")==false)
	{
		return false;
	}
	
	$.ajax(
	{
		url: "/updateTrashCan.do",
		data: 
		{
			"x": x,
		    "y": y,
		    "t_can_height": t_can_height,
		    "t_id": t_id
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			if(data == 1)
			{
				alert("쓰레기통 정보를 수정하였습니다");
				$("#can_management_festival_can_change").addClass('displayNone');
				$("#can_management_festival_can_list").removeClass('displayNone');
			}
			else
				alert("오류가 발생하여 쓰레기통을 수정 하지 못하였습니다.");
		}
	});
}

function deleteTrashCan()
{
	var x = $(".change_x").val();
	var y = $(".change_y").val();
	var t_can_height = $(".change_can_height").val();
	var t_id = $(".change_t_id").val();
						
	if(confirm("정말로 쓰레기통을 삭제 하시겠습니까?")==false)
	{
		return false;
	}
	$.ajax(
	{

		url: "/deleteTrashCan.do",
		data: 
		{
		    "t_id": t_id
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			if(data == 1)
			{
				alert("쓰레기통을 삭제하였습니다");
				$("#can_management_festival_can_change").addClass('displayNone');
				$("#can_management_festival_can_list").removeClass('displayNone');
			}
			else
				alert("오류가 발생하여 쓰레기통을 삭제 하지 못하였습니다.");
		}
	});
}






function userDetail(m_id, t_CurrentPageNo)
{
	
	$("#user_management_festival_list").removeClass("displayNone");
	$("#user_management_view").addClass("displayNone");
	$(".festival_addDelete_t_id").val(m_id);
	
	if (t_CurrentPageNo === undefined)
	{
		t_CurrentPageNo = "1";
	}
	console.log(m_id);
	
	$("#user_festival_list_current_page_no").val(t_CurrentPageNo);
	
	$.ajax(
	{
		url: "/getUserFestivalList.do",
		data: {
			"m_id" : m_id,
			"current_page_no" : t_CurrentPageNo,
			"function_name" : $("#user_festival_list_function_name").val()
		},
		dataType: "JSON",
		cache: false,
		async: true,
		type: "POST",
		success: function(obj)
		{
			getUserFestivalListCallback(obj);
		},
		error: function(xhr, status, error) {}
	});
}

/** 유저 목록 조회  콜백 함수 */
function getUserFestivalListCallback(obj)
{
	
	$("#user_festival_list_body").html("");
	//$("#total_count").text(totalCount);
	$("#user_festival_list_paging").html("");
	var state = obj.state;
	if (state == "SUCCESS")
	{
		var data = obj.data;
		var list = data.list;
		var listLen = list.length;
		var totalCount = data.totalCount;
		var pagination = data.pagination;
		var str = "";
		if (listLen > 0)
		{
			for (var a = 0; a < listLen; a++)
			{
				(function(a){
					var m_id = list[a].m_id;
					var fc_log = list[a].fc_log;
					var y = list[a].y;
					var fc_num = list[a].fc_num;
					var fc_name = list[a].fc_name;
					var t_id = list[a].t_id;
					var t_can_height = list[a].t_can_height;
					var t_height = list[a].t_height;
					var trashCanCount = 0;
					var normalUser = "1";
					var festivalManager = "2";
					var siteManager = "3";
					
				    $.ajax({
				        type: "POST",
				        async: false,
				        data: {"fc_num": fc_num},
				        dataType: 'json',
				        url: "/getTrashCanCnt.do",
				        success: function (data) {
				        	trashCanCount = data;
				        }
				    });
	
				    $.ajax({
				        type: "GET",
				        async: false,
				        dataType: 'xml',
						crossOrigin: true,
						proxy: "https://www.festvalcl.tk//proxy.php",
				        url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"
				             + "ServiceKey=j6LXjPijNQRYMD91nULBdKVcG4dB1UwKCSKNzdNF43iSdduDRIYm8t3RaktEga5bhfvKQ5yJj6o7EWMqGVF2NQ%3D%3D"
				             + "&contentTypeId=15"
				             + "&contentId=" + fc_num
				             + "&MobileOS=ETC"
				             + "&MobileApp=TourAPI3.0_Guide"
				             + "&defaultYN=Y"
				             + "&firstImageYN=Y"
				             + "&listYN=Y"
				             + "&catcodeYN=Y"
				             + "&addrinfoYN=Y"
				             + "&mapinfoYN=Y"
				             + "&overviewYN=Y"
				             + "&transGuideYN=Y",
				        success: function (data) {
				            $(data).find('item').each(function () {
				                fc_name = $('title', this).text();
	
								str += "<tr>";
								str += "<td>" + fc_log + "</td>";
								str += "<td>" + fc_name + "</td>";
								str += "<td>" + fc_num + "</td>";
								str += `<td><button type='button' onclick='deleteUserFestival(`+fc_log+`)'>삭제</button></td>`;
								str += "</tr>";
					
								$("#user_festival_list_body").html(str);
								//$("#total_count").text(totalCount);
								$("#user_festival_list_paging").html(pagination);
				            });
				        }
				    });
			    })(a);
			}
		}
		else
		{
			str += "<td colspan='4'>등록된 축제가 존재하지 않습니다.</td>";
		}
	}
	else
	{
		alert("관리자에게 문의하세요.");
		return;
	}
}

function addUserFestival()
{
	var fc_num = prompt("추가하실 번호를 입력해주세요");
	var m_id = $(".festival_addDelete_t_id").val();
	if(fc_num == null)
		return false;
					
	$.ajax(
	{
		url: "/addUserFestival.do",
		data: 
		{
			"m_id" : m_id,
			"fc_num" : fc_num
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			if(data == 1)
				alert("축제 정보를 추가 하였습니다");
			else
				alert("오류가 발생하여 축제 정보를 추가 하지 못하였습니다.");
		}
	});
}


function deleteUserFestival(fc_log)
{
	
	if (confirm("축제 정보를 추가 하시겠습니까?") == false)
	{
		return false;
	}
	
	$.ajax(
	{
		url: "/deleteUserFestival.do",
		data: 
		{
			"fc_log" : fc_log
		},
		dataType: "JSON",
		async: false,
		type: "POST",
		success: function(data)
		{
			if(data == 1)
				alert("축제 정보를 삭제 하였습니다");
			else
				alert("오류가 발생하여 축제 정보를 삭제 하지 못하였습니다.");
		}
	});
}