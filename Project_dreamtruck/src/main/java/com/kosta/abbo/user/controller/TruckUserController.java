package com.kosta.abbo.user.controller;


import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.PageMaker;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.service.TruckUserService;



@Controller
@RequestMapping("/truck")
public class TruckUserController {
	@Inject
	private TruckUserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	/**
	 * 페이징처리
	 * @param cri
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info(".... show list Page with Criteria");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
	}

	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void read(@RequestParam("userId") int userId,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(userId+"**** ");
		model.addAttribute(service.read(userId));
	}
	
	
	
}
