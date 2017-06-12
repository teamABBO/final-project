package com.kosta.abbo.liketruck.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.liketruck.service.LiketruckService;
import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.PageMaker;
import com.kosta.abbo.page.domain.SearchCriteria;

@Controller
@RequestMapping("/liketruck")
public class LiketruckController {
	@Inject
	private LiketruckService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	

	
}
