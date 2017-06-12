package com.kosta.abbo.liketruck.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.liketruck.service.LiketruckService;

@RestController
@RequestMapping("/liketruck")
public class LiketruckController {
	@Inject
	private LiketruckService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public void dolikeTruckGET(@RequestBody Liketruck liketruck) throws Exception{
		
		service.create(liketruck);
		
	}
	
	
	/*@ResponseBody
	public void likeTruckGET(@PathVariable("likeTruck") Liketruck liketruck ) throws Exception{
		
		service.create(liketruck);
	}
	*/
	
	
	public void deleteTruckGET(@PathVariable("liketruckId") int liketruckId) throws Exception{
		
		service.delete(liketruckId);
	}
}
