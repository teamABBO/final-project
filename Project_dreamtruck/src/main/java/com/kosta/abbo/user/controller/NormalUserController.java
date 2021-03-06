package com.kosta.abbo.user.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * 로그인
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("로그인 페이지");
	}

	/**
	 * 로그인 post
	 * 
	 * @param dto
	 * @param session
	 * @param model
	 */
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) {
		logger.info("로그인");

		NormalUser normalUser = normalService.login(dto);
		if (normalUser == null) {
			model.addAttribute("msg", "success");
			return;
		}
		model.addAttribute("normalUser", normalUser);
	}

	/**
	 * 로그아웃
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("로그아웃");
		Object obj = session.getAttribute("login");

		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}

		}
		return "user/login";
	}

	/**
	 * 회원 종류
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/registertype", method = RequestMethod.GET)
	public void registerType(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("회원 종류 페이지");
	}

	@RequestMapping(value = "/normalRegister", method = RequestMethod.GET)
	public void registGET(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("일반회원 회원가입 페이지");

	}

	/**
	 * 회원 가입
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/normalRegister", method = RequestMethod.POST)
	public String registPOST(NormalUser normalUser, RedirectAttributes rttr, Model model) {
		logger.info("일반회원 회원가입");

		normalService.create(normalUser);

		model.addAttribute("normalUser", normalUser);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/user/success";
	}

	@RequestMapping(value = "/truckRegister", method = RequestMethod.GET)
	public void truckRegistGET(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("트럭회원 회원가입 페이지");
	}

	/**
	 * 트럭 유저 회원가입
	 * 
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
	public String truckRegistPOST(@RequestParam("id") String id, TruckUser truckUser, RedirectAttributes rttr,
			MultipartFile file, Model model, HttpServletRequest request) throws Exception {
		logger.info("트럭 회원가입");
		logger.info("---------------------파일 업로드------------------------");
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		logger.info("--------------------------------------------------------");
		String path = uploadPath + "/user";

		if (!file.getOriginalFilename().equals("") || file.getOriginalFilename().length() != 0) {
			UploadUserUtils.uploadFile(id, path, file.getOriginalFilename(), file.getBytes());
		}

		truckService.create(truckUser);

		model.addAttribute("truckUser", truckUser);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/user/success";
	}

	@RequestMapping(value = "/eventRegister", method = RequestMethod.GET)
	public void EventRegistGET(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("이벤트 회원가입 페이지");
	}

	/**
	 * 이벤트 유저 회원가입
	 * 
	 * @param eventUser
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/eventRegister", method = RequestMethod.POST)
	public String EventRegistPOST(EventUser eventUser, RedirectAttributes rttr) {
		logger.info("이벤트 회원가입");

		eventService.create(eventUser);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/user/success";
	}

	/**
	 * 회원가입완료
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public void success(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("회원가입완료 페이지");
	}

	/**
	 * 마이페이지
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypageGET(NormalUser normalUser, Model model) {
		logger.info("마이페이지 페이지");
	}

	/**
	 * 회원정보 수정 페이지
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(Model model, HttpSession session) throws Exception {
		logger.info("회원 정보 수정 페이지");
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		if (loginUser.getType().equals("normal")) {
			model.addAttribute("normal", normalService.read(loginUser.getUserId()));
		} else if (loginUser.getType().equals("event")) {
			model.addAttribute("event", eventService.read(loginUser.getUserId()));
		} else if (loginUser.getType().equals("truck")) {
			model.addAttribute("truck", truckService.read(loginUser.getUserId()));
		}

	}

	/**
	 * 회원정보 수정
	 * 
	 * @param model
	 * @param file
	 * @param type
	 * @param normalUser
	 * @param eventUser
	 * @param truckUser
	 * @param rttr
	 * @param session
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Model model, MultipartFile file, @RequestParam("type") String type, NormalUser normalUser,
			EventUser eventUser, TruckUser truckUser, RedirectAttributes rttr, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		logger.info("회원 정보 수정");
		if (type.equals("normal")) {
			normalService.update(normalUser);
		} else if (type.equals("event")) {
			eventService.update(eventUser);
		} else if (type.equals("truck")) {
			logger.info("---------------------파일 업로드------------------------");
			logger.info("originalName: " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			logger.info("contentType : " + file.getContentType());
			logger.info("--------------------------------------------------------");

			String path = uploadPath + "/user";
			normalUser = (NormalUser) session.getAttribute("login");
			String id = normalUser.getId();

			TruckUser findTruck = truckService.read(truckUser.getUserId());

			if (file.getSize() != 0) {
				String sumnail = "s_" + findTruck.getTruckImg();
				new File("C:/dt/user/" + id + "/" + findTruck.getTruckImg()).delete();
				new File("C:/dt/user/" + id + "/" + sumnail).delete();
				UploadUserUtils.uploadFile(id, path, file.getOriginalFilename(), file.getBytes());
				truckUser.setTruckImg(file.getOriginalFilename());
			}
			truckService.update(truckUser);
		}
		rttr.addFlashAttribute("modify", "modify");
		return "redirect:/user/mypage";
	}

	/**
	 * 회원 탈퇴 페이지
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteGET(@ModelAttribute("dto") LoginDTO dto) {
		logger.info("회원 탈퇴 페이지");
	}

	/**
	 * 회원 탈퇴
	 * 
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
			HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model) {
		logger.info("회원 탈퇴");

		normalService.delete(id, pw);
		model.addAttribute("msg", "success");
		Object obj = session.getAttribute("login");

		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}

		} else if (obj == null) {
			model.addAttribute("msg", "fale");
			return "user/delete";
		}
		return "user/login";
	}

	/**
	 * 아이디비밀번호 찾기 페이지
	 * 
	 * @param dto
	 */
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public void findGet(NormalUser normalUser, Model model) {
		logger.info("아이디/비밀번호 찾기 페이지");
	}

	/**
	 * 아이디 찾기
	 * 
	 * @param name
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<String> idCheckPOST(@RequestParam("name") String name, @RequestParam("phone") String phone) {
		logger.info("아이디 찾기");
		if (normalService.idCheck(name, phone) == null) {
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(normalService.idCheck(name, phone), HttpStatus.OK);
		}
	}

	/**
	 * 비밀번호 찾기
	 * 
	 * @param id
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public ResponseEntity<String> pwCheckPOST(@RequestParam("id") String id, @RequestParam("email") String email) {
		logger.info("비밀번호 찾기");
		if (normalService.pwCheck(id, email) == null) {
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(normalService.pwCheck(id, email), HttpStatus.OK);
		}
	}

	/**
	 * 회원 중복
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/isMember", method = RequestMethod.POST)
	public ResponseEntity<String> isMember(@RequestParam("id") String id) {
		logger.info("회원 중복 찾기");
		if (normalService.isMember(id) == null) {
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(normalService.isMember(id), HttpStatus.OK);
		}
	}
}
