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
 
    <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/banner.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<script type="text/javascript">
</script>

<body>
    <div id="wrap">
        <header>
            <h1 id="logo_area"><a><img id="logo" src="resources/images/main/header_logo2.png" alt="logo"></a></h1>
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

            <div class="menubar">
                <ul>
                    <li><a href="#" id="current">고객센터</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">초록축제 문의</a></li>
                        </ul>
                    </li>
                    <li><a href="suppage_community.html">커뮤니티</a>
                        <ul>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">축제리뷰게시판</a></li>
                            <li><a href="#">관리자게시판</a></li>
                            <li><a href="#">축제 문의</a></li>
                        </ul>
                    </li>
                    <li><a href="#">소개</a></li>
                </ul>
            </div>
        </header>

        <div class="section">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">

            <div class="slidewrap">

                <ul class="slidelist">
                    <!-- 슬라이드 영역 -->
                    <li class="slideitem">
                        <a>
                            <div class="textbox">
                                <!-- <h3>코로나 19</h3>
                                    <p>우리모두 힘내요<br>외출시 반드시 마스크를 착용해요.</p>-->
                            </div>
                            <img src="/resources/images/main/banner1_2.jpg">
                        </a>
                    </li>
                    <li class="slideitem">
                        <a>

                            <div class="textbox">
                                <!--<h3>문을 여시오!</h3>
                                    <p>한국 전통의 문화를 찾아서<br/>2020.11.30~2020.12.22</p>-->
                            </div>
                            <img src="/resources/images/main/banner2_1.jpg">
                        </a>
                    </li>
                    <li class="slideitem">
                        <a>

                            <div class="textbox">
                                <!--<h3>배너 3</h3>
                                    <p>두번째 슬라이드 입니다.</p>-->
                            </div>
                            <img src="/resources/images/main/banner3_1.jpg">
                        </a>
                    </li class="slideitem">

                    <!-- 좌,우 슬라이드 버튼 -->
                    <div class="slide-control">
                        <div>
                            <label for="slide03" class="left"></label>
                            <label for="slide02" class="right"></label>
                        </div>
                        <div>
                            <label for="slide01" class="left"></label>
                            <label for="slide03" class="right"></label>
                        </div>
                        <div>
                            <label for="slide02" class="left"></label>
                            <label for="slide01" class="right"></label>
                        </div>
                    </div>

                </ul>
                <!-- 페이징 -->
                <ul class="slide-pagelist">
                    <li><label for="slide01"></label></li>
                    <li><label for="slide02"></label></li>
                    <li><label for="slide03"></label></li>
                </ul>
            </div>
        </div>

        <div class="container">

            <div class="main_left">
                <div class="main_notice">
                    <div>
                        <h2>공지사항</h2>
                    </div>
                    <div>
                        <h6><a href="#">더보기 ></a></h6>
                    </div>
                    <hr>
                    <ul>
                        <li><img src="resources/images/main/ddd.jpg"><a href="#">개인정보처리방침 변경</a><span>2020.10.19</span></li>
                        <li><img src="resources/images/main/ddd.jpg"><a href="#">개인정보처리방침 변경</a><span>2020.10.19</span></li>
                        <li><img src="resources/images/main/ddd.jpg"><a href="#">개인정보처리방침 변경</a><span>2020.10.19</span></li>
                        <li><img src="resources/images/main/ddd.jpg"><a href="#">개인정보처리방침 변경</a><span>2020.10.19</span></li>
                    </ul>
                </div>

            </div>
            <div class="main_right">
                <div class="main_ad">
                    <img src="resources/images/main/ad.png">
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer_logo">
                <img src="resources/images/main/logo.png" alt="logo" />
            </div>
            <div class="aside_area">
                <h4><a href="#" target="_self" style="color: #686868;">사이트소개</a>|<a href="#" target="_self"
                        style="color: #686868;">이용약관</a>|<a href="#" target="_self">개인정보처리방침</a>|<a href="#"
                        target="_self " style="color: #686868;">Q&A</a></h4>
                <div>
                    <span style="font-weight:bold;">축제미화팀</span><span style="color: #686868;"> 최혁진, 김경민, 김동현, 안상록, 이수현 <span
                            style="font-weight:bold; color: black;">축제정보</span> TourAPI<br />
                        인천광역시 동구 재능로 178(송림동 122번지) 인천재능대학교<br />
                        TEL 032-890-7000 | FAX 032-890-7065<br />
                        COPYRIGHT 2020 FESTIVAL BEAUTIFICATION. ALL RIGHTS RESERVED.</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>