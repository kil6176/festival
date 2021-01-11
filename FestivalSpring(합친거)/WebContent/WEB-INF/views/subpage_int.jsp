<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/sub.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

    <div id="wrap">
	<header>	
            <div class="service_area" align="right">
				<c:choose>
					<c:when test="${member == null}">
                        <a href="/register.do">회원 가입</a>
                        |
                        <a href="/login.do">로그인</a>
                        |
                        <a href="/trashMap.do">지도로 가기</a>
					</c:when>
				
					<c:when test="${member != null }">
							<p>${member.m_id}님 환영 합니다.</p>
              	       	    <a href="/manager.do">마이 페이지</a>
              	       	    |
                      		<a href="/trashMap.do">지도로 가기</a>
							|
							<a href="/logout.do">로그아웃</a>
					</c:when>
				</c:choose>
            </div>
			<div id="logo_area"><a href="/"><img id="logo" src="resources/images/main/header_logo2.png" alt="logo"></a></div>

			<div class="menubar">
				<ul>
                    <li><a href="#" id="current">고객센터</a>
                    	 <ul>
                            <li><a href="/ne_board/boardList.do">공지사항</a></li>
                            <li><a href="/fcvb_board/boardList.do">초록축제 문의</a></li>
                        </ul>
                    </li>
                    <li><a href="#">커뮤니티</a>
                        <ul>
                            <li><a href="/fb_board/boardList.do">자유게시판</a></li>
                            <li><a href="/rv_board/boardList.do">축제리뷰게시판</a></li>
                            <li><a href="/fcb_board/boardList.do">관리자게시판</a></li>
                            <li><a href="/mvb_board/boardList.do">축제 문의</a></li>
                        </ul>
                    </li>
                    <li><a href="/intro.do">소개</a></li>
                </ul>
			</div>	
    </header>

        <div class="sub_banner">
            <div class="textbox">
                <p>소개</p>
            </div>
            <img src="resources/images/main/sub_banner.png">
        </div>

        <div class="sub_content">
            <div class="content_area">
                <div class="contentbox">
                    <div id="text_top">
                        <p style="float:left; width:400px;">축제는 언제나 즐겁지만 끝나고 뒤를 돌아보면 우리를 즐겁게 해주고 남겨진 쓰레기들이 거리에 나뒹굴고 있습니다. 순간을 즐기고 오랫동안 남겨질 쓰레기를 줄일 수 있는 방법이 있을까요?</p>
                    </div>
                    <div style="float: right;"><img src="resources/images/main/sub_icon1.png"></div>
                </div>
                <div class="contentbox">
                    <div style="float: left;"><img src="resources/images/main/sub_int.png"></div>
                    <div id="text_bottom">
                        <p>초록축제는 IoT와 접목하여 쓰레기통의 위치와 쓰레기통 용량을 확인 할 수 있습니다. 사용자는 쓰레기통의 위치를 파악하고 축제 관계자들은 쓰레기의 용량을 확인 할 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer_logo">
                <img src="resources/images/main/logo2.png" alt="logo" />
            </div>
            <div class="aside_area">
                <div class="fff">
                    <h4>
	                    <a href="/intro.do" target="_self" style="color: #686868;">사이트소개</a>|
	                    <a href="/policy.do" target="_self" style="color: #686868;">이용약관</a>|
	                    <a href="/policy2.do" target="_self">개인정보처리방침</a>|
	                    <a href="/fcvb_board/boardList.do" target="_self " style="color: #686868;">Q&A</a>
                    </h4>
                </div>
                <div class="ddd">
            	<span style="font-weight:bold;">축제미화팀</span>
            	<span style="color: #686868;"> 
            		최혁진, 김경민, 김동현, 안상록, 이수현
            	 	<span style="font-weight:bold; color: black;">축제정보</span> 
            	 	TourAPI<br/>
            		인천광역시 동구 재능로 178(송림동 122번지) 인천재능대학교<br/>
            		TEL 032-890-7000 | FAX 032-890-7065<br/>
                	COPYRIGHT 2020 FESTIVAL BEAUTIFICATION. ALL RIGHTS RESERVED.
                </span>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
