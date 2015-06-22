package com.quickHobby.apply.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.apply.service.ApplyService;

@Controller
public class ApplyController {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyService applyService;
	
	@RequestMapping(value="/apply/applyWrite.do", method=RequestMethod.POST)
	public ModelAndView applyWrite(HttpServletRequest request){
		logger.info("applyWrite======");
		
		ModelAndView mav=new ModelAndView();
		
		applyService.applyWrite(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/apply/applyWriteOk.do", method=RequestMethod.POST)
	public ModelAndView applyWriteOk(MultipartHttpServletRequest request, ApplyDto applyDto){
		logger.info("applyWriteOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("applyDto", applyDto);
		
		applyService.applyWriteOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/apply/applyList.do", method=RequestMethod.GET)
	public ModelAndView applyList(HttpServletRequest request){
		logger.info("applyList======");
		
		ModelAndView mav=new ModelAndView();
		
		applyService.applyList(mav);
		
		return mav;
	}
}
