package com.kosta.abbo.event.controller;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.sevice.EventService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	private Logger logger = Logger.getLogger(EventController.class);
	
	@Inject
	private EventService service;
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet(Event event, Model model)throws Exception{
		logger.info("upload get............................................");
		
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String uploadPost(Event event, RedirectAttributes rttr)throws Exception{
		logger.info("upload post..........................................");
		logger.info(event.toString());
		service.create(event);
		
		rttr.addFlashAttribute("msg", "success");
		
//		return "event/success";
		return "redirect:/event/success";
	}
	@RequestMapping(value="/list", method =RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("나와라 리스트!!!!");
	}

}