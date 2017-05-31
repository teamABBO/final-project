package com.kosta.abbo.plan.controller;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.plan.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {
	@Inject
	private PlanService service;
	private static final Logger logger = Logger.getLogger(PlanController.class);
	
	@RequestMapping(value="/schedule", method = RequestMethod.GET)
	public String schedule(){
		logger.info("스케줄 페이지");
		return "plan/schedule";
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	public String upload(){
		logger.info("스케줄 등록 페이지");
		return "plan/upload";
	}
	
	@RequestMapping(value="/searchMap", method = RequestMethod.GET)
	public String searchMap(){
		logger.info("지도 페이지");
		return "plan/searchMap";
	}
	
}
