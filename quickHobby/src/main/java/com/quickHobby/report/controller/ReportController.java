package com.quickHobby.report.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.report.service.ReportService;

@Controller
public class ReportController {
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/report/reportList.do", method=RequestMethod.GET)
	public ModelAndView reportList(HttpServletRequest request){
		logger.info("reportList======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		reportService.reportList(mav);
		
		return mav;
	}
}
