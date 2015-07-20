package com.quickHobby.groupReply.dao;

import java.util.List;

import com.quickHobby.groupReply.dto.GroupReplyDto;

public interface GroupReplyDao {
	List<GroupReplyDto> getGroupReplyList(int groupBoardNum);

	int getGroupReplyCount(int groupBoardNum);

	int groupReplyWrite(GroupReplyDto groupReplyDto);

	int groupReplyModify(GroupReplyDto groupReplyDto);

	int groupReplyDelete(GroupReplyDto groupReplyDto);
}
