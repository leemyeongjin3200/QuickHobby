package com.quickHobby.groupReply.service;

import java.util.List;

import com.quickHobby.groupReply.dto.GroupReplyDto;

public interface GroupReplyService {
	public List<GroupReplyDto> getGroupReplyList(int groupBoardNum);
	public int groupReplyWrite(GroupReplyDto groupReplyDto);
	public int groupReplyDelete(GroupReplyDto groupReplyDto);
}
