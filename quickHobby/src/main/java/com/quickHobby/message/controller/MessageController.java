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
	
	/*
	 * @name        : messageWrite
	 * @date        : 2015. 6. 25.
	 * @author      : ���α�
	 * @description : ���� ���� ������ ��û�� MessageService�� messageWrite()�� ����.
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
	 * @author      : ���α�
	 * @description : ���� ���� ������ �Ϸ� �� MessageService�� messageWriteOk()�� ����.
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
	 * @author      : ���α�
	 * @description : ������ ������ ��û�� MessageService�� messageReceiveList()�� ����.
	 */
	@RequestMapping(value="/message/messageList.do", method=RequestMethod.GET)
	public ModelAndView messageList(HttpServletRequest request){
		logger.info("messageList======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		messageService.messageList(mav);
		
		return mav;
	}
	
	/*
	 * @name        : messageSendList
	 * @date        : 2015. 6. 25.
	 * @author      : ���α�
	 * @description : �߽��� ������ ��û�� MessageService�� messageSendList()�� ����.
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
	 * @author      : ���α�
	 * @description : ���� ��Ͽ��� ���� ���ý� MessageService�� messageRead()�� ����.
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
	 * @author      : ���α�
	 * @description : ���� ���� ���ý� MessageService�� messageDelete()�� ����. 
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
	
	@RequestMapping(value="/getNewMessage.do", method=RequestMethod.GET)
	public ModelAndView getNewMessage(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		messageService.getNewMessage(mav);
		
		return mav;
	}
}
