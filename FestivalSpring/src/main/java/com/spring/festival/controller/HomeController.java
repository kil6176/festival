package com.spring.festival.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.festival.dto.MemberVO;
import com.spring.festival.dto.TrashVO;
import com.spring.festival.service.MemberService;
import com.spring.festival.service.TrashService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController
{

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MemberService service;

	@Inject
	private TrashService trashService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception
	{

		logger.info("home");

		List<MemberVO> memberList = service.selectMember();

		model.addAttribute("memberList", memberList);

		return "home";
	}

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception
	{
		logger.info("get register");
		return "register";
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
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
	@RequestMapping(value = "/idDupleCheck", method = { RequestMethod.POST, RequestMethod.GET })
	public int idDupleCheck(MemberVO vo) throws Exception
	{
		logger.info("post idDupleCheck");

		int result = service.idDupleCheck(vo);

		return result;
	}

	// 닉네임 체크 post
	@ResponseBody
	@RequestMapping(value = "/nickDupleCheck", method = { RequestMethod.POST, RequestMethod.GET })
	public int nickDupleCheck(MemberVO vo) throws Exception
	{
		logger.info("post nickDupleCheck");

		int result = service.nickDupleCheck(vo);

		return result;
	}

	// 로그인 창으로 가기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception
	{
		logger.info("get login");
		return "login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
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
			return "redirect:/login";
		else
			return "redirect:/";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception
	{

		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value = "/trashMap", method = RequestMethod.GET)
	public String trashMap(HttpSession session) throws Exception
	{
		logger.info("trashMap");

		return "trashMap";
	}
	
	@ResponseBody
	@RequestMapping(value = "/trashCanSearch", method = { RequestMethod.POST, RequestMethod.GET})
	public List<TrashVO> trashCanSearch(TrashVO vo) throws Exception
	{
		logger.info("trashCanSearch");

		List<TrashVO> trashCanList = trashService.searchTrashCan(vo);
		return trashCanList;
	}
}