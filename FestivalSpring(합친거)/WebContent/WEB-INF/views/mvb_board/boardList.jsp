<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/resources/js/common/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
		getBoardList();
	});		
	
	/** 게시판 - 상세 페이지 이동 */
	function goBoardDetail(board_num){				
		location.href = "/mvb_board/boardDetail.do?board_num="+ board_num;
	}
	
	/** 게시판 - 작성 페이지 이동 */
	function goBoardWrite(){		
		location.href = "/mvb_board/boardWrite.do";
	}

	/** 게시판 - 목록 조회  */
	function getBoardList(currentPageNo){
				
		if(currentPageNo === undefined){
			currentPageNo = "1";
		}
		
		$("#current_page_no").val(currentPageNo);
		
		$.ajax({	
		
		    url		:"/mvb_board/getBoardList.do",
		    data    : $("#boardForm").serialize(),
	        dataType:"JSON",
	        cache   : false,
			async   : true,
			type	:"POST",	
	        success : function(obj) {
				getBoardListCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	}
	
	/** 게시판 - 목록 조회  콜백 함수 */
	function getBoardListCallback(obj){

		var state = obj.state;
		
		if(state == "SUCCESS"){
			
			var data = obj.data;			
			var list = data.list;
			var listLen = list.length;		
			var totalCount = data.totalCount;
			var pagination = data.pagination;
				
			var str = "";
			
			if(listLen >  0){
				
				for(var a=0; a<listLen; a++){
					
					var board_num		= list[a].board_num; 
					var mvb_group_num 	= list[a].mvb_group_num;
					var mvb_answer_deep 		= list[a].mvb_answer_deep; 
					var mvb_answer_order 		= list[a].mvb_answer_order;
					var m_nickname 		= list[a].m_nickname; 
					var mvb_title 		= list[a].mvb_title; 
					var mvb_content 		= list[a].mvb_content; 
					var mvb_hits 		= list[a].mvb_hits;
					var mvb_delete_yn 	= list[a].mvb_delete_yn; 
					var m_id 			= list[a].m_id;
					var mvb_insert_date 	= list[a].mvb_insert_date; 
					var mvb_update_date 	= list[a].mvb_update_date;
					
					str += "<tr>";
					str += "<td>"+ board_num +"</td>";
										
					str += "<td onclick='javascript:goBoardDetail("+ board_num +");' style='cursor:Pointer'>";
					
					if(mvb_answer_deep > 0){
						
						for(var b=0; b<mvb_answer_deep; b++){
							
							str += "Re:";
						}
					}
					
					str += mvb_title +"</td>";
										
					str += "<td>"+ mvb_hits +"</td>";
					str += "<td>"+ m_nickname +"</td>";	
					str += "<td>"+ mvb_insert_date +"</td>";	
					str += "</tr>";
					
				} 
				
			} else {
				
				str += "<tr>";
				str += "<td colspan='5'>등록된 글이 존재하지 않습니다.</td>";
				str += "<tr>";
			}
			
			$("#tbody").html(str);
			$("#total_count").text(totalCount);
			$("#pagination").html(pagination);
			
		} else {
			alert("관리자에게 문의하세요.");
			return;
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
                <div class="list_title"><h2>|1:1문의 게시판</h2><p><a href="main.html">HOME</a>><a href="suppage_community.html">커뮤니티</a>><a href="suppage_community.html">1:1문의 게시판</a></p></div>  
            </div>
        
	<div id="container">
		<div class="inner">			
			<form id="boardForm" name="boardForm">
				<input type="hidden" id="function_name" name="function_name" value="getBoardList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				
				<div class="page_info">
					<span class="total_count"><strong>전체</strong> : <span id="total_count" class="t_red">0</span>개</span>
				</div>
			
				<table width="100%" class="table01">
					<colgroup>
						<col width="10%" />
						<col width="25%" />
						<col width="10%" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					<thead>		
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="tbody">
					
					</tbody>	
				</table>
			</form>			
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">작성하기</button>
			</div>
		</div>
		
		<div id="pagination"></div>
			
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