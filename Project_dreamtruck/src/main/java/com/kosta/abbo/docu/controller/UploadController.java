package com.kosta.abbo.docu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.abbo.docu.domain.Docu;
import com.kosta.abbo.util.UploadDocuUtils;

@Controller
public class UploadController {
	Logger logger = Logger.getLogger(UploadController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		logger.info("get방식 업로드 폼");
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Docu docu, Model model) throws IOException {
		logger.info("post 방식 업로드 폼");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentTpye : " + file.getContentType());

		uploadPath += "/docu";
		String savedName = UploadDocuUtils.uploadFile(docu.getUserId(), uploadPath, file.getOriginalFilename(), file.getBytes());
		
		docu.setPath("/docu/" + docu.getUserId() + "/" + file.getOriginalFilename());
		
		logger.info("docu 정보 : " + docu);
		
		model.addAttribute("savedName", savedName);

		return "redirect: docu/docu";
	}

	@ResponseBody
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(String fileName) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("파일 다운로드");
		logger.info("FILE NAME : " + fileName);

		try {
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

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
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int docuId) {
		logger.info("파일 삭제");
		logger.info("delete file : " + fileName);
		logger.info("docu_id :" + docuId);
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		logger.info("삭제 경로 : " + uploadPath + fileName);
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
}
