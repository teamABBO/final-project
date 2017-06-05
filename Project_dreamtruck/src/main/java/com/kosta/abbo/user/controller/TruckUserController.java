package com.kosta.abbo.user.controller;


import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

import com.kosta.abbo.HomeController;
import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.PageMaker;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.TruckUser;
import com.kosta.abbo.user.service.TruckUserService;
import com.kosta.abbo.util.UploadUserUtils;



@Controller
@RequestMapping("/truck")
public class TruckUserController {
	@Inject
	private TruckUserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	/*@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info(".....show truck list ");
		model.addAttribute("list", service.list());
	}

	*/
	@RequestMapping(value = "/truckRegister", method = RequestMethod.GET)
	public void truckRegistGET(@ModelAttribute("dto") LoginDTO dto){
	      logger.info("트럭 회원가입 GET .....");      
	}
	   
	@RequestMapping(value = "/truckRegister", method = RequestMethod.POST)
	   public String truckRegistPOST(@RequestParam("id") String id, TruckUser truckUser, RedirectAttributes rttr, MultipartFile file, Model model, HttpServletRequest request) throws Exception{
	      logger.info("트럭 회원가입 POST .....");
	      
	      logger.info("originalName: " + file.getOriginalFilename());
	      logger.info("size : " + file.getSize());
	      logger.info("contentType : " + file.getContentType());
	      String path = request.getServletContext().getRealPath("/resources/images/upload");

	      String savedName = UploadUserUtils.uploadFile(id, path, file.getOriginalFilename(), file.getBytes());
	            
	      service.create(truckUser);

	      model.addAttribute("savedName",savedName);
	      model.addAttribute("truckUser",truckUser);
	      logger.info(truckUser.toString());
	      
	      rttr.addFlashAttribute("msg","success");
	      
//	      return "user/success";
	      return "redirect:/user/success";
	   }
		
	/**
	 * 페이징처리
	 * @param cri
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info(".... show list Page with Criteria");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
	}

	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void read(@RequestParam("userId") int userId,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(userId+"**** ");
		model.addAttribute(service.read(userId));
	}
	
	
	
}
