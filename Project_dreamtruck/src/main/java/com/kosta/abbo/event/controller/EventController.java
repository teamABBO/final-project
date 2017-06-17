package com.kosta.abbo.event.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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

import com.kosta.abbo.applier.domain.Applier;
import com.kosta.abbo.applier.service.ApplierService;
import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.domain.PageMaker;
import com.kosta.abbo.event.domain.SearchCriteria;
import com.kosta.abbo.event.sevice.EventService;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.user.domain.TruckUser;
import com.kosta.abbo.user.service.NormalUserService;
import com.kosta.abbo.user.service.TruckUserService;
import com.kosta.abbo.util.UploadEventUtils;

@Controller
@RequestMapping("/event/*")
public class EventController {

	private Logger logger = Logger.getLogger(EventController.class);

	@Inject
	private EventService service;
	
	@Inject
	private ApplierService applierService;
	
	@Inject
	private NormalUserService userService;

	@Inject
	private TruckUserService truckService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/** 등록 */
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet() throws Exception {
		logger.info("upload get............................................");

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadPost(Event event, RedirectAttributes rttr, MultipartFile file, Model model,
			HttpServletRequest request, int userId) throws Exception {
		logger.info("upload post..........................................");
		logger.info(event.toString());

		if (file.getOriginalFilename().equals(null) || file.getOriginalFilename().length() == 0) {
			service.create(event);
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/event/list";
		} else {
			logger.info("originalName: " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			logger.info("contentType : " + file.getContentType());

			UUID uid = UUID.randomUUID();
			String imgName = uid.toString() + "_" + file.getOriginalFilename();
			String imgPath = "/" + userId + "/" + imgName;

			event.setImg(imgPath);

			service.create(event);

			String path = uploadPath + "/event";
			UploadEventUtils.uploadFile(path, userId, imgName, file.getBytes());

			rttr.addFlashAttribute("msg", "success");
			return "redirect:/event/list";
		}
	}

	/** 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

	/** 상세 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(@RequestParam("eventId") int eventId, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(eventId));
	}

	/** 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("eventId") int eventId, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(eventId));
	}
	

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Event event, SearchCriteria cri, RedirectAttributes rttr, MultipartFile file, Model model,
			HttpServletRequest request, int userId) throws Exception {
		logger.info("mod post!!!");

		if (file.getOriginalFilename().equals(null) || file.getOriginalFilename().length() == 0) {
			service.update(event);
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/event/list";
		} else {
			logger.info("originalName: " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			logger.info("contentType : " + file.getContentType());
			Event findEvent = service.read(event.getEventId());
			if (findEvent.getImg() != null) {
				String[] parse = findEvent.getImg().split("/");
				String sumnail = "s_"+parse[2];
				new File("C:/dt/event" + findEvent.getImg()).delete();
				new File("C:/dt/event/" + userId + "/" + sumnail).delete();
			} 
			UUID uid = UUID.randomUUID();
			String imgName = uid.toString() + "_" + file.getOriginalFilename();
			String imgPath = "/" + userId + "/" + imgName;

			event.setImg(imgPath);

			service.update(event);

			String path = uploadPath + "/event";
			UploadEventUtils.uploadFile(path, userId, imgName, file.getBytes());

			rttr.addFlashAttribute("page", cri.getPage());
			rttr.addFlashAttribute("perPageNum", cri.getPerPageNum());
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/event/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum();
		}
	}
	
	
	/**
	 * 행사 신청
	 * @param session
	 * @param eventId
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public ResponseEntity<String> eventApply(HttpSession session, int eventId) throws Exception {
		logger.info("행사신청서 등록");
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		
		userService.checkDocu(loginUser.getUserId());
		TruckUser user = truckService.read(loginUser.getUserId());
		
		String isUpload = userService.isUpload(user.getUserId());
		if (applierService.checkDup(user.getUserId(), eventId) > 0) {
			logger.info("중복 신청");
			return new ResponseEntity<String>("dup", HttpStatus.BAD_REQUEST);
		}

		if (isUpload.equals("x")) {
			logger.info("파일 수 부족!");
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		Applier applier = new Applier();
		applier.setEventId(eventId);
		applier.setUserId(user.getUserId()); 
		
		applierService.create(applier);
		applierService.upCnt(eventId);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	

}
