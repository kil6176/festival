<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/resources/js/common/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common/jquery.form.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		
	});
		
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/fcvb_board/boardList.do";
	}
	
	/** 게시판 - 작성  */
	function insertBoard(){

		var fcvb_title = $("#fcvb_title").val();
		var fcvb_content = $("#fcvb_content").val();
			
		if (fcvb_title == ""){			
			alert("제목을 입력해주세요.");
			$("#fcvb_title").focus();
			return;
		}
		
		if (fcvb_content == ""){			
			alert("내용을 입력해주세요.");
			$("#fcvb_content").focus();
			return;
		}
			
		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
				
			var filesChk = $("input[name='files[0]']").val();
			if(filesChk == ""){
				$("input[name='files[0]']").remove();
			}
			
			$("#boardForm").ajaxForm({
		    
				url		: "/fcvb_board/insertBoard.do",
				enctype	: "multipart/form-data",
				cache   : false,
		        async   : true,
				type	: "POST",					 	
				success : function(obj) {
			    	insertBoardCallback(obj);				
			    },	       
			    error 	: function(xhr, status, error) {}
			    
		    }).submit();			 
		}
	}
	
	/** 게시판 - 작성 콜백 함수 */
	function insertBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
				return;
			}
		}
	}
	
</script>
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
            <div id="logo_area"><a href="/"><img id="logo" src="/resources/images/main/header_logo2.png" alt="logo"></a></div>


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
                <p>커뮤니티</p>
            </div>
            <img src="/resources/images/main/sub_banner.png">
        </div>
        <div class="sub_commmunity">
            <div class="sub_title_area">
                 <div class="list_title"><h2>|초록축제 문의게시판</h2><p><a href="main.html">HOME</a>><a href="suppage_community.html">고객센터</a>><a href="suppage_community.html">초록축제 문의게시판</a></p></div>  
            </div>
            <div class="notice_area">
                <div class="notice_box">
                
                
	<div id="container">
		<div class="inner">		
			<h2>게시글 작성</h2>
			<form id="boardForm" name="boardForm" action="fcvb_board/insertBoard" enctype="multipart/form-data" method="post" onsubmit="return false;">
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="fcvb_title" name="fcvb_title" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>작성자<span class="t_red">*</span></th>
							<td><input id="m_nickname" name="m_nickname" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="fcvb_content" name="fcvb_content" cols="10" rows="5" class="textarea01"></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td><input type="file" id="files[0]" name="files[0]" value=""></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:insertBoard();">등록하기</button>
			</div>
		</div>
			</div>
			
			
			
		</div>
		</div>
            </div>
            
            <div class="footer">
        <div class="footer_logo">
            <img src="/resources/images/main/logo2.png" alt="logo"/>
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