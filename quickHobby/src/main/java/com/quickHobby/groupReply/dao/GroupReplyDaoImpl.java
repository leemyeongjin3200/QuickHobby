package com.quickHobby.groupReply.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GroupReplyDaoImpl implements GroupReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getReplyCount(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("groupReply.dao.mapper.getReplyCount", boardNum);
	}
}
