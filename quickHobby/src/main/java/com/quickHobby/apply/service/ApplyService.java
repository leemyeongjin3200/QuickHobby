package com.quickHobby.apply.service;

import org.springframework.web.servlet.ModelAndView;

/*
 * @name        : ApplyService
 * @date        : 2015. 6. 22.
 * @author      : º≠¿Œ±∏
 * @description : 
 */
public interface ApplyService {
	public void applyWrite(ModelAndView mav);
	public void applyWriteOk(ModelAndView mav);
	public void applyList(ModelAndView mav);
}
