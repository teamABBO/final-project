package com.kosta.abbo.applier.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.applier.domain.Applier;
import com.kosta.abbo.applier.service.ApplierService;
import com.kosta.abbo.user.domain.EventUser;

@Controller
@RequestMapping("/applier")
public class ApplierController {
	
	@Inject
	private ApplierService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String docu(Model model, HttpSession session, int eventId) throws Exception {
		logger.info("신청트럭 목록 화면");

		ObjectMapper objectMapper = new ObjectMapper();

		List<Applier> applierList = service.list(eventId);

		String jsonList = objectMapper.writeValueAsString(applierList);

		model.addAttribute("docuList", jsonList);

		return "/docu/list";
	}
	
}
