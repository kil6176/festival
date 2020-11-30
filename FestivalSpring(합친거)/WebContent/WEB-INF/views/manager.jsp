<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.sql.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2020-11-24</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="resources/js/jquery.ajax-cross-origin.min.js"></script>
<script src="resources/js/manager.js"></script>
<style>
body {
	height: 100%;
	margin: auto;
	max-width: 900px;
	background: white;
	min-width: 400px;
}

div {
	
}

section {
	width: 100%;
}

select {
	height: 30px;
}

.header {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
}

#topMenu {
	width: 100%;
}

#topMenu ul li {
	display: inline-block;
	list-style: none;
	color: white;
	background-color: #6eff7556;
	width: 100%;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
	margin: 0px;
	border: 1px solid gray;
}

ul.flexbox {
	display: -webkit-box;
	/* OLD - iOS 6-, Safari 3.1-6 */
	display: -moz-box;
	/* OLD - Firefox 19- (buggy but mostly works) */
	display: -ms-flexbox;
	/* TWEENER - IE 10 */
	display: -webkit-flex;
	/* NEW - Chrome */
	display: flex;
	/* NEW, Spec - Opera 12.1, Firefox 20+ */
	padding: 0px;
}

#topMenu .menuLink {
	text-decoration: none;
	color: rgb(0, 0, 0);
	display: block;
	width: 100%;
	font-size: 1.0em;
	font-weight: bold;
	font-family: "Trebuchet MS";
}

#topMenu .menuLink_hover {
	background-color: #6eff75;
}

#user_info_wrap th {
	background-color: #6eff7556;
	border: 1px solid #e4e4e4;
	height: 60px;
	width: 30%;
}

#user_info_wrap td {
	background-color: white;
	border: 1px solid #e4e4e4;
	height: 60px;
	width: 70%;
}

#user_info_wrap td input {
	width: 300px;
	height: 30px;
}

#user_management_wrap th {
	background-color: #6eff7556;
	border: 1px solid #e4e4e4;
	height: 60px;
	width: 30%;
}

#user_management_wrap td {
	background-color: white;
	border: 1px solid #e4e4e4;
	height: 60px;
	width: 30%;
}

#user_management_wrap td input {
	width: 70%;
	height: 30px;
}

#can_management_wrap th {
	background-color: #6eff7556;
	border: 1px solid #e4e4e4;
	height: 60px;
	width: 283px;
}

#can_management_wrap td {
	background-color: white;
	border: 1px solid #e4e4e4;
	height: 60px;
	width: 283px;
	word-break:break-all;
}

#can_management_wrap input {
	width: 300px;
	height: 30px;
}

#can_management_festival_can_add td input {
	width: 100px;
	height: 30px;
}

#can_management_festival_can_change td input {
	width: 100px;
	height: 30px;
}

.displayNone {
	display: none;
}
</style>
<script>


