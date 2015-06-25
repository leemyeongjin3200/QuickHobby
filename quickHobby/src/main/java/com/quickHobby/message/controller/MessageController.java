package com.quickHobby.message.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.message.dto.MessageDto;
import com.quickHobby.message.service.MessageService;

/*
 * @name        : MessageController
 * @date        : 2015. 6. 25.
 * @author      : 서인구
 * @description : 쪽지 관련 페이지 요청시 service 클래스와 연결.
 */
@Controller
public class MessageController {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MessageService messageService;
	
	/*
	 * @name        : messageWrite
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 쪽지 쓰기 페이지 요청시 MessageService의 messageWrite()로 연결.
	 */
	@RequestMapping(value="/message/messageWrite.do", method=RequestMethod.GET)
	public ModelAndView messageWrite(HttpServletRequest request){
		logger.info("messageWrite======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageWrite(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageWriteOk
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 쪽지 쓰기 페이지 완료 후 MessageService의 messageWriteOk()로 연결.
	 */
	@RequestMapping(value="/message/messageWriteOk.do", method=RequestMethod.POST)
	public ModelAndView messageWriteOk(HttpServletRequest request, MessageDto messageDto){
		logger.info("messageWriteOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("messageDto", messageDto);
		
		messageService.messageWriteOk(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageReceiveList
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 수신함 페이지 요청시 MessageService의 messageReceiveList()로 연결.
	 */
	@RequestMapping(value="/message/messageReceiveList.do", method=RequestMethod.GET)
	public ModelAndView messageReceiveList(HttpServletRequest request){
		logger.info("messageReceiveList======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageReceiveList(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageSendList
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 발신함 페이지 요청시 MessageService의 messageSendList()로 연결.
	 */
	@RequestMapping(value="/message/messageSendList.do", method=RequestMethod.GET)
	public ModelAndView messageSendList(HttpServletRequest request){
		logger.info("messageSendList======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageSendList(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageRead
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 쪽지 목록에서 제목 선택시 MessageService의 messageRead()로 연결.
	 */
	@RequestMapping(value="/message/messageRead.do", method=RequestMethod.GET)
	public ModelAndView messageRead(HttpServletRequest request){
		logger.info("messageRead======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageRead(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageDelete
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 쪽지 삭제 선택시 MessageService의 messageDelete()로 연결. 
	 */
	@RequestMapping(value="/message/messageDelete.do", method=RequestMethod.GET)
	public ModelAndView messageDelete(HttpServletRequest request){
		logger.info("messageDelete======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageDelete(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageReply
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 답장 선택시 MessageService의 messageReply()로 연결.
	 */
	@RequestMapping(value="/message/messageReply.do", method=RequestMethod.GET)
	public ModelAndView messageReply(HttpServletRequest request){
		logger.info("messageReply======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageReply(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageReplyOk
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 답장 작성 완료 후 MessageService의 messageReplyOk()로 연결.
	 */
	@RequestMapping(value="/message/messageReplyOk.do", method=RequestMethod.POST)
	public ModelAndView messageReplyOk(HttpServletRequest request, MessageDto messageDto){
		logger.info("messageReplyOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("messageDto", messageDto);
		
		messageService.messageReplyOk(mav);
		
		return mav;
	}
}
