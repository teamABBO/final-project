package com.kosta.abbo.user.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.user.service.EventUserService;

@Controller
@RequestMapping("/eventUser")
public class EventUserController {
	@Inject
	private EventUserService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
}
