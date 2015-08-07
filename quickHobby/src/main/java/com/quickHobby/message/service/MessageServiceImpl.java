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

/**
* @name : messageWrite
* @date : 2015. 6. 25. / 2015. 7. 7.
* @author : 서인구 / 차건강
* @description : message관련된 기능을제어하는 클래스
 */

@Component
public class MessageServiceImpl implements MessageService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MessageDao messageDao;

	/**
	* @name : messageWrite
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message 작성 기능 / ajax 이용하여 view와 연결
	 */
	public void messageWrite(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		// HttpServletRequest request=(HttpServletRequest) map.get("request");
		MessageDto messageDto=(MessageDto) map.get("messageDto");
		
		int check=messageDao.send(messageDto);
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("message/messageList");
	}
	
	/**
	* @name : messageList
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message list 기능 / ajax 이용하여 view와 연결
	 */
	public void messageList(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int count=messageDao.getMessageCount();
		logger.info("count:"+count);
		
		List<MessageDto> messageList=null;
		
		if(count>0){
			messageList=messageDao.getMessageList();
			logger.info("messageList:"+messageList.size());

			for(int i=0;i<messageList.size();i++){
				int sender=messageList.get(i).getMessage_sender();
				int messageNum=messageList.get(i).getMessage_num();
				logger.info("sender:"+sender);
				logger.info("messageNum:"+messageNum);
			}
		}
		
		mav.addObject("messageList", messageList);
		mav.addObject("count", count);
		mav.setViewName("message/messageList");
	}
	
	/**
	* @name : messageList
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message list 기능 / 읽은 message와 안읽은 message 구별
	 */
	public void messageRead(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int message_num=Integer.parseInt(request.getParameter("message_num"));
		
		messageDao.readChange(message_num);

		mav.setViewName("message/messageRead");
	}
	
	/**
	* @name : messageDelete
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message 삭제 기능 / 체크된 message들 다수를 삭제
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
	
	/**
	* @name : messageDelete
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message답장
	 */
	public void messageReply(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int message_receiver=Integer.parseInt(request.getParameter("message_receiver"));
		
		mav.addObject("message_receiver", message_receiver);
		mav.setViewName("message/messageReply");
	}
	
	/**
	* @name : messageDelete
	* @date : 2015. 6. 25. / 2015. 7. 7.
	* @author : 서인구 / 차건강
	* @description : message 답장
	 */
	public void messageReplyOk(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		MessageDto messageDto=(MessageDto) map.get("messageDto");
		
		messageDto.setMessage_date(new Date());
		
		int check=messageDao.send(messageDto);
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("message/messageReplyOk");
	}
	
	/**
	* @name : getNewMessage
	* @date : 2015. 7. 7.
	* @author : 이명진
	* @description : 안읽은 message 개수 카운트
	 */
	public void getNewMessage(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		
		int memberNum=Integer.parseInt(req.getParameter("memberNum"));
		
		int newMessageNum=messageDao.getNewMessage(memberNum);
		
		mav.addObject("newMessageNum", newMessageNum);
		mav.setViewName("template/header");
	}
}
