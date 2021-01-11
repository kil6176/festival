package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.FbBoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.FbBoardForm;

@Repository
public class FbBoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.fbBoardMapper";

	/** 게시판 - 목록 수 */
	public int getBoardCnt(FbBoardForm fbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", fbBoardForm);
	}

	/** 게시판 - 목록 조회 */
	public List<FbBoardDto> getBoardList(FbBoardForm fbBoardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardList", fbBoardForm);
	}

	/** 게시판 - 조회 수 수정 */
	public int updateBoardHits(FbBoardForm fbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoardHits", fbBoardForm);
	}

	/** 게시판 - 상세 조회 */
	public FbBoardDto getBoardDetail(FbBoardForm fbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", fbBoardForm);
	}
	
	/** 게시판 - 첨부파일 조회 */
	public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
	}

	/** 게시판 - 그룹 번호 조회 
	public int getFbGroupNum (BoardForm fbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getFb_group_num", fbBoardForm);
	}
	*/
	/** 게시판 - 등록 */
	public int insertBoard(FbBoardForm fbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoard", fbBoardForm);
	}
	
	/** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}

	/** 게시판 - 등록 실패(트랜잭션 테스트) */
	public int insertBoardFail(FbBoardForm fbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", fbBoardForm);
	}

	/** 게시판 - 삭제 */
	public int deleteBoard(FbBoardForm fbBoardForm) throws Exception {

		return sqlSession.delete(NAMESPACE + ".deleteBoard", fbBoardForm);
	}

	/** 게시판 - 수정 */
	public int updateBoard(FbBoardForm fbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoard", fbBoardForm);
	}
	
	/** 게시판 - 첨부파일 삭제 */
	public int deleteBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".deleteBoardFile", boardFileForm);
	}
	
}
