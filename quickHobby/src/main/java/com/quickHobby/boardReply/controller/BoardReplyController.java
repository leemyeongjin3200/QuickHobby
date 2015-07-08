package com.quickHobby.boardReply.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.boardReply.dto.BoardReplyDto;
import com.quickHobby.boardReply.service.BoardReplyService;

/**
* @name : BoardReplyController
* @date : 2015. 7. 8.
* @author : 차건강
* @description : Tip & Review BoardReply Controller
 */
@Controller
public class BoardReplyController {
private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardReplyService boardReplyService;
	
	/**
	* @name : replyWrite
	* @date : 2015. 7. 8.
	* @author : 차건강
	* @description : boardReply 작성 부분
	 */
	@RequestMapping(value = "boardReply/boardReplyWrite.do", method = RequestMethod.POST)
	public ModelAndView boardReplyWrite(BoardReplyDto boardReplyDto, HttpServletRequest request) {
		logger.info("boardReplyWrite---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("boardReplyDto", boardReplyDto);
		boardReplyService.boardReplyWrite(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/boardReply/boardReplyList.do", method=RequestMethod.GET)
	public ModelAndView boardReplyList(HttpServletRequest request){
		logger.info("boardReplyList---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		boardReplyService.boardReplyList(mav);
		return mav;
	}
}
