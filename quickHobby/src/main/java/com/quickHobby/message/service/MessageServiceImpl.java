package com.quickHobby.message.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.message.dao.MessageDao;
import com.quickHobby.message.dto.MessageDto;

/*
 * @name        : MessageServiceImpl
 * @date        : 2015. 6. 25.
 * @author      : 서인구
 * @description : 요청 받은 페이지에서 필요로 하는 데이터를 DAO를 통해 가져오거나 필요한 서비스를 수행.
 */
@Component
public class MessageServiceImpl implements MessageService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MessageDao messageDao;
	
	/*
	 * @name        : messageWrite
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 페이지 이동.
	 */
	public void messageWrite(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		mav.setViewName("message/messageWrite");
	}
	
	/*
	 * @name        : messageWriteOk
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : Message Table에 새로운 쪽지 정보 저장.
	 */
	public void messageWriteOk(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		MessageDto messageDto=(MessageDto) map.get("messageDto");
		
		messageDto.setMessage_date(new Date());
		
		int check=messageDao.send(messageDto);
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("message/messageWriteOk");
	}
	
	/*
	 * @name        : messageReceiveList
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : Message Table에서 해당 회원이 발송한 쪽지 목록을 가져옴.
	 */
	public void messageReceiveList(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<MessageDto> messageList=messageDao.getReceiveList(1);
		logger.info("ReceiveList size : " + messageList.size());
		
		mav.addObject("messageList", messageList);
		mav.setViewName("message/messageReceiveList");
	}
	
	/*
	 * @name        : messageSendList
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : Message Table에서 해당 회원이 수신한 쪽지 목록을 가져옴.
	 */
	public void messageSendList(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<MessageDto> messageList=messageDao.getSendList(1);
		logger.info("SendList size : " + messageList.size());
		
		mav.addObject("messageList", messageList);
		mav.setViewName("message/messageSendList");
	}
	
	/*
	 * @name        : messageRead
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 해당 번호의 쪽지에 대한 정보를 가져옴.
	 */
	public void messageRead(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int message_num=Integer.parseInt(request.getParameter("message_num"));
		MessageDto messageDto=messageDao.getMessageDto(message_num);
		logger.info("message_num : " + messageDto.getMessage_num());
		
		mav.addObject("messageDto", messageDto);
		mav.setViewName("message/messageRead");
	}
	
	/*
	 * @name        : messageDelete
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 해당 번호의 쪽지를 Message Table에서 삭제.
	 */
	public void messageDelete(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int message_num=Integer.parseInt(request.getParameter("message_num"));
		int check=messageDao.delete(message_num);
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("message/messageDelete");
	}
	
	/*
	 * @name        : messageReply
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 페이지 이동.
	 */
	public void messageReply(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int message_receiver=Integer.parseInt(request.getParameter("message_receiver"));
		
		mav.addObject("message_receiver", message_receiver);
		mav.setViewName("message/messageReply");
	}
	
	/*
	 * @name        : messageReplyOk
	 * @date        : 2015. 6. 25.
	 * @author      : 서인구
	 * @description : 답장 정보를 Message Table에 저장.
	 */
	public void messageReplyOk(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		MessageDto messageDto=(MessageDto) map.get("messageDto");
		
		messageDto.setMessage_date(new Date());
		
		int check=messageDao.send(messageDto);
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("message/messageReplyOk");
	}
}
