<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="../resources/js/common/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
		getBoardList();
	});		
	
	/** 게시판 - 상세 페이지 이동 */
	function goBoardDetail(board_num){				
		location.href = "/ne_board/boardDetail.do?board_num="+ board_num;
	}
	
	/** 게시판 - 작성 페이지 이동 */
	function goBoardWrite(){		
		location.href = "/ne_board/boardWrite.do";
	}

	/** 게시판 - 목록 조회  */
	function getBoardList(currentPageNo){
				
		if(currentPageNo === undefined){
			currentPageNo = "1";
		}
		
		$("#current_page_no").val(currentPageNo);
		
		$.ajax({	
		
		    url		:"/ne_board/getBoardList.do",
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
					var n_group_num 	= list[a].n_group_num;
					var m_nickname 		= list[a].m_nickname; 
					var n_title 		= list[a].n_title; 
					var n_content 		= list[a].n_content; 
					var n_hits 		= list[a].n_hits;
					var n_delete_yn 	= list[a].n_delete_yn; 
					var m_id 			= list[a].m_id;
					var n_insert_date 	= list[a].n_insert_date; 
					var n_update_date 	= list[a].n_update_date;
					
					str += "<tr>";
					str += "<td>"+ board_num +"</td>";
										
					str += "<td onclick='javascript:goBoardDetail("+ board_num +");' style='cursor:Pointer'>";
					
					
					
					str += n_title +"</td>";
										
					str += "<td>"+ n_hits +"</td>";
					str += "<td>"+ m_nickname +"</td>";	
					str += "<td>"+ n_insert_date +"</td>";	
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
	<div id="container">
		<div class="inner">		
			<h2>게시글 목록</h2>			
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
</body>
</html>