</script>
</head>
<body>
	<header>
		<nav id="topMenu">
		<a href="/">
			<div align="center">
				<img src="/resources/images/main/header_logo.png" width="40%">
			</div>
		</a>
			<div>
				<c:choose>
					<c:when test="${member.m_authority == 3}">
						<ul class="flexbox">
							<li id="user_info" class="menuLink menuLink_hover">회원 정보</li>
							<li id="user_management" class="menuLink">회원 관리</li>
							<li id="can_management" class="menuLink">축제/쓰레기통 관리</li>
							<!-- <li  id="login_log" class="menuLink">로그인 로그</li>-->
						</ul>
					</c:when>
					
					<c:when test="${member.m_authority == 2}">
						<ul class="flexbox">
							<li id="user_info" class="menuLink menuLink_hover">회원 정보</li>
							<li id="can_management" class="menuLink">축제/쓰레기통 관리</li>
							<!-- <li  id="login_log" class="menuLink">로그인 로그</li>-->
						</ul>
					</c:when>
					
					<c:when test="${member.m_authority == 1}">
						<ul class="flexbox">
							<li id="user_info" class="menuLink menuLink_hover">회원 정보</li>
							<!-- <li  id="login_log" class="menuLink">로그인 로그</li>-->
						</ul>
					</c:when>
				</c:choose>
			</div>
		</nav>
	</header>
	<section>
		<div style="height: 100%;">
			<div id="user_info_wrap">
				<div class="header" style="padding-left: 20px;">
					<h2 style="display: inline-block">회원정보</h2>
					<span style="float: right; margin-top: 10px; margin-right: 10px;">
						<button id="view_user_info_btn" style="height: 50px">개인정보 변경</button>
						<button id="view_user_pw_btn" style="height: 50px">비밀번호 변경</button>
					</span>
				</div>

				<div id="user_info_view" style="padding: 20px; height: calc(540px - 74px);">
					<table style="text-align: center; width: 100%;" cellspacing="0" cellpadding="0">
						<tr>
							<th>이름</th>
							<td>${member.m_name}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${member.m_phoneNum}</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${member.m_nickname}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${member.m_email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${member.m_address}</td>
						</tr>
						<tr>
							<th>생일</th>
							<td>${member.m_birth}</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${member.m_joindate}</td>
						</tr>
					</table>
				</div>
				<form action="/infoChange.do" method="post">
					<div id="user_info_change" class="displayNone" style=" padding: 20px; height: calc(540px - 74px);">
						<table style="text-align: center; width: 100%;" cellspacing="0" cellpadding="0">
							<input type="hidden" class="form-control" id="m_id" name="m_id" value="${member.m_id}">
							<tr>
								<th>이름</th>
								<td>
									<input type="text" class="form-control" id="m_name" name="m_name" value="${member.m_name}">
								</td>
							</tr>

							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" class="form-control" id="m_phoneNum" name="m_phoneNum" value="${member.m_phoneNum}">
								</td>
							</tr>

							<tr>
								<th>닉네임</th>
								<td>
									<input class="form-control" type="text" id="m_nickname" name="m_nickname" value="${member.m_nickname}" placeholder="닉네임에는 공백이 들어갈 수 없습니다." />
									<input type="hidden" id="nickDupleCheck" name="nickDupleCheck" value="Y" />

									<div id="nickCheckText"></div>
								</td>
							</tr>

							<tr>
								<th>이메일</th>
								<td>
									<input type="text" class="form-control" id="m_email" name="m_email" value="${member.m_email}" placeholder="">
								</td>
							</tr>

							<tr>
								<th>주소</th>
								<td>
									<input type="text" class="form-control" id="m_address" name="m_address" value="${member.m_address}" placeholder="">
								</td>
							</tr>

							<tr>
								<th>생일</th>
								<td>
									<input type="date" class="form-control" id="m_birth" name="m_birth" value="${member.m_birth}" placeholder="">
								</td>
							</tr>

							<tr>
								<th>현재 비밀번호</th>
								<td>
									<input type="password" class="m_pw" name="m_pw" value="" placeholder="현재 비밀번호가 맞지 않으면 변경이 불가합니다.">
									<div class="passwordCheckText"></div>
								</td>
								<input type="hidden" class="passwordCheck" name="passwordCheck" value="N" />

							</tr>

							<tr>
								<td colspan="2">
									<button id="user_info_change_btn" type="submit" style="width: 100%; height: 100%;">확인</button>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<form action="/passwordChange.do" method="post">
					<input type="hidden" class="form-control" name="m_id" value="${member.m_id}">
					<div id="user_pw_change" class="displayNone" style=" padding: 20px; height: calc(540px - 74px);">

						<table style="text-align: center; width: 100%;" cellspacing="0" cellpadding="0">
							<tr>
								<th>현재 비밀번호</th>
								<td>
									<input class="m_pw" name="m_pw" type="password" value="" placeholder="현재 비밀번호가 맞지 않으면 변경이 불가합니다.">
									<div class="passwordCheckText"></div>
								</td>
								<input type="hidden" class="passwordCheck" name="passwordCheck" value="N" />
							</tr>
							<tr>
								<th>변경 할 비밀번호</th>
								<td>
									<input id="newPassword" name="newPassword" type="password" value="" placeholder="비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이여야 합니다.">
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td>
									<input id="rePassword" type="password" value="" placeholder="">
									<div id="rePasswordCheckText"></div>
								</td>
								<input type="hidden" value="N" id="rePasswordCheck">

							</tr>

							<tr>
								<td colspan="2">
									<button id="user_pw_change_btn" type="submit" style="width: 100%; height: 100%;">확인</button>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
			<div id="user_management_wrap" class="displayNone">
				<div class="header" style="padding-left: 20px;">
					<h2 style="display: inline-block">회원관리</h2>
					<span style="float: right; margin-top: 10px; margin-right: 10px;"> <!--
                                <button id="view_user_pw_btn" style="height:50px">개인정보 변경</button>
                                <button id="view_user_info_btn" style="height:50px">비밀번호 변경</button>
                                -->
					</span>
				</div>
				<form id="userForm" name="userForm">
				<input type="hidden" id="function_name" name="function_name" value="getUserList"/>
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
					<div id="user_management_view" style="padding: 20px; height: calc(540px - 74px);">
						<table style="text-align: center; width: 100%;" cellspacing="0" cellpadding="0">
							<tr>
								<td colspan="4">
									<input type="text" id="userSearchKeyword" name="searchKeyword" placeholder="검색하고 싶은 아이디를 입력하세요">
								</td>
							</tr>
							
							<tr id="user_management_view_header">
								<th>아이디</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>권한</th>
							</tr>
							
							<tbody id="user_list">
							
							</tbody>	
							<tr>
								<td id="paging" colspan="4"></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
			<form id="festivalForm" name="festivalForm">
				<input type="hidden" id="function_name" name="function_name" value="getFestivalList"/>
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				<input type="hidden" class="form-control" id="sessionId" name="m_id" value="${member.m_id}">
				<input type="hidden" class="form-control" name="m_authority" value="${member.m_authority}">
				<div id="can_management_wrap" class="displayNone">
					<div class="header" style="padding-left: 20px;">
						<h2 style="display: inline-block">축제/쓰레기통 관리</h2>
						<span style="float: right; margin-top: 10px; margin-right: 10px;"> <!--
	                                <button id="view_user_pw_btn" style="height:50px">개인정보 변경</button>
	                                <button id="view_user_info_btn" style="height:50px">비밀번호 변경</button>
	                                -->
						</span>
					</div>
						<div id="can_management_festival_list" style="padding: 20px;">
							<table style="text-align: center;" cellspacing="0" cellpadding="0">
								<tr id="can_management_festival_view_header">
									<th>축제명</th>
									<th>축제코드</th>
									<th>쓰레기통 갯수</th>
								</tr>
								<tbody id="festival_list">
								
								</tbody>	
								<tr>
									<td id="festival_list_paging" colspan="3"></td>
								</tr>
							</table>
						</div>
			</form>
					<form id="canViewForm" name="canViewForm">
						<input type="hidden" id="can_function_name" name="function_name" value="festivalDetail"/>
						<input type="hidden" id="can_current_page_no" name="can_current_page_no" value="1" />
						<input type="hidden" class="form-control" name="m_id" value="${member.m_id}">
						<input type="hidden" class="form-control" name="m_authority" value="${member.m_authority}">
						<input type="hidden" class="form-control" id="view_fc_num" value="">
						<div id="can_management_festival_can_list" style=" padding: 20px;">
							<table style="text-align: center;" cellspacing="0" cellpadding="0">
								<tr id="can_management_festival_can_view_header">
									<th>번호</th>
									<th>축제코드</th>
									<th>좌표 X</th>
									<th>좌표 Y</th>
									<th>쓰레기통 높이<br>(cm)
									</th>
									<th>차있는 양<br>(퍼센트)
									</th>
								</tr>
								<tbody id="can_list">
								</tbody>	
								
									<tr>
										<td id="can_list_paging" colspan="6"></td>
									</tr>
								<tr>
									<td colspan="6">
										<button id="can_management_festival_can_add_btn" type="button">쓰레기통 추가</button>
										<button type="button" id="can_management_festival_can_list_back_btn">돌아가기</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
					<form id="canAddForm" name="canAddForm">
						<input  class="add_fc_name" type="hidden">
						<div id="can_management_festival_can_add" class="displayNone" style="padding: 20px;">
							<table style="text-align: center; " cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="4"> 
									현재 좌표는 축제에서 가져온 좌표입니다. 
									<br>
									지도로 편하게 좌표를 받아 오세요!
									<a href="javascript:searchLocation('add')">Cilck!</a>
									</td>
								</tr>
								<tr id="can_management_festival_can_add_header">
									<th>축제코드</th>
									<th>좌표 X</th>
									<th>좌표 Y</th>
									<th>쓰레기통 높이<br>(cm)</th>
								</tr>
								<tr>
									<td>
										<input readonly class="add_fc_num" type="text">
									</td>
									<td>
										<input class="add_x" type="text">
									</td>
									<td>
										<input class="add_y" type="text">
									</td>
									<td>
										<input class="add_can_height" type="text" value="0">
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<button onClick="insertTrashCan()" type="button">추가</button>
										<button type="button" id="can_management_festival_can_add_back_btn">돌아가기</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
					<form>
						<div id="can_management_festival_can_change" class="displayNone" style="padding: 20px;">
							<table style="text-align: center;" cellspacing="0" cellpadding="0">
							<input class="change_t_id" type="hidden">
								<tr>
									<td colspan="4"> 
									지도로 편하게 좌표를 받아 오세요!
									<a href="javascript:searchLocation('change')">Cilck!</a>
									</td>
								</tr>
								<tr id="can_management_festival_can_change_header">
									<th>축제코드</th>
									<th>좌표 X</th>
									<th>좌표 Y</th>
									<th>쓰레기통 높이<br>(cm)</th>
								</tr>
								<tr>
									<td>
										<input readonly class="change_fc_num" type="text">
									</td>
									<td>
										<input class="change_x" type="text">
									</td>
									<td>
										<input class="change_y" type="text">
									</td>
									<td>
										<input class="change_can_height" type="text">
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<button onClick="updateTrashCan()" type="button">수정</button>
										<button onClick="deleteTrashCan()" type="button">삭제</button>
										<button type="button" id="can_management_festival_can_change_back_btn">돌아가기</button>
									</td>
								</tr>
							</table>
						</div>
				</div>
			</form>
			
			<!--
                <div id="login_log_wrap" class="displayNone">
                        <div style="padding-left: 20px;">
                                <h2 style="display:inline-block">로그인 로그</h2>
                                <span style="float: right; margin-top: 10px; margin-right: 10px;">
                                
                                <button id="view_user_pw_btn" style="height:50px">개인정보 변경</button>
                                <button id="view_user_info_btn" style="height:50px">비밀번호 변경</button>
                                
                                </span>
                        </div>
                </div>
                -->
		</div>
		
	</section>
	<footer> </footer>
</body>
</html>