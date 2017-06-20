package com.kosta.abbo.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.sevice.EventService;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.plan.domain.Plan;
import com.kosta.abbo.plan.service.PlanService;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.user.domain.TruckUser;
import com.kosta.abbo.user.service.NormalUserService;
import com.kosta.abbo.user.service.TruckUserService;

@Controller
@RequestMapping("/android")
public class AndroidController {

	@Inject
	private EventService eventSservice;

	@Inject
	private NormalUserService normalService;

	@Inject
	private TruckUserService truckService;

	@Inject
	private PlanService planService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	/** 안드로이드 로그인 */
	@RequestMapping("/ismember")
	public void ismember(HttpServletResponse response, LoginDTO dto, HttpSession session, Model model) {
		logger.info("안드로이드 로그인");
		NormalUser normalUser = normalService.login(dto);
		if (normalUser == null) {
			model.addAttribute("msg", "success");
			return;
		}

		model.addAttribute("normalUser", normalUser);

		response.setContentType("text/html; charset=utf-8");

		try {
			PrintWriter out = response.getWriter();
			out.println(normalUser.getType());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/** 일반회원 회원가입 */
	@RequestMapping("/normaljoinus")
	public void normalJoinUs(HttpServletResponse response, NormalUser normalUser, RedirectAttributes rttr,
			Model model) {
		logger.info("안드로이드 일반회원 회원가입");
		response.setContentType("text/html; charset=utf-8");

		normalService.create(normalUser);

		model.addAttribute("normalUser", normalUser);
		rttr.addFlashAttribute("msg", "success");

		try {
			PrintWriter out = response.getWriter();
			out.println("OK");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/** 트럭회원 회원가입 */
	@RequestMapping("/truckjoinus")
	public void truckJoinUs(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") String id,
			TruckUser truckUser, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("안드로이드 트럭회원 회원가입");
		response.setContentType("text/html; charset=utf-8");

		truckUser.setTruckImg("/noimage.png");
		truckService.create(truckUser);

		model.addAttribute("truckUser", truckUser);
		rttr.addFlashAttribute("msg", "success");

		try {
			PrintWriter out = response.getWriter();
			out.println("OK");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/firebaseTest")
	public String firebase() {
		logger.info("안드로이드 firebase test");
		return "/FfirebaseTest";
	}

	@RequestMapping("/mapMarker")
	public void mapMarker(HttpServletRequest request, HttpServletResponse response) {
		logger.info("안드로이드 정적으로 마커찍기");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("37.481227,126.886211,준서네 군만두");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/mapmarkerlist")
	public void mapMarkerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("안드로이드 주변 트럭 찾기");
		response.setContentType("text/html; charset=utf-8");
		ObjectMapper objectMapper = new ObjectMapper();
		List<Plan> list = planService.truck();
		String jsonList = objectMapper.writeValueAsString(list);

		try {
			PrintWriter out = response.getWriter();
			out.println(jsonList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/trucklist")
	public void truckList(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("안드로이드 트럭 목록");
		response.setContentType("text/json; charset=utf-8");
		ObjectMapper objectMapper = new ObjectMapper();
		List<TruckUser> list = truckService.list();
		String jsonList = objectMapper.writeValueAsString(list);

		try {
			PrintWriter out = response.getWriter();
			out.println(jsonList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/eventlist")
	public void eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("안드로이드 행사 목록");
		response.setContentType("text/json; charset=utf-8");
		ObjectMapper objectMapper = new ObjectMapper();
		List<Event> list = eventSservice.list();
		String jsonList = objectMapper.writeValueAsString(list);

		try {
			PrintWriter out = response.getWriter();
			out.println(jsonList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
