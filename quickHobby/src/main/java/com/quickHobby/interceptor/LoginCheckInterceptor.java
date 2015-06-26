package com.quickHobby.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler){
		try{
			if(req.getSession().getAttribute("member") == null){
				res.sendRedirect("login.do");
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
}
