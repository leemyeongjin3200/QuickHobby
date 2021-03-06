package com.quickHobby.boardReply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.boardReply.dao.BoardReplyDao;
import com.quickHobby.boardReply.dto.BoardReplyDto;

/**
* @name : BoardReplyServiceImpl
* @date : 2015. 7. 8.
* @author : 차건강
* @description : Tip & Review BoardReply Dao 부분과 연결
 */
@Component
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Autowired
	private BoardReplyDao boardReplyDao;

	/**
	* @name : getBoardReplyList
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : Tip & Review BoardReply 리스트 Dao에 요청
	 */
	public List<BoardReplyDto> getBoardReplyList(int boardNum){
		return boardReplyDao.getBoardReplyList(boardNum);	
	}

	/**
	* @name : boardReplyWrite
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : Tip & Review BoardReply 작성한 내용 Dao에 전달
	 */
	@Override
	public int boardReplyWrite(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyWrite(boardReplyDto);
	}
	
	/**
	* @name : boardReplyModify
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : Tip & Review BoardReply 수정한 내용 Dao에 전달
	 */
	@Override
	public int boardReplyModify(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyModify(boardReplyDto);
	}

	/**
	* @name : boardReplyDelete
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : Tip & Review BoardReply 삭제할 내용 Dao에 전달
	 */
	@Override
	public int boardReplyDelete(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyDelete(boardReplyDto);
	}
}
