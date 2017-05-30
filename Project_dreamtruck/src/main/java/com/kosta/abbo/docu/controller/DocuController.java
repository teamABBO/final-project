package com.kosta.abbo.docu.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.docu.service.DocuService;

@Service
@RequestMapping("/docu")
public class DocuController {
	@Inject
	private DocuService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/docu", method = RequestMethod.GET)
	public String docu(Locale locale, Model model) {
		logger.info("서류관리 페이지");
		
		return "docu/docu";
	}
	
}
