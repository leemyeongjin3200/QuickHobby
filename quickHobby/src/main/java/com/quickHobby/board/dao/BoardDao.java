package com.quickHobby.board.dao;

import java.util.List;

import com.quickHobby.board.dto.BoardDto;

public interface BoardDao {

	int getBoardCount();

	List<BoardDto> getBoardList(int startRow, int endRow);
	
	int boardWrite(BoardDto boardDto);

	BoardDto boardRead(int boardNum);

	int boardDelete(int boardNum);

	int boardUpdate(BoardDto boardDto);


	

}
