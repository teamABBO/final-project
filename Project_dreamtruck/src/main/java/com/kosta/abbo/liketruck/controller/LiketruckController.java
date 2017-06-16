package com.kosta.abbo.liketruck.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.liketruck.service.LiketruckService;
import com.kosta.abbo.review.domain.Review;
import com.kosta.abbo.user.domain.NormalUser;

@RestController
@Controller
@RequestMapping("/liketruck")
public class LiketruckController {
	
	@Inject
	private LiketruckService service;
	private static final Logger logger = LoggerFactory.getLogger(LiketruckController.class);
		
	/**
	 * 관심트럭 목록 리스트
	 * @param liketruck
	 * @param model
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(Liketruck liketruck,  Model model,HttpSession session) throws Exception{
		logger.info("관심트럭 목록 리스트");
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		
		model.addAttribute("list",service.list(loginUser.getUserId()));
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestParam("userId") int truckId, HttpSession session) {
		logger.info("관심트럭 등록 컨트롤러");
		ResponseEntity<String> entity = null;
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		
		service.create(loginUser.getUserId(), truckId);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ResponseEntity<String> delete(@RequestParam("userId") int truckId, HttpSession session) {
		logger.info("관심트럭 등록 컨트롤러");
		ResponseEntity<String> entity = null;
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		
		service.delete(loginUser.getUserId(), truckId);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
}
