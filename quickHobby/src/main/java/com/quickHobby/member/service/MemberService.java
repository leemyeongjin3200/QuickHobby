package com.quickHobby.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void registerOk(ModelAndView mav);
	public void sendCode(ModelAndView mav);
	public void loginOk(ModelAndView mav);
}
