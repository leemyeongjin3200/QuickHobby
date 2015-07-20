package com.quickHobby.groupReply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.groupReply.dto.GroupReplyDto;

/**
* @name : GroupReplyDaoImpl
* @date : 2015. 7. 18.
* @author : 차건강
* @description : Group Board Reply DB와 연결
 */
@Component
public class GroupReplyDaoImpl implements GroupReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<GroupReplyDto> getGroupReplyList(int groupBoardNum) {
		return sqlSession.selectList("groupReply.dao.mapper.getGroupReplyList", groupBoardNum);
	}

	@Override
	public int getGroupReplyCount(int groupBoardNum) {
		return sqlSession.selectOne("groupReply.dao.mapper.getGroupReplyCount", groupBoardNum);
	}

	@Override
	public int groupReplyWrite(GroupReplyDto groupReplyDto) {
		return sqlSession.insert("groupReply.dao.mapper.groupReplyWrite", groupReplyDto);
	}

	@Override
	public int groupReplyModify(GroupReplyDto groupReplyDto) {
		return sqlSession.update("groupReply.dao.mapper.groupReplyModify", groupReplyDto);
	}

	@Override
	public int groupReplyDelete(GroupReplyDto groupReplyDto) {
		return sqlSession.delete("groupReply.dao.mapper.groupReplyDelete", groupReplyDto);
	}
}
