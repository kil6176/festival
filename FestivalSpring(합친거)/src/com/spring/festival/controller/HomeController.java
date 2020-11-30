package com.spring.festival.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.festival.common.ResultUtil;
import com.spring.festival.dto.ManagerVO;
import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
import com.spring.festival.service.ManagerService;
import com.spring.festival.service.MemberService;
import com.spring.festival.service.TrashService;

@Controller
public class HomeController
{
	final int PASSWORD_OK = 1;
	final int UPDATE_OK = 1;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MemberService service;
	
	@Inject
	private ManagerService managerService;

	@Inject
	private TrashService trashService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET })
	public String home() throws Exception
	{

		logger.info("home");

		return "home";
	}

	// 모바일 지도 사이트 이동
	@RequestMapping(value = "/mTrashMap.do", method = RequestMethod.GET)
	public String mTrashMap() throws Exception
	{
		logger.info("get mTrashMap");
		return "mTrashMap";
	}

	// 로그인 사이트 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, HttpServletResponse response) throws Exception
	{
		logger.info("get login");
		if (session.getAttribute("member") == null)
		{
			return "login";
		}
		else
			response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('이미 로그인이 되어있습니다.');</script>");
		out.flush();
		return "home";
	}

	// 회원정보 사이트 이동
	@RequestMapping(value = "/manager.do", method = RequestMethod.GET)
	public String manager(HttpSession session, HttpServletResponse response) throws Exception
	{
		logger.info("manager");
		if (session.getAttribute("member") != null)
		{
			return "manager";
		}
		else
			response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('이 페이지는 로그인을 하셔야 합니다.');</script>");
		out.flush();
		return "home";

	}

	// 회원가입 사이트 이동
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String getRegister() throws Exception
	{
		logger.info("get register");
		return "register";
	}

	// 일반 지도 사이트 이동
	@RequestMapping(value = "/trashMap", method = RequestMethod.GET)
	public String trashMap(HttpSession session) throws Exception
	{
		logger.info("trashMap");

		return "trashMap";
	}

	// 회원가입 post니까 가입완료 할때
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception
	{
		logger.info("post register");

		int result = service.idDupleCheck(vo);
		try
		{
			if (result == 1)
			{
				return "register";
			}
			else if (result == 0)
			{
				result = service.nickDupleCheck(vo);

				try
				{
					if (result == 1)
					{
						return "register";
					}
					else if (result == 0)
					{
						service.register(vo);
					}
					// 요기에서~ 입력된 닉네임이 존재한다면 -> 다시 회원가입 페이지로 돌아가기
					// 존재하지 않는다면 -> register
				}
				catch (Exception e)
				{
					throw new RuntimeException();
				}
				return "redirect:/";
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		}
		catch (Exception e)
		{
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	// 아이디 체크 post
	@ResponseBody
	@RequestMapping(value = "/idDupleCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public int idDupleCheck(MemberVO vo) throws Exception
	{
		logger.info("post idDupleCheck");

		int result = service.idDupleCheck(vo);

		return result;
	}

	// 닉네임 체크 post
	@ResponseBody
	@RequestMapping(value = "/nickDupleCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public int nickDupleCheck(MemberVO vo) throws Exception
	{
		logger.info("post nickDupleCheck");

		int result = service.nickDupleCheck(vo);

		return result;
	}

	// 패스워드 체크 post
	@ResponseBody
	@RequestMapping(value = "/passwordCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public int passwordCheck(MemberVO vo) throws Exception
	{
		logger.info("post passwordCheck");

		int result = service.passwordCheck(vo);

		return result;
	}

	// 로그인 확인 버튼 누르면
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception
	{
		logger.info("post login");

		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);

		if (login == null)
		{
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		else
			session.setAttribute("member", login);

		if (session.getAttribute("member") == null)
			return "redirect:/login.do";
		else
			return "redirect:/";

	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception
	{
		// 세션지우기
		session.invalidate();

		return "redirect:/";
	}

	// 쓰레기통 불러오기
	@ResponseBody
	@RequestMapping(value = "/trashCanSearch.do", method = { RequestMethod.POST, RequestMethod.GET })
	public List<TrashVO> trashCanSearch(TrashVO vo) throws Exception
	{
		logger.info("trashCanSearch");

		List<TrashVO> trashCanList = trashService.searchTrashCan(vo);
		return trashCanList;
	}

	// 회원정보 업데이트 post
	@ResponseBody
	@RequestMapping(value = "/infoChange.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String postInfoChange(MemberVO vo, HttpSession session, HttpServletRequest req, RedirectAttributes rttr)
			throws Exception
	{
		logger.info("post infoChange");
		try
		{
			if (service.passwordCheck(vo) == PASSWORD_OK)
			{
				if (service.infoChange(vo) == UPDATE_OK)
				{
					session.invalidate();
					return "<script>" + "alert(\"회원정보가 바꼈습니다. 다시 로그인 해주세요\");" + "location.href=\"/\";" + "</script>";
				}

				else
				{
					return "<script>" + "alert(\"변경에 실패하였습니다.\");" + "</script>";
				}

			}

			else
			{
				return "<script>" + "alert(\"비정상적인 방법이거나 패스워드가 틀립니다.\");"

						+ "history.back();" + "</script>";
			}

		}
		catch (Exception e)
		{
			throw new RuntimeException();

		}

	}
	
	// 비밀번호 변경 업데이트 post
	@ResponseBody
	@RequestMapping(value = "/passwordChange.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String postPasswordChange(MemberVO vo, HttpSession session, HttpServletRequest req, RedirectAttributes rttr)
			throws Exception
	{
		logger.info("post PasswordChange");
		try
		{
			if (service.passwordCheck(vo) == PASSWORD_OK)
			{
				if (service.passwordChange(vo) == UPDATE_OK)
				{
					session.invalidate();
					return "<script>" + "alert(\"비밀번호가 바꼈습니다. 다시 로그인 해주세요\");" + "location.href=\"/\";" + "</script>";
				}

				else
				{
					return "<script>" + "alert(\"변경에 실패하였습니다.\");" + "</script>";
				}

			}

			else
			{
				return "<script>" + "alert(\"비정상적인 방법이거나 패스워드가 틀립니다.\");"

						+ "history.back();" + "</script>";
			}

		}
		catch (Exception e)
		{
			throw new RuntimeException();
		}

	}
	
	// 유저 목록 조회
	@RequestMapping(value = "/getUserList.do")
	@ResponseBody
	public ResultUtil getBoardList(HttpServletRequest request, HttpServletResponse response, MemberVO vo) throws Exception {

		ResultUtil resultUtils = service.getUserList(vo);

		return resultUtils;
	}
	
	
	// 비밀번호 변경 업데이트 post
	@ResponseBody
	@RequestMapping(value = "/authorityChange.do", method ={RequestMethod.POST, RequestMethod.GET })
	public int authorityChange(MemberVO vo, HttpSession session, HttpServletRequest req, RedirectAttributes rttr)
			throws Exception
	{
		logger.info("post authorityChange");
		int result = service.authorityChange(vo);
		System.out.print("result임"+result);
		return result;
	}
			
	// 축제 목록 조회
	@RequestMapping(value = "/getFestivalList.do")
	@ResponseBody
	public ResultUtil getFestivalList(HttpServletRequest request, HttpServletResponse response, ManagerVO vo) throws Exception {

		ResultUtil resultUtils = managerService.getFestivalList(vo);

		return resultUtils;
	}

	// 쓰레기통 개수 체크 post
	@ResponseBody
	@RequestMapping(value = "/getTrashCanCnt.do", method = { RequestMethod.POST, RequestMethod.GET })
	public int getTrashCnt(ManagerVO vo) throws Exception
	{
		logger.info("post getTrashCanCnt");

		int result = managerService.getTrashCanCnt(vo);

		return result;
	}

	
	// 축제 목록 조회
	@RequestMapping(value = "/getTrashCanList.do")
	@ResponseBody
	public ResultUtil selectTrashList(HttpServletRequest request, HttpServletResponse response, ManagerVO vo) throws Exception {
	
	ResultUtil resultUtils = managerService.getTrashCanList(vo);
	
	return resultUtils;
	}
	
	//좌표 검색
	@RequestMapping(value = "/searchLocation.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String searchLocation() throws Exception
	{

		logger.info("searchLocation");

		return "searchLocation";
	}
	
	// 쓰레기통 추가
	@RequestMapping(value = "/insertTrashCan.do", method = RequestMethod.POST)
	@ResponseBody
	public int insertTrashCan(TrashVO vo) throws Exception
	{
		logger.info("post register");

		int result = trashService.insertTrashCan(vo);
		
		return result;
	}
	
	// 쓰레기통 정보변경
	@RequestMapping(value = "/updateTrashCan.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateTrashCan(TrashVO vo) throws Exception
	{
		logger.info("post register");

		int result = trashService.updateTrashCan(vo);
		
		return result;
	}
	
	// 쓰레기통 삭제
	@RequestMapping(value = "/deleteTrashCan.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteTrashCan(TrashVO vo) throws Exception
	{
		logger.info("post register");

		int result = trashService.deleteTrashCan(vo);
		
		return result;
	}
	
	// 쓰레기통 상세정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/selectOneTrashCan.do", method = { RequestMethod.POST, RequestMethod.GET })
	public List<TrashVO> trashCanDetail(TrashVO vo) throws Exception
	{
		logger.info("selectOneTrashCan");

		List<TrashVO> trashCanList = trashService.selectOneTrashCan(vo);
		return trashCanList;
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/selectFindID.do", method = { RequestMethod.POST, RequestMethod.GET })
	public List<MemberVO> selectFindID(MemberVO vo) throws Exception
	{
		logger.info("selectFindID");

		List<MemberVO> id = service.selectFindID(vo);
		return id;
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/updateFindPW.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String updateFindPW(MemberVO vo) throws Exception
	{
		logger.info("updateFindPW");

		String PW = service.updateFindPW(vo);
		return PW;
	}
}