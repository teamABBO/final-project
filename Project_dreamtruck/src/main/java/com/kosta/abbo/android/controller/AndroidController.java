package com.kosta.abbo.android.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.abbo.android.httpdata.UserDAO;

@Controller
@RequestMapping("/android")
public class AndroidController {

	@RequestMapping("/test")
	public void androidTest(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("qweqweqwe");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("/test2")
	public void androidTestwithRequest(HttpServletRequest request) {
		System.out.println(request.getParameter("test"));
	}

	@RequestMapping("/test3")
	public void androidTest(HttpServletRequest request) {
		// System.out.println(request.getParameter("test"));
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
	}

	@RequestMapping("/ismember")
	public void ismember(HttpServletRequest request, HttpServletResponse response) {
		// System.out.println(request.getParameter("test"));
		response.setContentType("text/html; charset=utf-8");

		System.out.println("입력한 아이디 : " + request.getParameter("id"));
		System.out.println("입력한 비밀번호 : " + request.getParameter("pw"));
		UserDAO dao = new UserDAO();
		String type = dao.ismember(request.getParameter("id"), request.getParameter("pw"));

		try {
			PrintWriter out = response.getWriter();
			out.println(type);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("/normaljoinus")
	public void normalJoinUs(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8");
		System.out.println("입력한 아이디 : " + request.getParameter("id")); 
		System.out.println("입력한 비밀번호 : " + request.getParameter("pw")); 
		System.out.println("입력한 이름 : " + request.getParameter("name")); 
		System.out.println("입력한 폰번호 : " + request.getParameter("phone")); 
		System.out.println("입력한 스피너 : " + request.getParameter("like"));
		
		int like_area = 0;
		
		if (request.getParameter("like").equals("강남구")) {
			like_area = 1;
		} else if (request.getParameter("like").equals("강동구")) {
			like_area = 2;
		} else if (request.getParameter("like").equals("강북구")) {
			like_area = 3;
		} else if (request.getParameter("like").equals("강서구")) {
			like_area = 4;
		} else if (request.getParameter("like").equals("관악구")) {
			like_area = 5;
		} else if (request.getParameter("like").equals("광진구")) {
			like_area = 6;
		} else if (request.getParameter("like").equals("구로구")) {
			like_area = 7;
		} else if (request.getParameter("like").equals("금천구")) {
			like_area = 8;
		} else if (request.getParameter("like").equals("노원구")) {
			like_area = 9;
		} else if (request.getParameter("like").equals("도봉구")) {
			like_area = 10;
		} else if (request.getParameter("like").equals("동대문구")) {
			like_area = 11;
		} else if (request.getParameter("like").equals("동작구")) {
			like_area = 12;
		} else if (request.getParameter("like").equals("마포구")) {
			like_area = 13;
		} else if (request.getParameter("like").equals("서대문구")) {
			like_area = 14;
		} else if (request.getParameter("like").equals("서초구")) {
			like_area = 15;
		} else if (request.getParameter("like").equals("성동구")) {
			like_area = 16;
		} else if (request.getParameter("like").equals("성북구")) {
			like_area = 17;
		} else if (request.getParameter("like").equals("송파구")) {
			like_area = 18;
		} else if (request.getParameter("like").equals("양천구")) {
			like_area = 19;
		} else if (request.getParameter("like").equals("영등포구")) {
			like_area = 20;
		} else if (request.getParameter("like").equals("용산구")) {
			like_area = 21;
		} else if (request.getParameter("like").equals("은평구")) {
			like_area = 22;
		} else if (request.getParameter("like").equals("종로구")) {
			like_area = 23;
		} else if (request.getParameter("like").equals("중구")) {
			like_area = 24;
		} else if (request.getParameter("like").equals("중랑구")) {
			like_area = 25;
		}
		System.out.println("스피너 정규화 : " + like_area);
		
		//핸드폰번호 스트링타입으로오는거 인트로 변환
		String phoneString = request.getParameter("phone");
		int phoneInt = Integer.parseInt(phoneString);
		
		UserDAO dao = new UserDAO();
		String joinus = dao.normalJoinUs(request.getParameter("id"),
						request.getParameter("pw"), 
						request.getParameter("name"), 
						phoneInt, 
						like_area);
		
		// 선호구역 숫자화
				
		
		try {
			PrintWriter out = response.getWriter();
			out.println(joinus);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
