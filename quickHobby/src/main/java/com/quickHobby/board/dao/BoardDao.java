package com.quickHobby.board.dao;

import java.util.List;

import com.quickHobby.board.dto.BoardDto;

public interface BoardDao {
	public int getBoardCount();
	public List<BoardDto> getBoardList(int startRow, int endRow);
	public int boardWrite(BoardDto boardDto);
	public BoardDto boardRead(int boardNum);
	public int boardDelete(int boardNum);
	public int boardUpdate(BoardDto boardDto);
	public int boardWriteFile(BoardDto boardDto);
	public String getFile(int boardNum);
	public int boardUpdateFile(BoardDto boardDto);
}
