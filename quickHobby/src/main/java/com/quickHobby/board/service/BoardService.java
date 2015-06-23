package com.quickHobby.board.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {

	void boardList(ModelAndView mav);

	void boardWriteForm(ModelAndView mav);

	void boardWrite(ModelAndView mav);

	void boardRead(ModelAndView mav);

	void boardDelete(ModelAndView mav);

	void boardUpdateForm(ModelAndView mav);

	void boardUpdate(ModelAndView mav);

}
