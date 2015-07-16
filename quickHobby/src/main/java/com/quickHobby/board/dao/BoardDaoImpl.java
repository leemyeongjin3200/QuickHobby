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
* @description : Tip & Review Board DB와 연결하는 부분
 */
@Component
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getBoardCount() {
		return sqlSession.selectOne("board.dao.mapper.boardCount");
	}

//	@Override
//	public List<BoardDto> getBoardList(int startRow, int endRow) {
//		Map<String,Integer>map=new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return sqlSession.selectList("board.dao.mapper.boardList", map);
//	}
	
	@Override
	public List<BoardDto> getBoardList() {
		return sqlSession.selectList("board.dao.mapper.boardList");
	}

	@Override
	public int boardWrite(BoardDto boardDto) {
		return sqlSession.insert("board.dao.mapper.boardInsert", boardDto);
	}

	@Override
	public BoardDto boardRead(int boardNum) {
		BoardDto board=null;
		
		try{
			sqlSession.update("board.dao.mapper.readCount", boardNum);
			board=sqlSession.selectOne("board.dao.mapper.boardRead",boardNum);
		}catch(Exception e){
			sqlSession.rollback();
		}
		return board;
	}

	@Override
	public int boardDelete(int boardNum) {
		return sqlSession.update("board.dao.mapper.boardDelete", boardNum);
	}

	@Override
	public int boardUpdate(BoardDto boardDto) {
		return sqlSession.update("board.dao.mapper.boardUpdate", boardDto);
	}
}
