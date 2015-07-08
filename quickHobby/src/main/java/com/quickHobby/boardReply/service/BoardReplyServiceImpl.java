package com.quickHobby.boardReply.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.boardReply.dao.BoardReplyDao;
import com.quickHobby.boardReply.dto.BoardReplyDto;
import com.quickHobby.member.dto.MemberDto;

/**
* @name : BoardReplyServiceImpl
* @date : 2015. 7. 8.
* @author : 차건강
* @description : Tip & Review BoardReply 로직 부분
 */
@Component
public class BoardReplyServiceImpl implements BoardReplyService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardReplyDao boardReplyDao;

	@Override
	public void boardReplyWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardReplyDto boardReplyDto=(BoardReplyDto)map.get("boardReplyDto");
		
		int boardReplyBoardNum = Integer.parseInt(request.getParameter("boardNum"));
		String boardReplyContent = request.getParameter("boardReplyContent");
		
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int boardReplyWriter=member.getMemberNum();
		
		boardReplyDto.setBoardReplyWriter(boardReplyWriter);
		boardReplyDto.setBoardReplyBoardNum(boardReplyBoardNum);
		boardReplyDto.setBoardReplyContent(boardReplyContent);
		
		int check=boardReplyDao.boardReplyWrite(boardReplyDto);
		
		mav.addObject("check", check);
		
		mav.setViewName("board/read");
		
	}

	@Override
	public void boardReplyList(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}
}
