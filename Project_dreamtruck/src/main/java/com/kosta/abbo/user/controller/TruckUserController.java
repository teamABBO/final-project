package com.kosta.abbo.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.liketruck.service.LiketruckService;
import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.PageMaker;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.plan.service.PlanService;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.user.service.TruckUserService;

@Controller
@RequestMapping("/truck")
public class TruckUserController {
	@Inject
	private TruckUserService service;

	@Inject
	private PlanService planservice;

	@Inject
	private LiketruckService likeService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	/**
	 * 페이징처리
	 * 
	 * @param cri
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {
		logger.info("트럭 목록 페이지 - 페이징만");

		model.addAttribute("list", service.listCriteria(cri));
	}

	/**
	 * 트럭 목록 - 검색, 페이징
	 * 
	 * @param cri
	 * @param model
	 * @param session
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception {
		logger.info("트럭 목록 페이지 - 검색, 페이징");
		if (session.getAttribute("login") != null) {
			NormalUser loginUser = (NormalUser) session.getAttribute("login");
			List<Liketruck> likeListAll = likeService.list(loginUser.getUserId());
			List<Liketruck> likeList = new ArrayList<Liketruck>();
			if (likeListAll.size() > 5) {
				for (int i = 0; i < 5; i++) {
					likeList.add(likeListAll.get(i));
				}
				model.addAttribute("likeList", likeList);
			} else {
				model.addAttribute("likeList", likeListAll);
			}
		}
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);

	}

	/**
	 * 트럭 상세보기
	 * 
	 * @param userId
	 * @param page
	 * @param cri
	 * @param model
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("userId") int userId, @RequestParam("page") int page,
			@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception {
		logger.info("트럭 상세보기");
		NormalUser loginUser = (NormalUser) session.getAttribute("login");

		if (session.getAttribute("login") == null) {
			model.addAttribute(service.read(userId));
		} else {
			if (likeService.checkliketruck(loginUser.getUserId(), userId) > 0) {
				model.addAttribute("isLike", true);
				model.addAttribute(service.read(userId));
			} else {
				model.addAttribute("isLike", false);
				model.addAttribute(service.read(userId));
			}
		}
		cri.setPage(page);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonlist = objectMapper.writeValueAsString(planservice.list(userId));
		String planlist = objectMapper.writeValueAsString(planservice.searchUser(userId));

		model.addAttribute("cri", cri);
		model.addAttribute("list", jsonlist);
		model.addAttribute("plan", planlist);
	}

}
