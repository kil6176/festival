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
import com.spring.board.dao.FbBoardDao;
import com.spring.board.dto.FbBoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.FbBoardForm;
import com.spring.board.form.CommonForm;

@Service
public class FbBoardService {

	protected final Logger logger = LoggerFactory.getLogger(FbBoardService.class);

	@Autowired
	private FbBoardDao FbBoardDao;

	/** 게시판 - 목록 조회 */
	public ResultUtil getBoardList(FbBoardForm fbBoardForm) throws Exception {

		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = FbBoardDao.getBoardCnt(fbBoardForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(fbBoardForm.getFunction_name());
			commonForm.setCurrent_page_no(fbBoardForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		fbBoardForm.setLimit(commonDto.getLimit());
		fbBoardForm.setOffset(commonDto.getOffset());

		List<FbBoardDto> list = FbBoardDao.getBoardList(fbBoardForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	/** 게시판 - 상세 조회 */
	public FbBoardDto getBoardDetail(FbBoardForm fbBoardForm) throws Exception {

		logger.debug("==================== getBoardDetail START ====================");

		FbBoardDto FbBoardDto = new FbBoardDto();

		String searchType = fbBoardForm.getSearch_type();

		if ("S".equals(searchType)) {

			FbBoardDao.updateBoardHits(fbBoardForm);
		}

		FbBoardDto = FbBoardDao.getBoardDetail(fbBoardForm);

		BoardFileForm boardFileForm = new BoardFileForm();
		boardFileForm.setBoard_num(fbBoardForm.getBoard_num());

		FbBoardDto.setFiles(FbBoardDao.getBoardFileList(boardFileForm));

		logger.debug("==================== getBoardDetail END ====================");

		return FbBoardDto;
	}

	/** 게시판 - 등록 */
	public FbBoardDto insertBoard(FbBoardForm fbBoardForm) throws Exception {

		FbBoardDto FbBoardDto = new FbBoardDto();

		int insertCnt = 0;

		//int FbGroupNum = FbBoardDao.getFbGroupNum(FbBoardForm);
		//fbBoardForm.setFb_group_num(FbGroupNum);

		insertCnt = FbBoardDao.insertBoard(fbBoardForm);

		List<BoardFileForm> boardFileList = getBoardFileInfo(fbBoardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			FbBoardDao.insertBoardFile(boardFileForm);
		}

		if (insertCnt > 0) {
			FbBoardDto.setResult("SUCCESS");
		} else {
			FbBoardDto.setResult("FAIL");
		}

		return FbBoardDto;
	}

	/** 게시판 - 첨부파일 정보 조회 */
	public List<BoardFileForm> getBoardFileInfo(FbBoardForm fbBoardForm) throws Exception {

		List<MultipartFile> files = fbBoardForm.getFiles();

		List<BoardFileForm> boardFileList = new ArrayList<BoardFileForm>();

		BoardFileForm boardFileForm = new BoardFileForm();

		int boardNum = fbBoardForm.getBoard_num();
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
	public FbBoardDto deleteBoard(FbBoardForm fbBoardForm) throws Exception {
		
		logger.debug("==================== deleteBoard START ====================");

		FbBoardDto FbBoardDto = new FbBoardDto();

		int deleteCnt = FbBoardDao.deleteBoard(fbBoardForm);

		if (deleteCnt > 0) {
			FbBoardDto.setResult("SUCCESS");
		} else {
			FbBoardDto.setResult("FAIL");
		}

		logger.debug("==================== deleteBoard START ====================");
		
		return FbBoardDto;
	}

	/** 게시판 - 수정 */
	public FbBoardDto updateBoard(FbBoardForm fbBoardForm) throws Exception {

		logger.debug("==================== updateBoard START ====================");
		
		FbBoardDto fbBoardDto = new FbBoardDto();

		int updateCnt = FbBoardDao.updateBoard(fbBoardForm);

		String deleteFile = fbBoardForm.getDelete_file();
		if (!"".equals(deleteFile)) {

			String[] deleteFileInfo = deleteFile.split("!");

			int boardNum = Integer.parseInt(deleteFileInfo[0]);
			int bfNum = Integer.parseInt(deleteFileInfo[1]);

			BoardFileForm deleteBoardFileForm = new BoardFileForm();
			deleteBoardFileForm.setBoard_num(boardNum);
			deleteBoardFileForm.setBf_num(bfNum);

			FbBoardDao.deleteBoardFile(deleteBoardFileForm);
		}

		List<BoardFileForm> boardFileList = getBoardFileInfo(fbBoardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			FbBoardDao.insertBoardFile(boardFileForm);
		}

		if (updateCnt > 0) {
			fbBoardDto.setResult("SUCCESS");
		} else {
			fbBoardDto.setResult("FAIL");
		}

		logger.debug("==================== updateBoard START ====================");
		
		return fbBoardDto;
	}

	

	/** 32글자의 랜덤한 문자열(숫자포함) 생성 */
	public static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
