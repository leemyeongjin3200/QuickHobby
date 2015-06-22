package com.quickHobby.board.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {

	void boardList(ModelAndView mav);

	void boardWriteForm(ModelAndView mav);

}
