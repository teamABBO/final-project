package com.kosta.abbo.docu.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.kosta.abbo.user.domain.TruckUser;
import com.kosta.abbo.user.service.NormalUserService;
import com.kosta.abbo.user.service.TruckUserService;
import com.kosta.abbo.util.UploadDocuUtils;

@Controller
@RequestMapping("/docu")
public class DocuController {
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Inject
	private DocuService service;

	@Inject
	private NormalUserService userService;

	@Inject
	private TruckUserService truckService;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * 서류 목록 처리
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String docu(Model model, HttpSession session) throws Exception {
		logger.info("서류관리 페이지");

		NormalUser user = (NormalUser) session.getAttribute("login");
		TruckUser loginUser = truckService.read(user.getUserId());

		ObjectMapper objectMapper = new ObjectMapper();

		List<Docu> docuList = service.list(loginUser.getUserId());

		String jsonList = objectMapper.writeValueAsString(docuList);

		model.addAttribute("docuList", jsonList);

		return "/docu/list";
	}

	/**
	 * 파일 업로드 처리
	 * 
	 * @param file
	 * @param docu
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Docu docu, Model model) throws IOException {

		logger.info("---------------------파일 업로드------------------------");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentTpye : " + file.getContentType());
		logger.info("--------------------------------------------------------");

		String originalName = file.getOriginalFilename();
		String formmatName = originalName.substring(originalName.lastIndexOf(".")).toLowerCase();

		docu.setPath("/" + docu.getUserId() + "/" + (docu.getDocuName() + formmatName));

		UploadDocuUtils.uploadFile(docu.getUserId(), uploadPath + "/docu", (docu.getDocuName() + formmatName),
				file.getBytes());

		service.create(docu);

		return "redirect: list";
	}

	/**
	 * 파일 수정 처리
	 * 
	 * @param file
	 * @param docu
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@Transactional
	@RequestMapping(value = "/modifyForm", method = RequestMethod.POST)
	public String modifyForm(MultipartFile file, Docu docu, Model model) throws IOException {
		logger.info("---------------------파일 수정------------------------");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentTpye : " + file.getContentType());
		logger.info("------------------------------------------------------");
		new File(uploadPath + "/docu" + docu.getPath().replace('/', File.separatorChar)).delete();

		String originalName = file.getOriginalFilename();
		String formmatName = originalName.substring(originalName.lastIndexOf(".")).toLowerCase();

		docu.setPath("/" + docu.getUserId() + "/" + (docu.getDocuName() + formmatName));

		UploadDocuUtils.uploadFile(docu.getUserId(), uploadPath + "/docu", (docu.getDocuName() + formmatName),
				file.getBytes());

		service.update(docu);

		return "redirect: list";
	}

	/**
	 * 파일 다운로드 처리
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(String fileName) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("파일 다운로드 : " + fileName);

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

	/**
	 * 파일 삭제 처리
	 * 
	 * @param fileName
	 * @param docuId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int docuId) {
		logger.info("---------------------파일 삭제------------------------");
		logger.info("delete file : " + fileName);
		logger.info("docu_id :" + docuId);
		logger.info("삭제 경로 : " + uploadPath + "/docu" + fileName);
		logger.info("------------------------------------------------------");
		new File(uploadPath + "/docu" + fileName.replace('/', File.separatorChar)).delete();

		service.delete(docuId);

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

	/**
	 * 영업신청서 제출 화면
	 * 
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String apply(Model model, HttpSession session) throws Exception {
		logger.info("영업신청서 제출 페이지");

		return "/docu/apply";
	}

	/**
	 * 관할구역 반환 처리
	 * 
	 * @param fileName
	 * @param docuId
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getLocation", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public ResponseEntity<String> getLocation(String latitude, String longitude) throws Exception {
		logger.info("관할구역 파싱처리");

		URL url = new URL("https://apis.daum.net/local/geo/coord2addr?apikey=28b3a5cf726ff24cbcf578f9c766696d&latitude="
				+ latitude + "&longitude=" + longitude);

		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);

		// 타입 설정
		connection.setRequestProperty("CONTENT-TYPE", "text/xml");

		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));

		in.readLine();
		String xml = in.readLine();

		int name1start = xml.indexOf("name1");
		int name2start = xml.indexOf("name2");

		String name1xml = xml.substring(name1start + 7);
		String name2xml = xml.substring(name2start + 7);

		int name1end = name1xml.indexOf("'");
		int name2end = name2xml.indexOf("'");

		String city = name1xml.substring(0, name1end);
		String gu = name2xml.substring(0, name2end);

		String message;

		if (!city.equals("서울특별시")) {
			message = "서비스 구역이 아닙니다.";
		} else {
			message = gu + "청";
		}

		return new ResponseEntity<String>(message, HttpStatus.OK);

	}

	/**
	 * 영업신청서 메일로 전송
	 * 
	 * @param model
	 * @param session
	 * @param location
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	@Transactional
	public ResponseEntity<String> send(Model model, HttpSession session, String location) throws Exception {
		logger.info("영업신청서 전송");

		NormalUser loginUser = (NormalUser) session.getAttribute("login");
		userService.checkDocu(loginUser.getUserId());

		TruckUser user = truckService.read(loginUser.getUserId());

		String isUpload = userService.isUpload(user.getUserId());

		if (isUpload.equals("x")) {
			logger.info("파일 수 부족!");
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}

		List<Docu> docuList = service.list(user.getUserId());

		String fromMail = "dreamtruck146@gmail.com";
		String toMail = "yeogirotour@gmail.com";
		String title = user.getName() + "님께서 " + location + "에 푸드트럭 영업신청을 하였습니다. -dreamtruck-";
		String content = user.getName() + "님의 푸드트럭 정보와 영업신청에 필요한 서류를 첨부합니다.<br>" + "성명 : " + user.getName()
				+ "<br>E-mail : " + user.getEmail() + "<br>휴대폰 : " + user.getPhone() + "<br>트럭 등록 번호 : "
				+ user.getTruckNum() + "<br>사업자번호 : " + user.getSid() + "<br>상호명 : " + user.getTruckName();

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

			messageHelper.setFrom(fromMail);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText("", content);

			for (Docu docu : docuList) {
				switch (docu.getDocuName()) {
				case "Deong":
					messageHelper.addAttachment("등본/초본", new File(uploadPath + "/docu" + docu.getPath()));
					break;
				case "License":
					messageHelper.addAttachment("운전면허증", new File(uploadPath + "/docu" + docu.getPath()));
					break;
				case "Youngup":
					messageHelper.addAttachment("영업신청서", new File(uploadPath + "/docu" + docu.getPath()));
					break;
				case "Saup":
					messageHelper.addAttachment("사업계획서", new File(uploadPath + "/docu" + docu.getPath()));
					break;
				default:
					break;
				}
			}
			logger.info("메일 전송 성공");
			mailSender.send(message);
		} catch (Exception e) {
			logger.warn(e.toString());
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	/**
	 * 서류 제출 성공화면
	 * 
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() throws Exception {
		logger.info("제출 성공 페이지");

		return "/docu/success";
	}

}
