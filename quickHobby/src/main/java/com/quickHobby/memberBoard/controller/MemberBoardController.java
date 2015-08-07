package com.quickHobby.memberBoard.controller;

import javax.servlet.http.HttpServletRequest;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.memberBoard.service.MemberBoardService;

/**
* @name : MemberBoardController
* @date : 2015. 7. 5.
* @author : 서인구
* @description : 회원의 개인 게시판을 제어하는 클래스
 */
@Controller
public class MemberBoardController {
	
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MemberBoardService memberBoardService;
	
	/**
	* @name : check
	* @date : 2015. 7. 5.
	* @author : 서인구
	* @description : 개인페이지출력 요청이 들어오면 해당 회원이 작성한 게시물 리스트를 가져오기위해 service에 접근
	 */
	@RequestMapping(value="/memberBoard/check.do", method=RequestMethod.GET)
	public ModelAndView check(HttpServletRequest request){
		logger.info("check-----------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		memberBoardService.boardWrite(mav);
		
		return mav;
	}
}
