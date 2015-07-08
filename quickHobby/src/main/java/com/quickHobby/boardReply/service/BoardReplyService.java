package com.quickHobby.boardReply.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardReplyService {

	void boardReplyWrite(ModelAndView mav);

	void boardReplyList(ModelAndView mav);

}
