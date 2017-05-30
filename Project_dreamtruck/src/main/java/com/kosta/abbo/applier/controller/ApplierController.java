package com.kosta.abbo.applier.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.applier.service.ApplierService;

@Service
@RequestMapping("/applier")
public class ApplierController {
	
	@Inject
	private ApplierService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
}
