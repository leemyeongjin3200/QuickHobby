package com.quickHobby.group.dao;

import java.util.HashMap;
import java.util.List;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.group.dto.GroupDto;

public interface GroupDao {

	public List<GroupDto> myGroupList(int memberNum);
	int createGroup(ApplyDto groupDto);
	int createGroupFile(ApplyDto groupDto);
	int updateGroup(ApplyDto groupDto);
	int joinMember(HashMap<String, Integer> map);
	GroupDto getGroupDto(int groupNum);
}
