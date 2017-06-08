package com.kosta.abbo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kosta.abbo.user.domain.NormalUser;

public class EventCheckInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = Logger.getLogger(AuthInterceptor.class);

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}

		if (req.getMethod().equals("GET")) {
			logger.info("dest:" + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			logger.info("current user is not logined");

			saveDest(request);
			response.sendRedirect("/user/login");
			return false;
		} else {
			NormalUser loginUser = (NormalUser) session.getAttribute("login");
			if (!loginUser.getType().equals("event")) {
				logger.info("이벤트 유저가 아닙니다.");
				
				saveDest(request);
				response.sendRedirect("/fail");
				return false;
			}
		}
		return true;
	}

}