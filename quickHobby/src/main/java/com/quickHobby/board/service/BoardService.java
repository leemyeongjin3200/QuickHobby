package com.quickHobby.board.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	public void boardList(ModelAndView mav);
	public void boardWrite(ModelAndView mav);
	public void boardRead(ModelAndView mav);
	public void boardDelete(ModelAndView mav);
	public void boardUpdate(ModelAndView mav);
}