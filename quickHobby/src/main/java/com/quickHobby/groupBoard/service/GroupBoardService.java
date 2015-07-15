package com.quickHobby.groupBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface GroupBoardService {

	void groupBoardList(ModelAndView mav);

	void groupBoardWriteForm(ModelAndView mav);

	void groupBoardWrite(ModelAndView mav);

	void groupBoardRead(ModelAndView mav);

	void groupBoardDelete(ModelAndView mav);

	void groupBoardUpdateForm(ModelAndView mav);

	void groupBoardUpdate(ModelAndView mav);
	
	void groupPage(ModelAndView mav);
}
