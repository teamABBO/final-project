package com.kosta.abbo.liketruck.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.liketruck.service.LiketruckService;

@Controller
@RequestMapping("/liketruck")
public class LiketruckController {
	@Inject
	private LiketruckService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
}
