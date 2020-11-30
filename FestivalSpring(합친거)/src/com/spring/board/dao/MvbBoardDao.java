package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.MvbBoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.MvbBoardForm;

@Repository
public class MvbBoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.mvbBoardMapper";

	/** 게시판 - 목록 수 */
	public int getBoardCnt(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", mvbBoardForm);
	}

	/** 게시판 - 목록 조회 */
	public List<MvbBoardDto> getBoardList(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardList", mvbBoardForm);
	}

	/** 게시판 - 조회 수 수정 */
	public int updateBoardHits(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoardHits", mvbBoardForm);
	}

	/** 게시판 - 상세 조회 */
	public MvbBoardDto getBoardDetail(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", mvbBoardForm);
	}
	
	/** 게시판 - 첨부파일 조회 */
	public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
	}

	/** 게시판 - 그룹 번호 조회 */
	public int getMvbGroupNum (MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getMvbGroupNum", mvbBoardForm);
	}
	
	/** 게시판 - 등록 */
	public int insertBoard(MvbBoardForm mvbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoard", mvbBoardForm);
	}
	
	/** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}

	/** 게시판 - 등록 실패(트랜잭션 테스트) */
	public int insertBoardFail(MvbBoardForm mvbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", mvbBoardForm);
	}

	/** 게시판 - 삭제 */
	public int deleteBoard(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.delete(NAMESPACE + ".deleteBoard", mvbBoardForm);
	}

	/** 게시판 - 수정 */
	public int updateBoard(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoard", mvbBoardForm);
	}
	
	/** 게시판 - 답글 정보  조회 */
	public MvbBoardDto getBoardReplyInfo(MvbBoardForm mvbBoardForm) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardReplyInfo", mvbBoardForm);
	}
	
	/** 게시판 - 답글의 순서 수정 */
	public int updateBoardReSeq(MvbBoardForm mvbBoardForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".updateBoardReSeq", mvbBoardForm);
	}
	
	/** 게시판 - 답글 등록 */
	public int insertBoardReply(MvbBoardForm mvbBoardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardReply", mvbBoardForm);
	}
	
	/** 게시판 - 첨부파일 삭제 */
	public int deleteBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".deleteBoardFile", boardFileForm);
	}


	
}
