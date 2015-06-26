package com.quickHobby.group.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.group.dto.GroupDto;

@Component
public class GroupDaoImpl implements GroupDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createGroup(GroupDto groupDto) {
		return sqlSession.insert("group.dao.mapper.createGroup", groupDto);
	}
}
