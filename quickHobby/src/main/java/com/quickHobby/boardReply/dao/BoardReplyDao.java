package com.quickHobby.boardReply.dao;

import java.util.List;

import com.quickHobby.boardReply.dto.BoardReplyDto;

public interface BoardReplyDao {

	int boardReplyWrite(BoardReplyDto boardReplyDto);

	List<BoardReplyDto> getBoardReplyList(int boardNum);

	int boardReplyModify(BoardReplyDto boardReplyDto);

}
