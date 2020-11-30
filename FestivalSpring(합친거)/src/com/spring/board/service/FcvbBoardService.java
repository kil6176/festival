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
import com.spring.board.dao.FcvbBoardDao;
import com.spring.board.dto.FcvbBoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.FcvbBoardForm;
import com.spring.board.form.CommonForm;

@Service
public class FcvbBoardService {

	protected final Logger logger = LoggerFactory.getLogger(FcvbBoardService.class);

	@Autowired
	private FcvbBoardDao FcvbBoardDao;

	/** 게시판 - 목록 조회 */
	public ResultUtil getBoardList(FcvbBoardForm boardForm) throws Exception {

		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = FcvbBoardDao.getBoardCnt(boardForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(boardForm.getFunction_name());
			commonForm.setCurrent_page_no(boardForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		boardForm.setLimit(commonDto.getLimit());
		boardForm.setOffset(commonDto.getOffset());

		List<FcvbBoardDto> list = FcvbBoardDao.getBoardList(boardForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	/** 게시판 - 상세 조회 */
	public FcvbBoardDto getBoardDetail(FcvbBoardForm boardForm) throws Exception {

		logger.debug("==================== getBoardDetail START ====================");

		FcvbBoardDto boardDto = new FcvbBoardDto();

		String searchType = boardForm.getSearch_type();

		if ("S".equals(searchType)) {

			FcvbBoardDao.updateBoardHits(boardForm);
		}

		boardDto = FcvbBoardDao.getBoardDetail(boardForm);

		BoardFileForm boardFileForm = new BoardFileForm();
		boardFileForm.setBoard_num(boardForm.getBoard_num());

		boardDto.setFiles(FcvbBoardDao.getBoardFileList(boardFileForm));

		logger.debug("==================== getBoardDetail END ====================");

		return boardDto;
	}

	/** 게시판 - 등록 */
	public FcvbBoardDto insertBoard(FcvbBoardForm boardForm) throws Exception {

		FcvbBoardDto boardDto = new FcvbBoardDto();

		int insertCnt = 0;

		//int FbGroupNum = FcvbBoardDao.getFbGroupNum(boardForm);
		//boardForm.setfcvb_group_num(FbGroupNum);

		insertCnt = FcvbBoardDao.insertBoard(boardForm);

		List<BoardFileForm> boardFileList = getBoardFileInfo(boardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			FcvbBoardDao.insertBoardFile(boardFileForm);
		}

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 첨부파일 정보 조회 */
	public List<BoardFileForm> getBoardFileInfo(FcvbBoardForm boardForm) throws Exception {

		List<MultipartFile> files = boardForm.getFiles();

		List<BoardFileForm> boardFileList = new ArrayList<BoardFileForm>();

		BoardFileForm boardFileForm = new BoardFileForm();

		int boardNum = boardForm.getBoard_num();
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
	public FcvbBoardDto deleteBoard(FcvbBoardForm boardForm) throws Exception {
		
		logger.debug("==================== deleteBoard START ====================");

		FcvbBoardDto boardDto = new FcvbBoardDto();

		int deleteCnt = FcvbBoardDao.deleteBoard(boardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		logger.debug("==================== deleteBoard START ====================");
		
		return boardDto;
	}

	/** 게시판 - 수정 */
	public FcvbBoardDto updateBoard(FcvbBoardForm boardForm) throws Exception {

		logger.debug("==================== updateBoard START ====================");
		
		FcvbBoardDto boardDto = new FcvbBoardDto();

		int updateCnt = FcvbBoardDao.updateBoard(boardForm);

		String deleteFile = boardForm.getDelete_file();
		if (!"".equals(deleteFile)) {

			String[] deleteFileInfo = deleteFile.split("!");

			int boardNum = Integer.parseInt(deleteFileInfo[0]);
			int bfNum = Integer.parseInt(deleteFileInfo[1]);

			BoardFileForm deleteBoardFileForm = new BoardFileForm();
			deleteBoardFileForm.setBoard_num(boardNum);
			deleteBoardFileForm.setBf_num(bfNum);

			FcvbBoardDao.deleteBoardFile(deleteBoardFileForm);
		}

		List<BoardFileForm> boardFileList = getBoardFileInfo(boardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			FcvbBoardDao.insertBoardFile(boardFileForm);
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
	public FcvbBoardDto insertBoardReply(FcvbBoardForm boardForm) throws Exception {

		FcvbBoardDto boardDto = new FcvbBoardDto();

		FcvbBoardDto boardReplayInfo = FcvbBoardDao.getBoardReplyInfo(boardForm);
		
		boardForm.setBoard_num(boardReplayInfo.getBoard_num());
		boardForm.setFcvb_group_num(boardReplayInfo.getFcvb_group_num());
		boardForm.setFcvb_answer_deep(boardReplayInfo.getFcvb_answer_deep());
		boardForm.setFcvb_answer_order(boardReplayInfo.getFcvb_answer_order());

		int insertCnt = 0;

		insertCnt += FcvbBoardDao.updateBoardReSeq(boardForm);

		insertCnt += FcvbBoardDao.insertBoardReply(boardForm);

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
