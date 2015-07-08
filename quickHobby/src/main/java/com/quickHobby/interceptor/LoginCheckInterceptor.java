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
				
				PrintWriter out=res.getWriter();
				out.print("<script>");
				// out.print("alert('aaa')");
				// out.print("window.open('/quickHobby/loginModal.jsp', '', 'width=200 height=200')");
				out.print("window.open('http://www.naver.com', '', 'width=300, height=300')");
				// out.print("alert('aaa')");
				out.print("</script>");
				
				res.sendRedirect("/quickHobby/member/aaa.do?abc=/main_hyeran.jsp");
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
}
