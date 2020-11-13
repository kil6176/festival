package com.spring.festival.controller;
import java.util.List;
import java.util.Locale;
 
import javax.inject.Inject;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import com.spring.festival.dto.MemberVO;
import com.spring.festival.service.MemberService;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Inject
    private MemberService service;
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) throws Exception{
 
        logger.info("home");
        
        List<MemberVO> memberList = service.selectMember();
        
        model.addAttribute("memberList", memberList);
 
        return "home";
    }
    
    // 회원가입 get
 	@RequestMapping(value = "/register", method = RequestMethod.GET)
 	public void getRegister() throws Exception {
 		logger.info("get register");
 	}
 	
 	// 회원가입 post
 	@RequestMapping(value = "/register", method = RequestMethod.POST)
 	public String postRegister(MemberVO vo) throws Exception {
 		logger.info("post register");
 		
 		service.register(vo);
 		
 		return "home";
 	}
}