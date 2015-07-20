package com.quickHobby.groupReply.service;

import java.util.List;

import com.quickHobby.groupReply.dto.GroupReplyDto;

public interface GroupReplyService {

	List<GroupReplyDto> getGroupReplyList(int groupBoardNum);

	int groupReplyWrite(GroupReplyDto groupReplyDto);

	int groupReplyModify(GroupReplyDto groupReplyDto);

	int groupReplyDelete(GroupReplyDto groupReplyDto);
}
