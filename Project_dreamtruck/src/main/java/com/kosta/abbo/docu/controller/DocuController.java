package com.kosta.abbo.docu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.HomeController;
import com.kosta.abbo.docu.domain.Docu;
import com.kosta.abbo.docu.service.DocuService;
import com.kosta.abbo.user.domain.NormalUser;
import com.kosta.abbo.util.UploadDocuUtils;

@Controller
@RequestMapping("/docu")
public class DocuController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private DocuService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 서류 목록 처리
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String docu(Model model, HttpSession session) throws Exception {
		logger.info("서류관리 페이지");
		
		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		List<Docu> docuList = service.list(loginUser.getUserId());
		
		String jsonList = objectMapper.writeValueAsString(docuList);
		
		model.addAttribute("docuList", jsonList);
		
		return "/docu/list";
	}
	
	/**
	 * 파일 업로드 처리
	 * @param file
	 * @param docu
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Docu docu, Model model) throws IOException {
		logger.info("post 방식 업로드 폼");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentTpye : " + file.getContentType());
		
		String originalName = file.getOriginalFilename();
		String formmatName = originalName.substring(originalName.lastIndexOf(".")).toLowerCase();

		docu.setPath("/" + docu.getUserId() + "/" + (docu.getDocuName() + formmatName));

		UploadDocuUtils.uploadFile(docu.getUserId(), uploadPath + "/docu", (docu.getDocuName() + formmatName), file.getBytes());
		
		service.create(docu);
		
		logger.info("docu 정보 : " + docu);
		
		return "redirect: list";
	}
	
	/**
	 * 파일 수정 처리
	 * @param file
	 * @param docu
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@Transactional
	@RequestMapping(value = "/modifyForm", method = RequestMethod.POST)
	public String modifyForm(MultipartFile file, Docu docu, Model model) throws IOException {
		logger.info("post 방식 수정 폼");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentTpye : " + file.getContentType());
		 
		new File(uploadPath + "/docu" + docu.getPath().replace('/', File.separatorChar)).delete();
		
		String originalName = file.getOriginalFilename();
		String formmatName = originalName.substring(originalName.lastIndexOf(".")).toLowerCase();

		docu.setPath("/" + docu.getUserId() + "/" + (docu.getDocuName() + formmatName));

		UploadDocuUtils.uploadFile(docu.getUserId(), uploadPath + "/docu", (docu.getDocuName() + formmatName), file.getBytes());
		
		service.update(docu);
		
		logger.info("docu 정보 : " + docu);
		
		return "redirect: list";
	}
	
	/**
	 * 파일 다운로드 처리
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(String fileName) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("파일 다운로드");
		logger.info("FILE NAME : " + fileName);

		try {
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + "/docu" + fileName);

			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	/**
	 * 파일 삭제 처리
	 * @param fileName
	 * @param docuId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int docuId) {
		logger.info("파일 삭제");
		logger.info("delete file : " + fileName);
		logger.info("docu_id :" + docuId);
		
		new File(uploadPath + "/docu" + fileName.replace('/', File.separatorChar)).delete();
		
		service.delete(docuId);
		
		logger.info("삭제 경로 : " + uploadPath + "/docu" + fileName);
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
}
