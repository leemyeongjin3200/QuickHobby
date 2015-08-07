package com.quickHobby.memberBoard.dao;

import java.util.List;

import com.quickHobby.board.dto.BoardDto;

public interface MemberBoardDao {
    public List<BoardDto>getSumlist(int memberNum);
}
