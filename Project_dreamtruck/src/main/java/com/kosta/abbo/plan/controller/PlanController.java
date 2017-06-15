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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
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
		logger.info(plan);
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
			addPlan.setUserId(plan.getUserId());
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
	
	@ResponseBody
	@RequestMapping(value="/modifyForm", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ResponseEntity<String> modifyForm(int planId) throws JsonProcessingException{
		logger.info("스케줄 수정요청!!");
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonlist = objectMapper.writeValueAsString(service.read(planId));
		return new ResponseEntity<String>(jsonlist, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public ResponseEntity<String> delete(int planId) throws JsonProcessingException{
		logger.info("스케줄 삭제!!");
		service.delete(planId);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/modify", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> modify(int planId, String title, String open, String close, 
			                             String x, String y, String day){
		logger.info("스케줄 수정!!");
		Plan plan = new Plan();
		plan.setPlanId(planId);
		plan.setTitle(title);
		plan.setOpen(open);
		plan.setClose(close);
		plan.setX(x);
		plan.setY(y);
		plan.setDay(day);
		service.update(plan);
		return new ResponseEntity<String>("modify", HttpStatus.OK);
	}
	
}
