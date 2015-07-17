package com.quickHobby.apply.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.apply.service.ApplyService;

/*
 * @name        : ApplyController
 * @date        : 2015. 6. 22.
 * @author      : 서인구
 * @description : 신청게시물 관련 컨트롤러 
 */
@Controller
public class ApplyController {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyService applyService;
	
	/*
	 * @name        : applyWrite
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청게시물 작성 페이지 요청시
	 */
	@RequestMapping(value="/apply/applyWrite.do", method=RequestMethod.GET)
	public ModelAndView applyWrite(HttpServletRequest request){
		logger.info("applyWrite======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		applyService.applyWrite(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyWriteOk
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물 작성 후 완료 버튼 클릭시
	 */
	@RequestMapping(value="/apply/applyWriteOk.do", method=RequestMethod.POST)
	public ModelAndView applyWriteOk(MultipartHttpServletRequest request, ApplyDto applyDto){
		logger.info("applyWriteOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("applyDto", applyDto);
		
		applyService.applyWriteOk(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyList
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물 목록 페이지 요청시
	 */
	@RequestMapping(value="/apply/applyList.do", method=RequestMethod.GET)
	public ModelAndView applyList(HttpServletRequest request){
		logger.info("applyList======");
		
		ModelAndView mav=new ModelAndView();
		
		applyService.applyList(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyRead
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물 목록에서 특정 게시물 클릭시
	 */
	@RequestMapping(value="/apply/applyRead.do", method=RequestMethod.GET)
	public ModelAndView applyRead(HttpServletRequest request){
		logger.info("applyRead======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyRead(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyDelete
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 신청 게시물 삭제 요청시
	 */
	@RequestMapping(value="apply/applyDelete.do", method=RequestMethod.GET)
	public ModelAndView applyDelete(HttpServletRequest request){
		logger.info("applyDelete======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyDelete(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyUpdate
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 신청 게시물 수정 요청시
	 */
	@RequestMapping(value="apply/applyUpdate.do", method=RequestMethod.GET)
	public ModelAndView applyUpdate(HttpServletRequest request){
		logger.info("applyUpdate======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyUpdate(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyUpdateOk
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 신청 게시물 수정 후 완료 버튼 클릭시
	 */
	@RequestMapping(value="apply/applyUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView applyUpdateOk(MultipartHttpServletRequest request, ApplyDto applyDto){
		logger.info("applyUpdateOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("applyDto", applyDto);
		
		applyService.applyUpdateOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="apply/applyOk.do", method=RequestMethod.GET)
	public ModelAndView applyOk(HttpServletRequest request){
		logger.info("applyOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request){
		logger.info("main======");
		
		ModelAndView mav=new ModelAndView();
		applyService.main(mav);
		
		return mav;
	}
	
	@RequestMapping(value="apply/incrementRecommend.do", method=RequestMethod.POST)
	public ModelAndView incrementRecommend(HttpServletRequest request){
		logger.info("incerementRecommend======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.incrementRecommend(mav);
		
		return null;
	}
	
	@RequestMapping(value="apply/decrementRecommend.do", method=RequestMethod.POST)
	public ModelAndView decrementRecommend(HttpServletRequest request){
		logger.info("decerementRecommend======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.decrementRecommend(mav);
		
		return null;
	}
	
	@RequestMapping(value="apply/report.do", method=RequestMethod.POST)
	public ModelAndView report(HttpServletRequest request){
		logger.info("report======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.report(mav);
		
		return null;
	}
}
