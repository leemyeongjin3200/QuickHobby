package com.quickHobby.report.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.report.service.ReportService;

/**
* @name : ReportController
* @date : 2015. 7. 15.
* @author : 서인구	
* @description : 신고기능을 제어하기 위한 컨트롤러
 */
@Controller
public class ReportController {
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReportService reportService;
	
	/**
	* @name : reportList
	* @date : 2015. 7. 15.
	* @author : 서인구
	* @description : 신고 목록을 불러오기위한 메소드 
	 */
	@RequestMapping(value="/report/reportList.do", method=RequestMethod.GET)
	public ModelAndView reportList(HttpServletRequest request){
		logger.info("reportList======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		reportService.reportList(mav);
		
		return mav;
	}
}
