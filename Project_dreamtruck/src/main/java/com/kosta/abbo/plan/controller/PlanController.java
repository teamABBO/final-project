package com.kosta.abbo.plan.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.plan.domain.Plan;
import com.kosta.abbo.plan.service.PlanService;
import com.kosta.abbo.user.domain.NormalUser;

@Controller
@RequestMapping("/plan")
public class PlanController {
	@Inject
	private PlanService service;
	private static final Logger logger = Logger.getLogger(PlanController.class);
	
	@RequestMapping(value="/schedule", method = RequestMethod.GET)
	public void schedule(Model model, HttpSession session) throws Exception{
		logger.info("스케줄 페이지");
		ObjectMapper objectMapper = new ObjectMapper();
		Object obj = session.getAttribute("login");
		if(obj != null){
			NormalUser normalUser = (NormalUser) obj;
			String jsonlist = objectMapper.writeValueAsString(service.list(normalUser.getUserId()));
			model.addAttribute("list", jsonlist);
		}
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	public void uploadGET(){
		logger.info("스케줄 등록 페이지");
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String uploadPOST(Plan plan, RedirectAttributes rttr){
		/*logger.info(plan);
		logger.info(plan.getDay());
		logger.info(plan.getDay().length());
		logger.info(plan.getDay().split(",")[0]);*/
//		logger.info(plan.getDay().split(",").length);
		for(int i=0; i<plan.getDay().split(",").length; i++){
			Plan addPlan = new Plan();
			addPlan.setDay(plan.getDay().split(",")[i]);
			addPlan.setTitle(plan.getTitle().split(",")[i]);
			addPlan.setX(plan.getX().split(",")[i]);
			addPlan.setY(plan.getY().split(",")[i]);
			addPlan.setOpen(plan.getOpen().split(",")[i]);
			addPlan.setClose(plan.getClose().split(",")[i]);
			addPlan.setUserId(plan.getUserId().split(",")[i]);
			service.create(addPlan);
		}
//		service.create(plan);
		rttr.addFlashAttribute("msg", "SUCCESS");
		logger.info("스케줄 등록!!!");
		return "redirect:schedule";
	}
	
	@RequestMapping(value="/searchMap", method = RequestMethod.GET)
	public void searchMap(){
		logger.info("지도 페이지");
		
	}
	
}
