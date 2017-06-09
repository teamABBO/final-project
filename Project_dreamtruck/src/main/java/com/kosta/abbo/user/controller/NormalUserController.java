package com.kosta.abbo.user.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.user.domain.EventUser;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.user.domain.TruckUser;
import com.kosta.abbo.user.service.EventUserService;
import com.kosta.abbo.user.service.NormalUserService;
import com.kosta.abbo.user.service.TruckUserService;
import com.kosta.abbo.util.UploadUserUtils;

@Controller
@RequestMapping("/user/*")
public class NormalUserController {
	
	@Inject
	private NormalUserService normalService;
	
	@Inject
	private TruckUserService truckService;
	
	@Inject
	private EventUserService eventService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 로그인 get
	 * @param dto
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("로그인 GET .....");
	}
	 
	/**
	 * 로그인 post
	 * @param dto
	 * @param session
	 * @param model
	 */
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model){
		logger.info("로그인 POST .....");
		
		NormalUser normalUser = normalService.login(dto);
		if(normalUser == null){
			model.addAttribute("msg","success");
			return;
		}
		/*normalService.checkDocu(normalUser.getUserId());*/
		model.addAttribute("normalUser",normalUser);
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Object obj = session.getAttribute("login");
		
		
		if(obj != null){
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
			
		}
		return "user/login";
	}
	
	/**
	 * 회원 종류
	 * @param dto
	 */
	@RequestMapping(value = "/registertype", method = RequestMethod.GET)
	public void registerType(@ModelAttribute("dto") LoginDTO dto){
		logger.info("회원 종류 GET .....");
	}
	
	@RequestMapping(value = "/normalRegister", method = RequestMethod.GET)
	public void registGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("회원가입 GET .....");
		
	}
	
	/**
	 * 회원 가입
	 * @param dto
	 */
	@RequestMapping(value = "/normalRegister", method = RequestMethod.POST)
	public String registPOST(NormalUser normalUser, RedirectAttributes rttr, Model model){
		logger.info("회원가입 POST .....");
		logger.info(normalUser.toString());
		
		normalService.create(normalUser);
		
		model.addAttribute("normalUser",normalUser);
		rttr.addFlashAttribute("msg","success");
		
//		return "/user/success";
		return "redirect:/user/success";
	}
	
	@RequestMapping(value = "/truckRegister", method = RequestMethod.GET)
	public void truckRegistGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("트럭 회원가입 GET .....");		
	}
	
	/**
	 * 트럭 유저 회원가입
	 * @param id
	 * @param truckUser
	 * @param rttr
	 * @param file
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/truckRegister", method = RequestMethod.POST)
	public String truckRegistPOST(@RequestParam("id") String id, TruckUser truckUser, RedirectAttributes rttr, MultipartFile file, Model model, HttpServletRequest request) throws Exception{
		logger.info("트럭 회원가입 POST .....");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		
		String path = uploadPath + "/user";

		String savedName = UploadUserUtils.uploadFile(id, path, file.getOriginalFilename(), file.getBytes());
				
		truckService.create(truckUser);

		model.addAttribute("savedName",savedName);
		model.addAttribute("truckUser",truckUser);
		logger.info(truckUser.toString());
		
		rttr.addFlashAttribute("msg","success");
		
//		return "user/success";
		return "redirect:/user/success";
	}
	
	@RequestMapping(value = "/eventRegister", method = RequestMethod.GET)
	public void EventRegistGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("이벤트 회원가입 GET .....");		
	}
	
	/**
	 * 이벤트 유저 회원가입
	 * @param eventUser
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/eventRegister", method = RequestMethod.POST)
	public String EventRegistPOST(EventUser eventUser, RedirectAttributes rttr){
		logger.info("이벤트 회원가입 POST .....");
		logger.info(eventUser.toString());
		
		eventService.create(eventUser);
		
		rttr.addFlashAttribute("msg","success");
		
//		return "/user/success";
		return "redirect:/user/success";
	}
	
	
	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public void success(@ModelAttribute("dto") LoginDTO dto){
		logger.info("회원가입완료 .....");
	}
	
	/**
	 * 마이페이지
	 * @param dto
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypageGET(NormalUser normalUser, Model model){
		logger.info("마이페이지 GET .....");
		
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public void mypagePOST(NormalUser normalUser, Model model){
		logger.info("마이페이지 GET .....");
	}
	
	/**
	 * 회원정보 수정
	 * @param dto
	 * @throws Exception 
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modify(@ModelAttribute("dto") LoginDTO dto,  Model model) throws Exception{
		logger.info("회원 정보 수정 GET .....");
		/*if(type == "truck"){
			model.addAttribute(truckService.read(userId));
		}*/
		
	}
	
	/**
	 * 회원 탈퇴
	 * @param dto
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("회원 탈퇴 GET .....");
	}
	
	/**
	 * 회원 탈퇴
	 * @param id
	 * @param pw
	 * @param rttr
	 * @param session
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(@RequestParam("id") String id, @RequestParam("pw") String pw, RedirectAttributes rttr, 
			HttpSession session,HttpServletResponse response,HttpServletRequest request, Model model){
		logger.info("회원 탈퇴 POST .....");
		
		normalService.delete(id,pw);
		model.addAttribute("msg","success");
		Object obj = session.getAttribute("login");
		
		
		if(obj != null){
			NormalUser normalUser = (NormalUser) obj;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
//				service.keepLogin()
			}
			
		}else if(obj == null){
			model.addAttribute("msg","fale");
			return "user/delete";
		}
		return "user/login";
	}
	
	/**
	 * 아이디비밀번호 찾기
	 * @param dto
	 */
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public void findGet(NormalUser normalUser, Model model){
		logger.info("아이디/비밀번호 GET .....");
	}
	
	
	
}

