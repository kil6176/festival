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
import com.spring.board.dao.NeBoardDao;
import com.spring.board.dto.NeBoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.NeBoardForm;
import com.spring.board.form.CommonForm;

@Service
public class NeBoardService {

	protected final Logger logger = LoggerFactory.getLogger(NeBoardService.class);

	@Autowired
	private NeBoardDao neBoardDao;

	/** 게시판 - 목록 조회 */
	public ResultUtil getBoardList(NeBoardForm neBoardForm) throws Exception {

		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = neBoardDao.getBoardCnt(neBoardForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(neBoardForm.getFunction_name());
			commonForm.setCurrent_page_no(neBoardForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		neBoardForm.setLimit(commonDto.getLimit());
		neBoardForm.setOffset(commonDto.getOffset());

		List<NeBoardDto> list = neBoardDao.getBoardList(neBoardForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	/** 게시판 - 상세 조회 */
	public NeBoardDto getBoardDetail(NeBoardForm neBoardForm) throws Exception {

		logger.debug("==================== getBoardDetail START ====================");

		NeBoardDto neBoardDto = new NeBoardDto();

		String searchType = neBoardForm.getSearch_type();

		if ("S".equals(searchType)) {

			neBoardDao.updateBoardHits(neBoardForm);
		}

		neBoardDto = neBoardDao.getBoardDetail(neBoardForm);

		BoardFileForm boardFileForm = new BoardFileForm();
		boardFileForm.setBoard_num(neBoardForm.getBoard_num());

		neBoardDto.setFiles(neBoardDao.getBoardFileList(boardFileForm));

		logger.debug("==================== getBoardDetail END ====================");

		return neBoardDto;
	}

	/** 게시판 - 등록 */
	public NeBoardDto insertBoard(NeBoardForm boardForm) throws Exception {

		NeBoardDto boardDto = new NeBoardDto();

		int insertCnt = 0;

		//int FbGroupNum = neBoardDao.getFbGroupNum(boardForm);
		//boardForm.setFb_group_num(FbGroupNum);

		insertCnt = neBoardDao.insertBoard(boardForm);

		List<BoardFileForm> boardFileList = getBoardFileInfo(boardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			neBoardDao.insertBoardFile(boardFileForm);
		}

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 첨부파일 정보 조회 */
	public List<BoardFileForm> getBoardFileInfo(NeBoardForm boardForm) throws Exception {

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
	public NeBoardDto deleteBoard(NeBoardForm boardForm) throws Exception {
		
		logger.debug("==================== deleteBoard START ====================");

		NeBoardDto boardDto = new NeBoardDto();

		int deleteCnt = neBoardDao.deleteBoard(boardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		logger.debug("==================== deleteBoard START ====================");
		
		return boardDto;
	}

	/** 게시판 - 수정 */
	public NeBoardDto updateBoard(NeBoardForm boardForm) throws Exception {

		logger.debug("==================== updateBoard START ====================");
		
		NeBoardDto boardDto = new NeBoardDto();

		int updateCnt = neBoardDao.updateBoard(boardForm);

		String deleteFile = boardForm.getDelete_file();
		if (!"".equals(deleteFile)) {

			String[] deleteFileInfo = deleteFile.split("!");

			int boardNum = Integer.parseInt(deleteFileInfo[0]);
			int bfNum = Integer.parseInt(deleteFileInfo[1]);

			BoardFileForm deleteBoardFileForm = new BoardFileForm();
			deleteBoardFileForm.setBoard_num(boardNum);
			deleteBoardFileForm.setBf_num(bfNum);

			neBoardDao.deleteBoardFile(deleteBoardFileForm);
		}

		List<BoardFileForm> boardFileList = getBoardFileInfo(boardForm);
		for (BoardFileForm boardFileForm : boardFileList) {
			neBoardDao.insertBoardFile(boardFileForm);
		}

		if (updateCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		logger.debug("==================== updateBoard START ====================");
		
		return boardDto;
	}

	

	/** 32글자의 랜덤한 문자열(숫자포함) 생성 */
	public static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
