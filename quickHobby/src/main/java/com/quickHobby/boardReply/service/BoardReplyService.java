package com.quickHobby.boardReply.service;

import java.util.List;

import com.quickHobby.boardReply.dto.BoardReplyDto;

public interface BoardReplyService {
	public int boardReplyWrite(BoardReplyDto boardReplyDto);
	public List<BoardReplyDto> getBoardReplyList(int boardNum);
	public int boardReplyModify(BoardReplyDto boardReplyDto);
	public int boardReplyDelete(BoardReplyDto boardReplyDto);
}
