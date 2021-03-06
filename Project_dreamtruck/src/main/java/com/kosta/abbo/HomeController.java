package com.kosta.abbo;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.abbo.plan.service.PlanService;
import com.kosta.abbo.util.MediaUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private PlanService planservice;
	@Resource(name = "uploadPath")
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("메인 페이지");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/fail", method = RequestMethod.GET)
	public String fail(Model model) {
		logger.info("잘못된 유저 타입");
		return "fail";
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("화면에 파일 출력 : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			headers.setContentType(mType);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public void map(Model model) throws Exception {
		logger.info("트럭지도 페이지");
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonlist = objectMapper.writeValueAsString(planservice.truck());
		model.addAttribute("list", jsonlist);
	}

	/** 이용안내 */
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void info() throws Exception {
		logger.info("이용안내 페이지");

	}

	@RequestMapping(value = "/introduction", method = RequestMethod.GET)
	public void introduction() throws Exception {
		logger.info("회사소개 페이지");

	}

}
