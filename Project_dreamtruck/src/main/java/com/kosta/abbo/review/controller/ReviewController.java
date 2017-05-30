package com.kosta.abbo.review.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.review.service.ReviewService;

@Service
@RequestMapping("/review")
public class ReviewController {
	@Inject
	private ReviewService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
}
