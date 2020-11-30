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
import com.spring.board.dao.RvBoardDao;
import com.spring.board.dto.RvBoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.RvBoardForm;
import com.spring.board.form.CommonForm;

@Service
public class RvBoardService {

	protected final Logger logger = LoggerFactory.getLogger(RvBoardService.class);

	@Autowired
	private RvBoardDao rvBoardDao;

	/** 게시판 - 목록 조회 */
	public ResultUtil getBoardList(RvBoardForm rvBoardForm) throws Exception {

		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = rvBoardDao.getBoardCnt(rvBoardForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(rvBoardForm.getFunction_name());
			commonForm.setCurrent_page_no(rvBoardForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		rvBoardForm.setLimit(commonDto.getLimit());
		rvBoardForm.setOffset(commonDto.getOffset());

		List<RvBoardDto> list = rvBoardDao.getBoardList(rvBoardForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	/** 게시판 - 상세 조회 */
	public RvBoardDto getBoardDetail(RvBoardForm rvBoardForm) throws Exception {

		logger.debug("==================== getBoardDetail START ====================");

		RvBoardDto rvBoardDto = new RvBoardDto();

		String searchType = rvBoardForm.getSearch_type();

		if ("S".equals(searchType)) {

			rvBoardDao.updateBoardHits(rvBoardForm);
		}

		rvBoardDto = rvBoardDao.getBoardDetail(rvBoardForm);

		BoardFileForm boardFileForm = new BoardFileForm();
		boardFileForm.setBoard_num(rvBoardForm.getBoard_num());

		rvBoardDto.setFiles(rvBoardDao.getBoardFileList(boardFileForm));

		logger.debug("==================== getBoardDetail END ====================");

		return rvBoardDto;
	}

	/** 게시판 - 등록 */
	public RvBoardDto insertBoard(RvBoardForm rvBoardForm) throws Exception {

		RvBoardDto rvBoardDto = new RvBoardDto();

		int insertCnt = 0;

		//int FbGroupNum = rvBoardDao.getFbGroupNum(RvBoardForm);
		//RvBoardForm.setfrb_group_num(FbGroupNum);

		insertCnt = rvBoardDao.insertBoard(rvBoardForm);

		List<BoardFileForm> boardFileList = getBoardFileInfo(rvBoardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			rvBoardDao.insertBoardFile(boardFileForm);
		}

		if (insertCnt > 0) {
			rvBoardDto.setResult("SUCCESS");
		} else {
			rvBoardDto.setResult("FAIL");
		}

		return rvBoardDto;
	}

	/** 게시판 - 첨부파일 정보 조회 */
	public List<BoardFileForm> getBoardFileInfo(RvBoardForm rvBoardForm) throws Exception {

		List<MultipartFile> files = rvBoardForm.getFiles();

		List<BoardFileForm> boardFileList = new ArrayList<BoardFileForm>();

		BoardFileForm boardFileForm = new BoardFileForm();

		int boardNum = rvBoardForm.getBoard_num();
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
	public RvBoardDto deleteBoard(RvBoardForm rvBoardForm) throws Exception {
		
		logger.debug("==================== deleteBoard START ====================");

		RvBoardDto rvBoardDto = new RvBoardDto();

		int deleteCnt = rvBoardDao.deleteBoard(rvBoardForm);

		if (deleteCnt > 0) {
			rvBoardDto.setResult("SUCCESS");
		} else {
			rvBoardDto.setResult("FAIL");
		}

		logger.debug("==================== deleteBoard START ====================");
		
		return rvBoardDto;
	}

	/** 게시판 - 수정 */
	public RvBoardDto updateBoard(RvBoardForm rvBoardForm) throws Exception {

		logger.debug("==================== updateBoard START ====================");
		
		RvBoardDto rvBoardDto = new RvBoardDto();

		int updateCnt = rvBoardDao.updateBoard(rvBoardForm);

		String deleteFile = rvBoardForm.getDelete_file();
		if (!"".equals(deleteFile)) {

			String[] deleteFileInfo = deleteFile.split("!");

			int boardNum = Integer.parseInt(deleteFileInfo[0]);
			int bfNum = Integer.parseInt(deleteFileInfo[1]);

			BoardFileForm deleteBoardFileForm = new BoardFileForm();
			deleteBoardFileForm.setBoard_num(boardNum);
			deleteBoardFileForm.setBf_num(bfNum);

			rvBoardDao.deleteBoardFile(deleteBoardFileForm);
		}

		List<BoardFileForm> boardFileList = getBoardFileInfo(rvBoardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			rvBoardDao.insertBoardFile(boardFileForm);
		}

		if (updateCnt > 0) {
			rvBoardDto.setResult("SUCCESS");
		} else {
			rvBoardDto.setResult("FAIL");
		}

		logger.debug("==================== updateBoard START ====================");
		
		return rvBoardDto;
	}

	

	/** 32글자의 랜덤한 문자열(숫자포함) 생성 */
	public static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
