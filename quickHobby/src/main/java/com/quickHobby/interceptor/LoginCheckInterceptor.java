package com.quickHobby.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse res, Object handler){
		try{
			if(request.getSession().getAttribute("member") == null){
				res.sendRedirect("/quickHobby/member/login.do");
				
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
}
