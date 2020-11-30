package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.RvBoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.RvBoardForm;

@Repository
public class RvBoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.rvBoardMapper";

	/** 게시판 - 목록 수 */
	public int getBoardCnt(RvBoardForm rvBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", rvBoardForm);
	}

	/** 게시판 - 목록 조회 */
	public List<RvBoardDto> getBoardList(RvBoardForm rvBoardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardList", rvBoardForm);
	}

	/** 게시판 - 조회 수 수정 */
	public int updateBoardHits(RvBoardForm rvBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoardHits", rvBoardForm);
	}

	/** 게시판 - 상세 조회 */
	public RvBoardDto getBoardDetail(RvBoardForm rvBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", rvBoardForm);
	}
	
	/** 게시판 - 첨부파일 조회 */
	public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
	}

	
	/** 게시판 - 등록 */
	public int insertBoard(RvBoardForm rvBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoard", rvBoardForm);
	}
	
	/** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}

	/** 게시판 - 등록 실패(트랜잭션 테스트) */
	public int insertBoardFail(RvBoardForm rvBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", rvBoardForm);
	}

	/** 게시판 - 삭제 */
	public int deleteBoard(RvBoardForm rvBoardForm) throws Exception {

		return sqlSession.delete(NAMESPACE + ".deleteBoard", rvBoardForm);
	}

	/** 게시판 - 수정 */
	public int updateBoard(RvBoardForm rvBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoard", rvBoardForm);
	}
	
	/** 게시판 - 첨부파일 삭제 */
	public int deleteBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".deleteBoardFile", boardFileForm);
	}
	
}
