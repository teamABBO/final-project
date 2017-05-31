package com.kosta.abbo.user.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.user.service.TruckUserService;

@Controller
@RequestMapping("/truck")
public class TruckUserController {
	@Inject
	private TruckUserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info(".....show truck list ");
		model.addAttribute("list", service.list());
	}
}
