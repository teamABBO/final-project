package com.kosta.abbo.plan.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.plan.domain.Plan;
import com.kosta.abbo.plan.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {
	@Inject
	private PlanService service;
	private static final Logger logger = Logger.getLogger(PlanController.class);
	
	@RequestMapping(value="/schedule", method = RequestMethod.GET)
	public void schedule(Model model) throws Exception{
		ObjectMapper objectMapper = new ObjectMapper();
		
		logger.info("스케줄 페이지");
		String jsonlist = objectMapper.writeValueAsString(service.list());
		model.addAttribute("list", jsonlist);
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
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String add(Model model){
		logger.info("ajax를 슈발..");
		model.addAttribute("list", "list");
		return "/plan/upload";
	}
}
