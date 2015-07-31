package com.quickHobby.groupBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface GroupBoardService {
	public void groupBoardWrite(ModelAndView mav);
	public void groupBoardRead(ModelAndView mav);
	public void groupBoardDelete(ModelAndView mav);
	public void groupBoardUpdateForm(ModelAndView mav);
	public void groupBoardUpdate(ModelAndView mav);
	public void groupPage(ModelAndView mav);
}
