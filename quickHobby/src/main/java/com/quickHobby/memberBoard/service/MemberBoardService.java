package com.quickHobby.memberBoard.service;

import org.springframework.web.servlet.ModelAndView;

/**
*@name : JesusService
 *@date:2015. 7. 2.
*@author:염상아
*@description: 
 */
public interface MemberBoardService {
	public void boardWrite(ModelAndView mav);
	public void load(ModelAndView mav) throws Throwable;
}
