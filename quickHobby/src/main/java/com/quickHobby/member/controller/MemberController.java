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

/**
* @name : MemberController
* @date : 2015. 6. 22.
* @author : 이명진
* @description : Browser에서 들어오는 URL에 따라 jsp페이지를 응답하는 클래스 
 */
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	/**
	* @name : main
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 메인이동 요청 url이 들어오면 memberMain페이지로 응답
	 */
	@RequestMapping(value="/memberMain.do", method=RequestMethod.GET)
	public String main(HttpServletRequest req){
		return "memberMain";
	}
	
	/**
	* @name : register
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원가입 페이지 요청이 들어오면 회원가입페이지로 응답 
	 */
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String register(HttpServletRequest req){
		return "member/register";
	}
	
	/**
	* @name : register
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원가입 폼 작성후 작성완료 요청에 따라 회원가입 작업을 하는 메소드
	 */
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public ModelAndView register(MultipartHttpServletRequest req, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		mav.addObject("memberDto", memberDto);		
		memberService.registerOk(mav);
		
		return mav;
	}
	
	/**
	* @name : sendCode
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원가입 시 이메일 인증 요청이 들어오면 응답하는 메소드, service클래스를 통해 사용자의 이메일로 인증번호를 보낸다.
	 */
	@RequestMapping(value="/member/sendCode.do", method=RequestMethod.GET)
	public ModelAndView sendCode(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		memberService.sendCode(mav);
		
		return mav;
	}
	
	/**
	* @name : login
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 로그인요청 들어올 때 로그인 화면으로 응답하는 메소드
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest req){
		return "member/login";
	}
	
	/**
	* @name : login
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 로그인화면에서 이메일, 비밀번호 입력 후 완료요청 시 service클래스를 통해 로그인처리하는 메소드
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		memberService.loginOk(mav);
		
		return mav;
	}
	
	/**
	* @name : update
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원정보수정 페이지 요청시 정보수정페이지 응답하는 메소드
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", req);
		
		memberService.update(mav);
		
		return mav;
	}
	
	/**
	* @name : update
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원정보수정 후 완료 요청시 service클래스를 통해 수정작업완료하는 메소드
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public ModelAndView update(MultipartHttpServletRequest req, MemberDto member){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		mav.addObject("member", member);
		memberService.updateOk(mav);
		
		return mav;
	}
	
	/**
	* @name : logout
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 로그아웃 요청에 따라 로그아웃처리하는 메소드
	 */
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest req){
		req.getSession().invalidate();
		
		return "memberMain";
	}
}