package com.quickHobby.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler){
		try{
			if(req.getSession().getAttribute("member") == null){
				System.out.println("servlet path:" + req.getServletPath());
				System.out.println("context path:" + req.getContextPath());
				System.out.println("request uri:" + req.getRequestURI());
				System.out.println("request url:" + req.getRequestURL());
				// res.sendRedirect("/quickHobby/loginModal.jsp?abc=/quickHobby/main_hyeran.jsp");
				// System.out.println(req.getAttribute("abc"));
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
}
