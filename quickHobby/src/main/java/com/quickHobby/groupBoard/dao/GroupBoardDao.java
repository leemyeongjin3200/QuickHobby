package com.quickHobby.groupBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.quickHobby.groupBoard.dto.GroupBoardDto;

public interface GroupBoardDao {

	int getGroupBoardCount(int groupNum);

	List<GroupBoardDto> getGroupBoardList(int groupNum);

	int groupBoardWrite(GroupBoardDto groupBoardDto);

	GroupBoardDto groupBoardRead(int groupBoardNum);

	int boardDelete(int groupBoardNum);

	int groupBoardUpdate(GroupBoardDto groupBoardDto);


}
