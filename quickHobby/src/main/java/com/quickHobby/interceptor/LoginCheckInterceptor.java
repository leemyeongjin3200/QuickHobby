package com.quickHobby.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
* @name : LoginCheckInterceptor
* @date : 2015. 7. 15.
* @author : 이명진
* @description : 요청이 Controller로 가기전에 적절한 제어를 하는 클래스
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	/**
	* @name : preHandle
	* @date : 2015. 7. 15.
	* @author : 이명진
	* @description : 요청 처리 전에 실행되는 메소드로 세션과 referer를 체크해 적절히 제어한다.
	 */
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
