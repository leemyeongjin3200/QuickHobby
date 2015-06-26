package com.quickHobby.group.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.group.dto.GroupDto;
import com.quickHobby.group.service.GroupService;

@Controller
public class GroupController {
private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value="/group/createForm.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createForm(HttpServletRequest request, HttpServletResponse response){
		logger.info("createForm---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		groupService.createForm(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/group/createGroup.do", method=RequestMethod.POST)
	public ModelAndView createGroup(MultipartHttpServletRequest request, GroupDto groupDto){
		logger.info("createGroup-------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("GroupDto",groupDto);
		groupService.createGroup(mav);
		
		return mav;
	}
}
