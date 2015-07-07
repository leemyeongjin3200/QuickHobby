package com.quickHobby.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void registerOk(ModelAndView mav);
	public void sendCode(ModelAndView mav);
	public void loginOk(ModelAndView mav);
	public void update(ModelAndView mav);
	public void updateOk(ModelAndView mav);
	public void checkNickname(ModelAndView mav);
	public void sendCodeFindPass(ModelAndView mav);
	public void findPassword(ModelAndView mav);
}
