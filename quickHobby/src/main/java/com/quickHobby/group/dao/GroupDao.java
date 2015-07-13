package com.quickHobby.group.dao;

import java.util.HashMap;
import java.util.List;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.group.dto.GroupDto;

public interface GroupDao {

	public List<GroupDto> myGroupList(int memberNum);
	GroupDto getGroupDto(int groupNum);
	public int createGroup(ApplyDto groupDto);
	public int createGroupFile(ApplyDto groupDto);
	public int updateGroup(ApplyDto groupDto);
	public int joinMember(HashMap<String, Integer> map);
}
