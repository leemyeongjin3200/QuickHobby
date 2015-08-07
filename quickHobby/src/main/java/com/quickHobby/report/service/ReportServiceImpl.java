package com.quickHobby.report.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.report.dao.ReportDao;
import com.quickHobby.report.dto.ReportDto;

/**
* @name : ReportServiceImpl
* @date : 2015. 7. 15.
* @author : 서인구
* @description : 신고기능 제어를 위한 메소드 
 */
@Component
public class ReportServiceImpl implements ReportService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ReportDao reportDao;
	
	/**
	* @name : reportList
	* @date : 2015. 7. 15.
	* @author : 서인구
	* @description : 신고목록을 불러오기위한 메소드
	 */
	public void reportList(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
//		logger.info("pageNumber:"+pageNumber);
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=reportDao.getReportCount();
		logger.info("count:"+count);
		
		List<ReportDto> reportList=null;
		
		if(count>0){
			reportList=reportDao.getReportList(startRow, endRow);
			logger.info("reportList:"+reportList.size());
		}
		
		
		mav.addObject("reportList", reportList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("report/reportList");
	}
}
