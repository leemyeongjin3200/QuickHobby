package com.quickHobby.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest req){
		return "member/register";
	}
	
	@RequestMapping(value="/member/sendCode.do", method=RequestMethod.GET)
	public ModelAndView sendCode(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		memberService.sendCode(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public ModelAndView register(MultipartHttpServletRequest req, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
}
