package com.quickHobby.apply.service;

import org.springframework.web.servlet.ModelAndView;

public interface ApplyService {
	public void applyWrite(ModelAndView mav);
	public void applyWriteOk(ModelAndView mav);
	public void applyList(ModelAndView mav);
	public void applyRead(ModelAndView mav);
	public void applyDelete(ModelAndView mav);
	public void applyUpdate(ModelAndView mav);
	public void applyUpdateOk(ModelAndView mav);
	public void applyOk(ModelAndView mav);
	public void main(ModelAndView mav);
	public void incrementRecommend(ModelAndView mav);
	public void decrementRecommend(ModelAndView mav);
	public void report(ModelAndView mav);
}
