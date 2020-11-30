package com.spring.board.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.board.common.PagingUtil;
import com.spring.board.common.ResultUtil;
import com.spring.board.dao.MvbBoardDao;
import com.spring.board.dto.MvbBoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.MvbBoardForm;
import com.spring.board.form.CommonForm;

@Service
public class MvbBoardService {

	protected final Logger logger = LoggerFactory.getLogger(MvbBoardService.class);

	@Autowired
	private MvbBoardDao mvbBoardDao;

	/** 게시판 - 목록 조회 */
	public ResultUtil getBoardList(MvbBoardForm mvbBoardForm) throws Exception {

		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = mvbBoardDao.getBoardCnt(mvbBoardForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(mvbBoardForm.getFunction_name());
			commonForm.setCurrent_page_no(mvbBoardForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		mvbBoardForm.setLimit(commonDto.getLimit());
		mvbBoardForm.setOffset(commonDto.getOffset());

		List<MvbBoardDto> list = mvbBoardDao.getBoardList(mvbBoardForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	/** 게시판 - 상세 조회 */
	public MvbBoardDto getBoardDetail(MvbBoardForm mvbBoardForm) throws Exception {

		logger.debug("==================== getBoardDetail START ====================");

		MvbBoardDto boardDto = new MvbBoardDto();

		String searchType = mvbBoardForm.getSearch_type();

		if ("S".equals(searchType)) {

			mvbBoardDao.updateBoardHits(mvbBoardForm);
		}

		boardDto = mvbBoardDao.getBoardDetail(mvbBoardForm);

		BoardFileForm boardFileForm = new BoardFileForm();
		boardFileForm.setBoard_num(mvbBoardForm.getBoard_num());

		boardDto.setFiles(mvbBoardDao.getBoardFileList(boardFileForm));

		logger.debug("==================== getBoardDetail END ====================");

		return boardDto;
	}

	/** 게시판 - 등록 */
	public MvbBoardDto insertBoard(MvbBoardForm mvbBoardForm) throws Exception {

		MvbBoardDto boardDto = new MvbBoardDto();

		int insertCnt = 0;

		//int FbGroupNum = mvbBoardDao.getFbGroupNum(mvbBoardForm);
		//boardForm.setMvb_group_num(FbGroupNum);

		insertCnt = mvbBoardDao.insertBoard(mvbBoardForm);

		List<BoardFileForm> boardFileList = getBoardFileInfo(mvbBoardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			mvbBoardDao.insertBoardFile(boardFileForm);
		}

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 첨부파일 정보 조회 */
	public List<BoardFileForm> getBoardFileInfo(MvbBoardForm mvbBoardForm) throws Exception {

		List<MultipartFile> files = mvbBoardForm.getFiles();

		List<BoardFileForm> boardFileList = new ArrayList<BoardFileForm>();

		BoardFileForm boardFileForm = new BoardFileForm();

		int boardNum = mvbBoardForm.getBoard_num();
		String BfName  = null;
		String fileExt = null;
		String BfNameKey = null;
		String BfSize = null;
		// 파일이 저장될 Path 설정 차후 톰캣 서버내로 경로 수정
		String filePath = "C:\\board\\file"; 

		if (files != null && files.size() > 0) {

			File file = new File(filePath);

			// 디렉토리가 없으면 생성
			if (file.exists() == false) {
				file.mkdirs();
			}

			for (MultipartFile multipartFile : files) {

				BfName = multipartFile.getOriginalFilename();
				fileExt = BfName.substring(BfName.lastIndexOf("."));
				// 파일명 변경(uuid로 암호화) + 확장자
				BfNameKey = getRandomString() + fileExt;
				BfSize = String.valueOf(multipartFile.getSize());

				// 설정한 Path에 파일 저장
				file = new File(filePath + "/" + BfNameKey);

				multipartFile.transferTo(file);

				boardFileForm = new BoardFileForm();
				boardFileForm.setBoard_num(boardNum);
				boardFileForm.setBf_name(BfName);
				boardFileForm.setBf_name_key(BfNameKey);
				boardFileForm.setBf_path(filePath);
				boardFileForm.setBf_size(BfSize);
				boardFileList.add(boardFileForm);
			}
		}

		return boardFileList;
	}

	/** 게시판 - 삭제 */
	public MvbBoardDto deleteBoard(MvbBoardForm mvbBoardForm) throws Exception {
		
		logger.debug("==================== deleteBoard START ====================");

		MvbBoardDto boardDto = new MvbBoardDto();

		int deleteCnt = mvbBoardDao.deleteBoard(mvbBoardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		logger.debug("==================== deleteBoard START ====================");
		
		return boardDto;
	}

	/** 게시판 - 수정 */
	public MvbBoardDto updateBoard(MvbBoardForm mvbBoardForm) throws Exception {

		logger.debug("==================== updateBoard START ====================");
		
		MvbBoardDto boardDto = new MvbBoardDto();

		int updateCnt = mvbBoardDao.updateBoard(mvbBoardForm);

		String deleteFile = mvbBoardForm.getDelete_file();
		if (!"".equals(deleteFile)) {

			String[] deleteFileInfo = deleteFile.split("!");

			int boardNum = Integer.parseInt(deleteFileInfo[0]);
			int bfNum = Integer.parseInt(deleteFileInfo[1]);

			BoardFileForm deleteBoardFileForm = new BoardFileForm();
			deleteBoardFileForm.setBoard_num(boardNum);
			deleteBoardFileForm.setBf_num(bfNum);

			mvbBoardDao.deleteBoardFile(deleteBoardFileForm);
		}

		List<BoardFileForm> boardFileList = getBoardFileInfo(mvbBoardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			mvbBoardDao.insertBoardFile(boardFileForm);
		}

		if (updateCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		logger.debug("==================== updateBoard START ====================");
		
		return boardDto;
	}
	
	/** 게시판 - 답글 등록 */
	public MvbBoardDto insertBoardReply(MvbBoardForm mvbBoardForm) throws Exception {

		MvbBoardDto boardDto = new MvbBoardDto();

		MvbBoardDto boardReplayInfo = mvbBoardDao.getBoardReplyInfo(mvbBoardForm);
		
		mvbBoardForm.setBoard_num(boardReplayInfo.getBoard_num());
		mvbBoardForm.setMvb_group_num(boardReplayInfo.getMvb_group_num());
		mvbBoardForm.setMvb_answer_deep(boardReplayInfo.getMvb_answer_deep());
		mvbBoardForm.setMvb_answer_order(boardReplayInfo.getMvb_answer_order());

		int insertCnt = 0;

		insertCnt += mvbBoardDao.updateBoardReSeq(mvbBoardForm);

		insertCnt += mvbBoardDao.insertBoardReply(mvbBoardForm);

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}



	/** 32글자의 랜덤한 문자열(숫자포함) 생성 */
	public static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
