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
 * @author      : ���α�
 * @description : ���� ���� ������ ��û�� service Ŭ������ ����.
 */
@Controller
public class MessageController {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MessageService messageService;
	/**
	* @name : messageWrite
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message 작성 기본 기능 / ajax 이용하여 view와 연결
	 */
	@RequestMapping(value="/message/messageWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView messageWrite(HttpServletRequest request, MessageDto messageDto){
		logger.info("messageWrite======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("messageDto", messageDto);
		
		messageService.messageWrite(mav);
		
		return mav;
	}
	
	/**
	* @name : messageList
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message list 기능 / view의 여러 조건과 연결
	 */
	@RequestMapping(value="/message/messageList.do", method=RequestMethod.GET)
	public ModelAndView messageList(HttpServletRequest request){
		logger.info("messageList======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageList(mav);
		
		return mav;
	}

	/**
	* @name : messageRead
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message 읽기 기능 / 읽은 message와 안읽은 message 구별
	 */
	@RequestMapping(value="/message/messageRead.do", method=RequestMethod.GET)
	public ModelAndView messageRead(HttpServletRequest request, MessageDto messageDto){
		logger.info("messageRead======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("messageDto", messageDto);
		
		messageService.messageRead(mav);
		
		return mav;
	}
	/**
	* @name : messageDelete
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message 삭제 기능 / 체크된 message들 다수를 삭제
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
	 * @author      : ���α�
	 * @description : ���� ���ý� MessageService�� messageReply()�� ����.
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
	 * @author      : ���α�
	 * @description : ���� �ۼ� �Ϸ� �� MessageService�� messageReplyOk()�� ����.
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
	
	/**
	* @name : getNewMessage
	* @date : 2015. 7. 7.
	* @author : 이명진
	* @description : 안읽은 message 개수 카운트
	 */
	@RequestMapping(value="/getNewMessage.do", method=RequestMethod.GET)
	public ModelAndView getNewMessage(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		messageService.getNewMessage(mav);
		
		return mav;
	}
}
