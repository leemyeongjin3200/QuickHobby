package com.quickHobby.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping(value="/memberMain.do", method=RequestMethod.GET)public String main(HttpServletRequest req){
		return "memberMain";
	}
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest req){
		return "member/register";
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public ModelAndView register(MultipartHttpServletRequest req, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", req);
		mav.addObject("memberDto", memberDto);
		
		memberService.registerOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/sendCode.do", method=RequestMethod.GET)
	public ModelAndView sendCode(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		memberService.sendCode(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest req){
		return "member/login";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		memberService.loginOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest req){
		req.getSession().removeAttribute("member");
		
		return "memberMain";
	}
}
