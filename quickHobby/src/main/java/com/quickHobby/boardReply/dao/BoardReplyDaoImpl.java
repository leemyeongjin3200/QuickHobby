package com.quickHobby.boardReply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.boardReply.dto.BoardReplyDto;

/**
* @name : BoardReplyDaoImpl
* @date : 2015. 7. 8.
* @author : 차건강
* @description : Tip & Review BoardReply DB와 연결하는 부분
 */
@Component
public class BoardReplyDaoImpl implements BoardReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int boardReplyWrite(BoardReplyDto boardReplyDto) {
		return sqlSession.insert("boardReply.dao.mapper.boardReplyWrite", boardReplyDto);
	}

	@Override
	public List<BoardReplyDto> getBoardReplyList(int boardNum) {
		return sqlSession.selectList("boardReply.dao.mapper.getBoardReplyList", boardNum);
	}

	@Override
	public int boardReplyModify(BoardReplyDto boardReplyDto) {
		return sqlSession.update("boardReply.dao.mapper.boardReplyModify", boardReplyDto);
	}

	@Override
	public int boardReplyDelete(BoardReplyDto boardReplyDto) {
		return sqlSession.delete("boardReply.dao.mapper.boardReplyDelete", boardReplyDto);
	}

	@Override
	public int getBoardReplyCount(int boardNum) {
		return sqlSession.selectOne("boardReply.dao.mapper.getBoardReplyCount", boardNum);
	}
}
