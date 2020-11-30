package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.FcbBoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.FcbBoardForm;

@Repository
public class FcbBoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.fcbBoardMapper";

	/** 게시판 - 목록 수 */
	public int getBoardCnt(FcbBoardForm fcbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", fcbBoardForm);
	}

	/** 게시판 - 목록 조회 */
	public List<FcbBoardDto> getBoardList(FcbBoardForm fcbBoardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardList", fcbBoardForm);
	}

	/** 게시판 - 조회 수 수정 */
	public int updateBoardHits(FcbBoardForm fcbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoardHits", fcbBoardForm);
	}

	/** 게시판 - 상세 조회 */
	public FcbBoardDto getBoardDetail(FcbBoardForm fcbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", fcbBoardForm);
	}
	
	/** 게시판 - 첨부파일 조회 */
	public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
	}

	/** 게시판 - 그룹 번호 조회 
	public int getFbGroupNum (BoardForm fcbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getFb_group_num", fcbBoardForm);
	}
	*/
	/** 게시판 - 등록 */
	public int insertBoard(FcbBoardForm fcbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoard", fcbBoardForm);
	}
	
	/** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}

	/** 게시판 - 등록 실패(트랜잭션 테스트) */
	public int insertBoardFail(FcbBoardForm fcbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", fcbBoardForm);
	}

	/** 게시판 - 삭제 */
	public int deleteBoard(FcbBoardForm fcbBoardForm) throws Exception {

		return sqlSession.delete(NAMESPACE + ".deleteBoard", fcbBoardForm);
	}

	/** 게시판 - 수정 */
	public int updateBoard(FcbBoardForm fcbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoard", fcbBoardForm);
	}
	
	/** 게시판 - 첨부파일 삭제 */
	public int deleteBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".deleteBoardFile", boardFileForm);
	}
	
}
