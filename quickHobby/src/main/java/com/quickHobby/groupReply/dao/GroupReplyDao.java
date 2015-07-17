package com.quickHobby.groupReply.dao;

import java.util.List;

import com.quickHobby.groupReply.dto.GroupReplyDto;

public interface GroupReplyDao {
	public int getReplyCount(int boardNum);

	List<GroupReplyDto> getGroupReplyList(int groupBoardNum);
}
