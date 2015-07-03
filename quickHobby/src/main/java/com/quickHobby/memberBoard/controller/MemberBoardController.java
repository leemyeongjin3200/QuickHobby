package com.quickHobby.memberBoard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.memberBoard.service.JesusService;


/**
*@name : MemberBoardController
 *@date:2015. 7. 2.
*@author:염상아
*@description:jsp에서 get 방식으로 보낸  writer의 값들을 request로 받아서 ModelAndView에 담아 service로 보낸다.
 */
@Controller
public class MemberBoardController {
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private JesusService jesusService;
	
	@RequestMapping(value="/memberBoard/check.do", method=RequestMethod.GET)
	public ModelAndView check(HttpServletRequest request, HttpServletResponse response){
		logger.info("selfCheck-----------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		jesusService.boardWrite(mav);
		return mav;
		
		
	}
	
	
	

}
