package com.quickHobby.groupBoard.dao;

import java.util.List;

import com.quickHobby.groupBoard.dto.GroupBoardDto;

public interface GroupBoardDao {

	int getGroupBoardCount();

	List<GroupBoardDto> getGroupBoardList(int startRow, int endRow);

	int groupBoardWrite(GroupBoardDto groupBoardDto);

	GroupBoardDto groupBoardRead(int groupBoardNum);

	int boardDelete(int groupBoardNum);

	int groupBoardUpdate(GroupBoardDto groupBoardDto);


}
