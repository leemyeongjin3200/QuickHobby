package com.quickHobby.apply.service;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.apply.dao.ApplyDao;

@Component
public class ApplyServiceImpl implements ApplyService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyDao applyDao;
	
	public void applyWrite(ModelAndView mav){
		logger.info("applyWrite service======");
		
		mav.addObject("name", "º≠¿Œ±∏");
		
		mav.setViewName("apply/applyWrite");
	}
}
