package com.spring.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.common.ResultUtil;
import com.spring.board.dto.NeBoardDto;
import com.spring.board.form.NeBoardForm;
import com.spring.board.service.NeBoardService;

@Controller
@RequestMapping(value = "/ne_board")
public class NeBoardController {

	@Autowired
	private NeBoardService neboardService;

	/** 게시판 - 목록 페이지 이동 */
	@RequestMapping(value = "/boardList.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "ne_board/boardList";
	}

	/** 게시판 - 목록 조회 */
	@RequestMapping(value = "/getBoardList.do")
	@ResponseBody
	public ResultUtil getBoardList(HttpServletRequest request, HttpServletResponse response, NeBoardForm neBoardForm) throws Exception {

		ResultUtil resultUtils = neboardService.getBoardList(neBoardForm);

		return resultUtils;
	}

	/** 게시판 - 상세 페이지 이동 */
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "ne_board/boardDetail";
	}

	/** 게시판 - 상세 조회 */
	@RequestMapping(value = "/getBoardDetail.do")
	@ResponseBody
	public NeBoardDto getBoardDetail(HttpServletRequest request, HttpServletResponse response, NeBoardForm neBoardForm) throws Exception {

		MDC.put("TRANSACTION_ID", String.valueOf(neBoardForm.getBoard_num()));

		NeBoardDto neBoardDto = neboardService.getBoardDetail(neBoardForm);

		MDC.remove("TRANSACTION_ID");

		return neBoardDto;
	}

	/** 게시판 - 작성 페이지 이동 */
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "ne_board/boardWrite";
	}

	/** 게시판 - 등록 */
	@RequestMapping(value = "/insertBoard.do")
	@ResponseBody
	public NeBoardDto insertBoard(HttpServletRequest request, HttpServletResponse response, NeBoardForm neBoardForm) throws Exception {

		NeBoardDto neBoardDto = neboardService.insertBoard(neBoardForm);

		return neBoardDto;
	}

	/** 게시판 - 삭제 */
	@RequestMapping(value = "/deleteBoard.do")
	@ResponseBody
	public NeBoardDto deleteBoard(HttpServletRequest request, HttpServletResponse response, NeBoardForm neBoardForm) throws Exception {

		MDC.put("TRANSACTION_ID", String.valueOf(neBoardForm.getBoard_num()));

		NeBoardDto neBoardDto = neboardService.deleteBoard(neBoardForm);

		MDC.remove("TRANSACTION_ID");

		return neBoardDto;
	}

	/** 게시판 - 수정 페이지 이동 */
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "ne_board/boardUpdate";
	}

	/** 게시판 - 수정 */
	@RequestMapping(value = "/updateBoard.do")
	@ResponseBody
	public NeBoardDto updateBoard(HttpServletRequest request, HttpServletResponse response, NeBoardForm neBoardForm) throws Exception {

		MDC.put("TRANSACTION_ID", String.valueOf(neBoardForm.getBoard_num()));

		NeBoardDto neBoardDto = neboardService.updateBoard(neBoardForm);

		MDC.remove("TRANSACTION_ID");

		return neBoardDto;
	}

	/** 게시판 - 첨부파일 다운로드 */
	@RequestMapping("/fileDownload.do")
	public ModelAndView fileDownload(@RequestParam("bf_name_key") String bf_name_key, @RequestParam("bf_name") String bf_name,
			@RequestParam("bf_path") String bf_path) throws Exception {

		/** 첨부파일 정보 조회 */
		Map<String, Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("bf_name_key", bf_name_key);
		fileInfo.put("bf_name", bf_name);
		fileInfo.put("bf_path", bf_path);

		return new ModelAndView("fileDownloadUtil", "fileInfo", fileInfo);
	}
}
