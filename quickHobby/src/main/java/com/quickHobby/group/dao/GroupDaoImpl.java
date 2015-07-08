package com.quickHobby.group.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.apply.dto.ApplyDto;

@Component
public class GroupDaoImpl implements GroupDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createGroup(ApplyDto groupDto) {
		return sqlSession.insert("group.dao.mapper.createGroup", groupDto);
	}
	
	@Override
	public int updateGroup(ApplyDto groupDto){
		return sqlSession.update("group.dao.mapper.updateGroup", groupDto);
	}
}
