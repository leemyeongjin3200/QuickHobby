package com.quickHobby.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler){
		try{
			if(req.getSession().getAttribute("member") == null){
				String reqUrl=req.getHeader("referer");
				if(reqUrl!=null){
					if(reqUrl.contains("?loginCheck")){
						String[] temp=reqUrl.split("\\?");
						reqUrl=temp[0];
						reqUrl+="?loginCheck=1";
						res.sendRedirect(reqUrl);
					}else if(reqUrl.contains("&loginCheck")){
						String[] temp=reqUrl.split("$loginCheck");
						reqUrl=temp[0];
						reqUrl+="&loginCheck=1";
						res.sendRedirect(reqUrl);
					}else{
						if(reqUrl.contains("?")){
							reqUrl+="&loginCheck=1";
							res.sendRedirect(reqUrl);
						}else{
							reqUrl+="?loginCheck=1";
							res.sendRedirect(reqUrl);
						}
					}
					return false;	
				}else{
					res.sendRedirect("/quickHobby?loginCheck=1");
					return false;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
}
