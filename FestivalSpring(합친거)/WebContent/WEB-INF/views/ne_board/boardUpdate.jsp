<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<%	
	String board_num = request.getParameter("board_num");		
%>

<c:set var="board_num" value="<%=board_num%>"/> <!-- 게시글 번호 -->

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/resources/js/common/jquery.js"></script>
<script type="text/javascript" src="/resources/js/common/jquery.form.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardDetail();		
	});
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/ne_board/boardList.do";
	}
	
	/** 게시판 - 상세 조회  */
	function getBoardDetail(board_num){
		
		var board_num = $("#board_num").val();

		if(board_num != ""){
			
			$.ajax({	
				
			    url		: "/ne_board/getBoardDetail.do",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getBoardDetailCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
			
		} else {
			alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}	
	}
	
	/** 게시판 - 상세 조회  콜백 함수 */
	function getBoardDetailCallback(obj){
				
		if(obj != null){								
							
			var board_num		= obj.board_num; 
			var n_group_num 	= obj.n_group_num; 
			var m_nickname 		= obj.m_nickname; 
			var n_title 		= obj.n_title; 
			var n_content 		= obj.n_content; 
			var n_hits 		= obj.n_hits;
			var n_delete_yn 	= obj.n_delete_yn; 
			var m_id 			= obj.m_id;
			var n_insert_date 	= obj.n_insert_date; 
			var n_update_date 	= obj.n_update_date;
			var files			= obj.files;		
			var filesLen		= files.length;
								
			$("#n_title").val(n_title);			
			$("#n_content").val(n_content);
			$("#m_nickname").text(m_nickname);
			
			var fileStr = "";
			
			if(filesLen > 0){
				
				for(var a=0; a<filesLen; a++){
					
					var board_num		= files[a].board_num;
					var bf_num 			= files[a].bf_num;
					var bf_name_key 	= files[a].bf_name_key;
					var bf_name 		= files[a].bf_name;
					var bf_path 		= files[a].bf_path;
					var bf_size 		= files[a].bf_size;
					var bf_delete_yn 	= files[a].bf_delete_yn;
					var m_id 			= files[a].m_id;
					var bf_insert_date 	= files[a].bf_insert_date;
					var bf_update_date 	= files[a].bf_update_date;
					
					fileStr += "<a href='/ne_board/fileDownload.do?bf_name_key="+encodeURI(bf_name_key)+"&bf_name="+encodeURI(bf_name)+"&bf_path="+encodeURI(bf_path)+"'>" + bf_name + "</a>";
					fileStr += "<button type='button' class='btn black ml15' style='padding:3px 5px 6px 5px;' onclick='javascript:setDeleteFile("+ board_num +", "+ bf_num +")'>X</button>";
				}			
								
			} else {
				
				fileStr = "<input type='file' id='files[0]' name='files[0]' value=''></td>";
			}
			
			$("#file_td").html(fileStr);
			
		} else {			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
	}
	
	/** 게시판 - 수정  */
	function updateBoard(){

		var boardSubject = $("#n_title").val();
		var boardContent = $("#n_content").val();
			
		if (n_title == ""){			
			alert("제목을 입력해주세요.");
			$("#n_title").focus();
			return;
		}
		
		if (n_content == ""){			
			alert("내용을 입력해주세요.");
			$("#n_content").focus();
			return;
		}
		
		var yn = confirm("게시글을 수정하시겠습니까?");		
		if(yn){
				
			var filesChk = $("input[name='files[0]']").val();
			if(filesChk == ""){
				$("input[name='files[0]']").remove();
			}
			
			$("#boardForm").ajaxForm({
		    
				url		: "/ne_board/updateBoard.do",
				enctype	: "multipart/form-data",
				cache   : false,
		        async   : true,
				type	: "POST",					 	
				success : function(obj) {
					updateBoardCallback(obj);				
			    },	       
			    error 	: function(xhr, status, error) {}
			    
		    }).submit();
		}
	}
	
	/** 게시판 - 수정 콜백 함수 */
	function updateBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 수정을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 수정을 실패하였습니다.");	
				return;
			}
		}
	}
	
	/** 게시판 - 삭제할 첨부파일 정보 */
	function setDeleteFile(board_num, fileSeq){
		
		var deleteFile = board_num + "!" + fileSeq;		
		$("#delete_file").val(deleteFile);
				
		var fileStr = "<input type='file' id='files[0]' name='files[0]' value=''>";		
		$("#file_td").html(fileStr);		
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
                <div class="list_title"><h2>|공지사항</h2><p><a href="main.html">HOME</a>><a href="suppage_community.html">고객센터</a>><a href="suppage_community.html">공지사항</a></p></div>    
            </div>
            <div class="notice_area">
                <div class="notice_box">
                
	<div id="container">
		<div class="inner">	
			<h2>게시글 상세</h2>
			<form id="boardForm" name="boardForm" action="/ne_board/updateBoard" enctype="multipart/form-data" method="post" onsubmit="return false;">	
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				         <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
				       <tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="n_title" name="n_title" value="" class="tbox01"/></td>
						</tr>
						 <tr>
							<th>작성자</th>
							<td id="m_nickname"></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td colspan="3"><textarea id="n_content" name="n_content" cols="50" rows="5" class="textarea01"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3" id="file_td"><input type="file" id="files[0]" name="files[0]" value=""></td>
						</tr>
				    </tbody>
				</table>	
				<input type="hidden" id="board_num"		name="board_num"	value="${board_num}"/> <!-- 게시글 번호 -->
				<input type="hidden" id="search_type"	name="search_type"	value="U"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
				<input type="hidden" id="delete_file"	name="delete_file"	value=""/> <!-- 삭제할 첨부파일 -->
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:updateBoard();">수정하기</button>
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