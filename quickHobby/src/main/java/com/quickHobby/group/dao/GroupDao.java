package com.quickHobby.group.dao;

import com.quickHobby.apply.dto.ApplyDto;

public interface GroupDao {

	int createGroup(ApplyDto groupDto);
	int updateGroup(ApplyDto groupDto);
}
