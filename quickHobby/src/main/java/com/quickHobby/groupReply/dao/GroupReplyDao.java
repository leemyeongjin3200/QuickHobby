package com.quickHobby.groupReply.dao;

import java.util.List;

import com.quickHobby.groupReply.dto.GroupReplyDto;

public interface GroupReplyDao {
	public List<GroupReplyDto> getGroupReplyList(int groupBoardNum);
	public int getGroupReplyCount(int groupBoardNum);
	public int groupReplyWrite(GroupReplyDto groupReplyDto);
	public int groupReplyDelete(GroupReplyDto groupReplyDto);
}
