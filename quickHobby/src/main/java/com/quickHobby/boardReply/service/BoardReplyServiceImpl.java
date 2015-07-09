package com.quickHobby.boardReply.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
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

	/**
	* @name : getBoardReplyList
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : Tip & Review BoardReply 리스트 DB에 요청
	 */
	public List<BoardReplyDto> getBoardReplyList(int boardNum){
		return boardReplyDao.getBoardReplyList(boardNum);	
	}

	/**
	* @name : boardReplyWrite
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : Tip & Review BoardReply 작성한 내용 DB에 저장
	 */
	@Override
	public int boardReplyWrite(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyWrite(boardReplyDto);
	}

	@Override
	public int boardReplyModify(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyModify(boardReplyDto);
	}
}
