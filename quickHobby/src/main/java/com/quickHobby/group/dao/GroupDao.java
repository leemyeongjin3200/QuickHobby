package com.quickHobby.group.dao;

import java.util.List;

import com.quickHobby.group.dto.GroupDto;
import com.quickHobby.apply.dto.ApplyDto;

public interface GroupDao {

	int createGroup(GroupDto groupDto);
	
	public List<GroupDto> myGroupList(int memberNum);
	int createGroup(ApplyDto groupDto);
	int updateGroup(ApplyDto groupDto);
}
