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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.dto.LoginDTO;
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
	private NormalUserService normalService;
	
	@Inject
	private TruckUserService truckService;
	
	@Inject
	private PlanService planService;

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping("/ismember")
	   public void ismember(HttpServletResponse response, LoginDTO dto, HttpSession session, Model model) {
		
		NormalUser normalUser = normalService.login(dto);
		if(normalUser == null){
			model.addAttribute("msg","success");
			return;
		}
		
		/*normalService.checkDocu(normalUser.getUserId());*/
		model.addAttribute("normalUser",normalUser);
		
		
	      // System.out.println(request.getParameter("test"));
	      response.setContentType("text/html; charset=utf-8");

	      try {
	         PrintWriter out = response.getWriter();
	         out.println(normalUser.getType());
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }

	   }


	@RequestMapping("/normaljoinus")
	public void normalJoinUs(HttpServletResponse response, NormalUser normalUser, RedirectAttributes rttr, Model model){
		response.setContentType("text/html; charset=utf-8");
		
		
		normalService.create(normalUser);
		
		model.addAttribute("normalUser",normalUser);
		rttr.addFlashAttribute("msg","success");
		
		// 선호구역 숫자화
				
		
		try {
			PrintWriter out = response.getWriter();
			out.println("OK");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/truckjoinus")
	public void truckJoinUs(HttpServletRequest request, HttpServletResponse response,@RequestParam("id") String id, TruckUser truckUser, RedirectAttributes rttr, Model model)
	throws Exception{
		response.setContentType("text/html; charset=utf-8");
		
		
		logger.info("트럭 회원가입 POST .....");
		
		logger.info(truckUser.toString());

				
		truckUser.setTruckImg("/noimage.png");
		truckService.create(truckUser);

		model.addAttribute("truckUser",truckUser);
		logger.info(truckUser.toString());
		
		rttr.addFlashAttribute("msg","success");
		
		
		
		try {
			PrintWriter out = response.getWriter();
			out.println("OK");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/firebaseTest")
	public String firebase(){
		return "/FfirebaseTest";
	}
	
	
	@RequestMapping("/mapMarker")
	public void mapMarker(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("37.481227,126.886211,준서네 군만두");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping("/mapmarkerlist")
	public void mapMarkerList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		List<Plan> list = planService.truck();
		
		String jsonList = objectMapper.writeValueAsString(list);
		
		try {
			PrintWriter out = response.getWriter();
			out.println(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	

}
