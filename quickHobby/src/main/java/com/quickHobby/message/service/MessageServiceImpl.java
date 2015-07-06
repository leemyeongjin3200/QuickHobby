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
 * @author      : ���α�
 * @description : ��û ���� ���������� �ʿ�� �ϴ� �����͸� DAO�� ���� �������ų� �ʿ��� ���񽺸� ����.
 */
@Component
public class MessageServiceImpl implements MessageService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MessageDao messageDao;
	
	/*
	 * @name        : messageWrite
	 * @date        : 2015. 6. 25.
	 * @author      : ���α�
	 * @description : ������ �̵�.
	 */
	public void messageWrite(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		mav.setViewName("message/messageWrite");
	}
	
	/*
	 * @name        : messageWriteOk
	 * @date        : 2015. 6. 25.
	 * @author      : ���α�
	 * @description : Message Table�� ���ο� ���� ���� ����.
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
	 * @author      : ���α�
	 * @description : Message Table���� �ش� ȸ���� �߼��� ���� ����� ������.
	 */
	public void messageList(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=messageDao.getMessageCount();
		logger.info("count:"+count);
		
		List<MessageDto> messageList=null;
		
		if(count>0){
			messageList=messageDao.getMessageList(startRow, endRow);
		}
		logger.info("messageList:"+messageList.size());
		
		mav.addObject("messageList", messageList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("message/messageList");
	}
	
	/*
	 * @name        : messageSendList
	 * @date        : 2015. 6. 25.
	 * @author      : ���α�
	 * @description : Message Table���� �ش� ȸ���� ������ ���� ����� ������.
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
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ������ ���� ������ ������.
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
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ������ Message Table���� ����.
	 */
	public void messageDelete(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String checkedMsg="";
		if(request.getParameter("message_num")!=null){
			checkedMsg=request.getParameter("message_num");
			//System.out.println(checkedMsg);
		}
		
		String[] messageNumArr = checkedMsg.split(",");
		
		
		if(messageNumArr !=null && messageNumArr.length>0){
    		for(int i=0; i<messageNumArr.length;i++){
    			logger.info(messageNumArr[i]);
    			String message_num=messageNumArr[i];
    			int check=messageDao.delete(message_num);
    			logger.info("check : " + check);
    			mav.addObject("check", check);
    		}
    	}
		// int check=messageDao.delete(message_num);
		mav.setViewName("message/messageList");
	}
	
	/*
	 * @name        : messageReply
	 * @date        : 2015. 6. 25.
	 * @author      : ���α�
	 * @description : ������ �̵�.
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
	 * @author      : ���α�
	 * @description : ���� ������ Message Table�� ����.
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
