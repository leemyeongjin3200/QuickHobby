package com.quickHobby.group.dao;

import java.util.List;

import com.quickHobby.group.dto.GroupDto;

public interface GroupDao {

	int createGroup(GroupDto groupDto);
	
	public List<GroupDto> myGroupList(int memberNum);
}
