package com.quickHobby.apply.controller;

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
	@RequestMapping(value="/apply/applyDelete.do", method=RequestMethod.GET)
	public ModelAndView applyDelete(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyDelete(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyOk
	 * @date        : 2015. 6. 26.
	 * @author      : 서인구
	 * @description : 회원이 apply게시물에서 해당 그룹 가입 신청 시
	 */
	@RequestMapping(value="/apply/applyOk.do", method=RequestMethod.GET)
	public ModelAndView applyOk(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyOk(mav);
		
		return mav;
	}
	
	/*
	 * @name        : main
	 * @date        : 2015. 6. 26.
	 * @author      : 서인구
	 * @description : main화면 로딩 시 applyList 불러옴
	 */
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		applyService.main(mav);
		
		return mav;
	}
	
	/*
	 * @name        : incrementRecommend
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : apply게시물에 회원이 좋아요를 눌렀을 때
	 */
	@RequestMapping(value="/apply/incrementRecommend.do", method=RequestMethod.POST)
	public ModelAndView incrementRecommend(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.incrementRecommend(mav);
		
		return null;
	}
	
	/*
	 * @name        : decrementRecommend
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : 이미 좋아요를 누른 게시물에 다시 좋아요를 누를 때 좋아료를 취소함.
	 */
	@RequestMapping(value="/apply/decrementRecommend.do", method=RequestMethod.POST)
	public ModelAndView decrementRecommend(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.decrementRecommend(mav);
		
		return null;
	}
	
	/*
	 * @name        : report
	 * @date        : 2015. 6. 29.
	 * @author      : 서인구
	 * @description : apply게시물의 신고하기 버튼을 눌렀을 때
	 */
	@RequestMapping(value="/apply/report.do", method=RequestMethod.POST)
	public ModelAndView report(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.report(mav);
		
		return null;
	}
}