package com.kosta.abbo.plan.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	/**
	 * 마이페이지 스케줄 목록
	 * 
	 * @param model
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public void schedule(Model model, HttpSession session) throws Exception {
		logger.info("스케줄 페이지");
		ObjectMapper objectMapper = new ObjectMapper();
		Object obj = session.getAttribute("login");
		if (obj != null) {
			NormalUser normalUser = (NormalUser) obj;
			String jsonlist = objectMapper.writeValueAsString(service.list(normalUser.getUserId()));
			model.addAttribute("list", jsonlist);
		}
	}

	/**
	 * 스케줄 등록 페이지
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGET() {
		logger.info("스케줄 등록 페이지");
	}

	/**
	 * 스케줄 등록
	 * 
	 * @param plan
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadPOST(Plan plan, RedirectAttributes rttr) {
		logger.info("스케줄 등록");
		for (int i = 0; i < plan.getDay().split(",").length; i++) {
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
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:schedule";
	}

	/**
	 * 스케줄 등록 - 지도
	 */
	@RequestMapping(value = "/searchMap", method = RequestMethod.GET)
	public void searchMap() {
		logger.info("지도 페이지");
	}

	/**
	 * 스케줄 수정 요청
	 * 
	 * @param planId
	 * @return
	 * @throws JsonProcessingException
	 */
	@ResponseBody
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ResponseEntity<String> modifyForm(int planId) throws JsonProcessingException {
		logger.info("스케줄 수정 요청");
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonlist = objectMapper.writeValueAsString(service.read(planId));
		return new ResponseEntity<String>(jsonlist, HttpStatus.OK);
	}

	/**
	 * 스케줄 삭제
	 * 
	 * @param planId
	 * @return
	 * @throws JsonProcessingException
	 */
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> delete(int planId) throws JsonProcessingException {
		logger.info("스케줄 삭제");
		service.delete(planId);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	/**
	 * 스케줄 수정
	 * 
	 * @param planId
	 * @param title
	 * @param open
	 * @param close
	 * @param x
	 * @param y
	 * @param day
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> modify(int planId, String title, String open, String close, String x, String y,
			String day, int userId) {
		logger.info("스케줄 수정");
		Plan plan = new Plan();
		plan.setPlanId(planId);
		plan.setTitle(title);
		plan.setOpen(open);
		plan.setClose(close);
		plan.setX(x);
		plan.setY(y);
		plan.setDay(day);
		plan.setUserId(userId);

		// 유효성검사
		if (service.uploadCheck(plan) == null) {
			service.update(plan);
			return new ResponseEntity<String>("modify", HttpStatus.OK);
		} else {
			if (service.uploadCheck(plan).getPlanId() == planId) {
				service.update(plan);
				return new ResponseEntity<String>("modify", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		}
	}

	/**
	 * 스케줄 등록 유효성 검사
	 * 
	 * @param userId
	 * @param day
	 * @param open
	 * @param close
	 * @return
	 * @throws JsonProcessingException
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> uploadCheck(int userId, String day, String open, String close)
			throws JsonProcessingException {
		logger.info("스케줄 등록 유효성검사");
		for (int i = 0; i < day.split(",").length; i++) {
			Plan plan = new Plan();
			plan.setUserId(userId);
			plan.setDay(day.split(",")[i]);
			plan.setOpen(open.split(",")[i]);
			plan.setClose(close.split(",")[i]);
			if (service.uploadCheck(plan) != null) {
				return new ResponseEntity<String>("NO", HttpStatus.OK);
			}
		}
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

}
