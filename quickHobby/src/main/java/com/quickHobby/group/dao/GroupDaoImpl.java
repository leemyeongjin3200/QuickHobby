package com.quickHobby.group.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.group.dto.GroupDto;

@Component
public class GroupDaoImpl implements GroupDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createGroup(ApplyDto groupDto) {
		return sqlSession.insert("group.dao.mapper.createGroup", groupDto);
	}

	@Override
	public List<GroupDto> myGroupList(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("group.dao.mapper.myGroupList", memberNum);
	}
	
	@Override
	public int updateGroup(ApplyDto groupDto){
		return sqlSession.update("group.dao.mapper.updateGroup", groupDto);
	}

	@Override
	public int createGroupFile(ApplyDto groupDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("group.dao.mapper.createGroupFile", groupDto);
	}
}
