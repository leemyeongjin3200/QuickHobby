package com.quickHobby.memberBoard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.board.dto.BoardDto;

@Component
public class MemberBoardDaoImpl implements MemberBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardDto> getSumlist(int memberNum) {
		return sqlSession.selectList("dao.boardMapper.skyList",memberNum);
	}
}
