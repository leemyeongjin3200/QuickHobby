package com.quickHobby.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.board.dto.BoardDto;


/**
* @name : BoardDaoImpl
* @date : 2015. 6. 22.
* @author : 차건강
* @description : Tip & Review Board Dao
 */

@Component
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getBoardCount() {
		return sqlSession.selectOne("board.dao.mapper.boardCount");
	}

	

	@Override
	public List<BoardDto> getBoardList(int startRow, int endRow) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("board.dao.mapper.boardList", map);
	}

	@Override
	public int insert(BoardDto boardDto) {
		return sqlSession.insert("board.dao.mapper.boardInsert", boardDto);
	}
}
