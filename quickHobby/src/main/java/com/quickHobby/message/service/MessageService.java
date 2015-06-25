package com.quickHobby.message.service;

import org.springframework.web.servlet.ModelAndView;

public interface MessageService {
	public void messageWrite(ModelAndView mav);
	public void messageWriteOk(ModelAndView mav);
	public void messageReceiveList(ModelAndView mav);
	public void messageSendList(ModelAndView mav);
	public void messageRead(ModelAndView mav);
	public void messageDelete(ModelAndView mav);
	public void messageReply(ModelAndView mav);
	public void messageReplyOk(ModelAndView mav);
}
