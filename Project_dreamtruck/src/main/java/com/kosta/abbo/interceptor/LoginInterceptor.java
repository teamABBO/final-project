package com.kosta.abbo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	private static final Logger logger = Logger.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object normalUser = modelMap.get("normalUser");
		if (normalUser != null) {
			logger.info("로그인 성공");
			session.setAttribute(LOGIN, normalUser);
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String) dest : "/");
		} else if (normalUser == null) {
			logger.info("회원가입된 회원이 아닙니다.");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if (session.getAttribute(LOGIN) != null) {
			logger.info("로그인 기록 삭제");
			session.removeAttribute(LOGIN);
		}
		return true;
	}

}
