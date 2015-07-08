package com.quickHobby.group.dao;

import java.util.List;

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

	@Override
	public List<GroupDto> myGroupList(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("group.dao.mapper.myGroupList", memberNum);
	}
}
