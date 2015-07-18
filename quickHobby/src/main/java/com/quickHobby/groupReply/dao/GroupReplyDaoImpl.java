package com.quickHobby.groupReply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.groupReply.dto.GroupReplyDto;

@Component
public class GroupReplyDaoImpl implements GroupReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getReplyCount(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("groupReply.dao.mapper.getReplyCount", boardNum);
	}

	@Override
	public List<GroupReplyDto> getGroupReplyList(int groupBoardNum) {
		return sqlSession.selectList("groupReply.dao.mapper.getGroupReplyList", groupBoardNum);
	}
}
