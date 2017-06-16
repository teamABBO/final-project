package com.kosta.abbo.applier.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.applier.domain.Applier;
import com.kosta.abbo.applier.service.ApplierService;
import com.kosta.abbo.docu.service.DocuService;
import com.kosta.abbo.event.sevice.EventService;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.TruckUser;
import com.kosta.abbo.user.domain.NormalUser;

@Controller
@RequestMapping("/applier")
public class ApplierController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private ApplierService service;
	
	@Inject
	private DocuService docuService;
	
	@Inject
	private EventService eventService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Transactional
	@RequestMapping(value = "/list/{eventId}", method = RequestMethod.GET)
	public String list(Model model, HttpSession session,@PathVariable("eventId") int eventId) throws Exception {
		logger.info("신청트럭 목록 화면");
		
		TruckUser loginUser = (TruckUser) session.getAttribute("login");
		
		int loginUserId = loginUser.getUserId();
		int eventUserId = eventService.read(eventId).getUserId();
		
		if (eventUserId != loginUserId) {
			return "/fail";
		} else {
			ObjectMapper objectMapper = new ObjectMapper();
	
			List<Applier> applierList = service.list(eventId);
	
			String jsonList = objectMapper.writeValueAsString(applierList);
			
			model.addAttribute("applierList", jsonList);
			logger.info(jsonList);
			return "/applier/list";
		}
	}
	
	@ResponseBody
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(int userId, String docuName) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = docuService.getPath(userId, docuName);
		
		logger.info("파일 다운로드");
		logger.info("FILE NAME : " + fileName);

		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + "/docu" + fileName);

			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition",
					"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/confirm")
	public ResponseEntity<String> confirm(int applierId) throws IOException {
		logger.info("행사 신청 수락");
		service.confirm(applierId);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/deny")
	public ResponseEntity<String> deny(int applierId) throws IOException {
		logger.info("행사 신청 거절");
		service.deny(applierId);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/checkConfirm")
	public ResponseEntity<String> chekcConfirm(String confirmList) throws IOException {
		logger.info("행사 신청 수락");
		confirmList = confirmList.substring(0, confirmList.length()-1);
		String[] list = confirmList.split("-");
		
		for (String applierId : list) {
			service.confirm(Integer.parseInt(applierId));
		}
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/checkDeny")
	public ResponseEntity<String> chekcDeny(String denyList) throws IOException {
		logger.info("행사 신청 수락");
		denyList = denyList.substring(0, denyList.length()-1);
		String[] list = denyList.split("-");
		
		for (String applierId : list) {
			service.deny(Integer.parseInt(applierId));
		}
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Model model, HttpSession session) throws Exception {
		logger.info("신청 행사 목록 화면");
		
		TruckUser loginUser = (TruckUser) session.getAttribute("login");
		
		int loginUserId = loginUser.getUserId();
		
		ObjectMapper objectMapper = new ObjectMapper();

		List<Map<String, Object>> eventList = service.myEvent(loginUserId);

		String jsonList = objectMapper.writeValueAsString(eventList);
		logger.info(jsonList);
		model.addAttribute("eventList", jsonList);

		return "/applier/event";
	}
	
}
