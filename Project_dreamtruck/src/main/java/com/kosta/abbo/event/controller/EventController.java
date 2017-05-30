package com.kosta.abbo.event.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.event.sevice.EventService;

@Service
@RequestMapping("/event")
public class EventController {
	@Inject
	private EventService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
}
