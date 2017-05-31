package com.kosta.abbo.user.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.user.service.NormalUserService;

@Controller
@RequestMapping("/user/*")
public class NormalUserController {
	@Inject
	private NormalUserService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 로그인 get
	 * @param dto
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("로그인 GET .....");
	}
	
	/**
	 * 로그인 post
	 * @param dto
	 * @param session
	 * @param model
	 */
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model){
		logger.info("로그인 POST .....");
		
		NormalUser normalUser = service.login(dto);
		if(normalUser == null){
			return;
		}
		model.addAttribute("normalUser",normalUser);
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Object obj = session.getAttribute("login");
		
		
		if(obj != null){
			NormalUser normalUser = (NormalUser) obj;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
//				service.keepLogin()
			}
			
		}
		return "user/login";
	}
}

