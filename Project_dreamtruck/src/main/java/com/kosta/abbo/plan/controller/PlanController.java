package com.kosta.abbo.plan.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.plan.service.PlanService;

@Service
@RequestMapping("/plan")
public class PlanController {
	@Inject
	private PlanService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
}
