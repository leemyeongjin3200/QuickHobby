package com.quickHobby.boardReply.dao;

import java.util.List;

import com.quickHobby.boardReply.dto.BoardReplyDto;

public interface BoardReplyDao {
	public int boardReplyWrite(BoardReplyDto boardReplyDto);
	public List<BoardReplyDto> getBoardReplyList(int boardNum);
	public int boardReplyModify(BoardReplyDto boardReplyDto);
	public int boardReplyDelete(BoardReplyDto boardReplyDto);
	public int getBoardReplyCount(int boardNum);
}
