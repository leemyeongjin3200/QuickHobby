package com.quickHobby.group.dao;

import java.util.List;

import com.quickHobby.group.dto.GroupDto;
import com.quickHobby.apply.dto.ApplyDto;

public interface GroupDao {

	public List<GroupDto> myGroupList(int memberNum);
	int createGroup(ApplyDto groupDto);
	int createGroupFile(ApplyDto groupDto);
	int updateGroup(ApplyDto groupDto);
}
