package com.pretty.dog.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean pass = false;
		System.out.println("PreHandle 통과");
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginId") != null) {
			pass = true;
		}else {
			pass = false;
			response.sendRedirect("/dog/loginPage");
		}
		
		return pass;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		System.out.println("postHandle 통과");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		
		 
	}
	

	
	
	
}
