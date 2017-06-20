package com.kosta.abbo.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.user.service.EventUserService;

@Controller
@RequestMapping("/user/*")
public class EventUserController {
	@Inject
	private EventUserService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/** 목록 */
	@RequestMapping(value = "/myboard", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception {
		logger.info("내가 쓴 행사 목록 페이지");
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		model.addAttribute("list", service.list(loginUser.getUserId()));
	}
}
