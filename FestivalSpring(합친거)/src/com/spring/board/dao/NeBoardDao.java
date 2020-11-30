package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.NeBoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.NeBoardForm;

@Repository
public class NeBoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.neBoardMapper";

	/** 게시판 - 목록 수 */
	public int getBoardCnt(NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", NeBoardForm);
	}

	/** 게시판 - 목록 조회 */
	public List<NeBoardDto> getBoardList(NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardList", NeBoardForm);
	}

	/** 게시판 - 조회 수 수정 */
	public int updateBoardHits(NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoardHits", NeBoardForm);
	}

	/** 게시판 - 상세 조회 */
	public NeBoardDto getBoardDetail(NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", NeBoardForm);
	}
	
	/** 게시판 - 첨부파일 조회 */
	public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
	}

	/** 게시판 - 그룹 번호 조회 
	public int getFbGroupNum (NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getFb_group_num", NeBoardForm);
	}
	*/
	/** 게시판 - 등록 */
	public int insertBoard(NeBoardForm NeBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoard", NeBoardForm);
	}
	
	/** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}

	/** 게시판 - 등록 실패(트랜잭션 테스트) */
	public int insertBoardFail(NeBoardForm NeBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", NeBoardForm);
	}

	/** 게시판 - 삭제 */
	public int deleteBoard(NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.delete(NAMESPACE + ".deleteBoard", NeBoardForm);
	}

	/** 게시판 - 수정 */
	public int updateBoard(NeBoardForm NeBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoard", NeBoardForm);
	}
	
	/** 게시판 - 첨부파일 삭제 */
	public int deleteBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".deleteBoardFile", boardFileForm);
	}
	
}
