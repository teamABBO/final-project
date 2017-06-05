package com.kosta.abbo.event.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.domain.PageMaker;
import com.kosta.abbo.event.domain.SearchCriteria;
import com.kosta.abbo.event.sevice.EventService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	private Logger logger = Logger.getLogger(EventController.class);
	
	@Inject
	private EventService service;
	
	@Resource(name = "uploadPath")
	   private String uploadPath;
	
	/** 등록 */
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet()throws Exception{
		logger.info("upload get............................................");
		
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String uploadPost(Event event, RedirectAttributes rttr, MultipartFile file,Model model)throws Exception{
		logger.info("upload post..........................................");
		logger.info(event.toString());
		
	      logger.info("originalName: " + file.getOriginalFilename());
	      logger.info("size : " + file.getSize());
	      logger.info("contentType : " + file.getContentType());
	      
	      String savedName = uploadFile(file.getOriginalFilename(),file.getBytes());
		
		service.create(event);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/event/list";
	}
	
	/** 첨부파일 */
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
	      
	      String savedName = originalName;
	      File target = new File(uploadPath,savedName);
	      FileCopyUtils.copy(fileData, target);
	      
	      return savedName;
	   }
	
	/** 목록 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		logger.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	/** 상세 */
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public void detail(@RequestParam("eventId") int eventId, Model model)throws Exception{
		model.addAttribute(service.read(eventId));
	}
	
	/** 수정 */
	@RequestMapping(value ="/modify", method = RequestMethod.GET )
	public void modifyGET(int eventId, Model model) throws Exception{
		model.addAttribute(service.read(eventId));
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST )
	public String modifyPOST(Event event, RedirectAttributes rttr) throws Exception{
		logger.info("mod post!!!");
		service.update(event);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/event/list";
		
	}
	


}