<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>
<%	
	String board_num = request.getParameter("board_num");		
%>

<c:set var="board_num" value="<%=board_num%>"/> <!-- 게시글 번호 -->

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="../resources/js/common/jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardDetail();		
	});
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/fcvb_board/boardList.do";
	}
	
	/** 게시판 - 수정 페이지 이동 */
	function goBoardUpdate(){
		
		var board_num = $("#board_num").val();
		
		location.href = "/fcvb_board/boardUpdate.do?board_num="+ board_num;
	}
	/** 게시판 - 답글 페이지 이동 */
	function goBoardReply(){
		
		var board_num = $("#board_num").val();
		
		location.href = "/fcvb_board/boardReply.do?board_num="+ board_num;
	}
	/** 게시판 - 첨부파일 다운로드 */
	function fileDownload(bf_name_key, bf_name, bf_path){
			
		location.href = "/fcvb_board/fileDownload.do?bf_name_key="+bf_name_key+"&bf_name="+bf_name+"&bf_path="+bf_path;
	}
	
	/** 게시판 - 상세 조회  */
	function getBoardDetail(board_num){
		
		var board_num = $("#board_num").val();

		if(board_num != ""){
			
			$.ajax({	
				
			    url		: "/fcvb_board/getBoardDetail.do",
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
		
		var str = "";
		
		if(obj != null){								
							
			var board_num		= obj.board_num; 
			var fcvb_group_num 	= obj.fcvb_group_num;
			var fcvb_answer_deep 		= obj.fcvb_answer_deep; 
			var fcvb_answer_order 		= obj.fcvb_answer_order;
			var m_nickname 		= obj.m_nickname; 
			var fcvb_title 		= obj.fcvb_title; 
			var fcvb_content	 	= obj.fcvb_content; 
			var fcvb_hits 		= obj.fcvb_hits;
			var fcvb_delete_yn 	= obj.fcvb_delete_yn; 
			var m_id 			= obj.m_id;
			var fcvb_insert_date 	= obj.fcvb_insert_date; 
			var fcvb_update_date 	= obj.fcvb_update_date;
			var files			= obj.files;		
			var filesLen		= files.length;
						
			str += "<tr>";
			str += "<th>제목</th>";
			str += "<td>"+ fcvb_title +"</td>";
			str += "<th>조회수</th>";
			str += "<td>"+ fcvb_hits +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>작성자</th>";
			str += "<td>"+ m_nickname +"</td>";
			str += "<th>작성일시</th>";
			str += "<td>"+ fcvb_insert_date +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>내용</th>";
			str += "<td colspan='3'>"+ fcvb_content +"</td>";
			str += "</tr>";
			
			if(filesLen > 0){
			
				for(var a=0; a<filesLen; a++){
					
					var board_num	= files[a].board_num;
					var bf_num 		= files[a].bf_num;
					var bf_name_key = files[a].bf_name_key;
					var bf_name 	= files[a].bf_name;
					var bf_path 	= files[a].bf_path;
					var bf_size 	= files[a].bf_size;
					var bf_delete_yn	= files[a].bf_delete_yn;
					var m_id 			= files[a].m_id;
					var bf_insert_date 	= files[a].bf_insert_date;
					var bf_update_date 	= files[a].bf_update_date;
					
					str += "<th>첨부파일</th>";
					//str += "<td onclick='javascript:fileDownload(\"" + fileNameKey + "\", \"" + fileName + "\", \"" + filePath + "\");' style='cursor:Pointer'>"+ fileName +"</td>";
					str += "<td colspan='3'><a href='/fcvb_board/fileDownload.do?bf_name_key="+encodeURI(bf_name_key)+"&bf_name="+encodeURI(bf_name)+"&bf_path="+encodeURI(bf_path)+"'>" + bf_name + "</a></td>";
					str += "</tr>";
				}	
			}			
			
		} else {
			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
		
		$("#tbody").html(str);
	}
	
	/** 게시판 - 삭제  */
	function deleteBoard(){

		var board_num = $("#board_num").val();
		
		var yn = confirm("게시글을 삭제하시겠습니까?");		
		if(yn){
			
			$.ajax({	
				
			    url		: "/fcvb_board/deleteBoard.do",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	deleteBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		}		
	}
	
	/** 게시판 - 삭제 콜백 함수 */
	function deleteBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 삭제를 성공하였습니다.");				
				goBoardList();				
			} else {				
				alert("게시글 삭제를 실패하였습니다.");	
				return;
			}
		}
	}
	
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">	
			<h2>게시글 상세</h2>
			<form id="boardForm" name="boardForm">		
				<table width="100%" class="table01">
				    <colgroup>
				        <col width="15%">
				        <col width="35%">
				        <col width="15%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
				       
				    </tbody>
				</table>		
				<input type="hidden" id="board_num"		name="board_num"	value="${board_num}"/> <!-- 게시글 번호 -->
				<input type="hidden" id="search_type"	name="search_type" 	value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black mr5" onclick="javascript:goBoardUpdate();">수정하기</button>
				<button type="button" class="btn black" onclick="javascript:deleteBoard();">삭제하기</button>
				<button type="button" class="btn black mr5" onclick="javascript:goBoardReply();">답글쓰기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>