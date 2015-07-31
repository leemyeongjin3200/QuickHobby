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
	
	
	/**
	* @name : getBoardCount
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board의 모든 게시물 수 가져온다 
	 */
	@Override
	public int getBoardCount() {
		return sqlSession.selectOne("board.dao.mapper.boardCount");
	}

	/**
	* @name : getBoardList
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board에서 startRow와 endRow에 따른 boardList가져온다.
	 */
	@Override
	public List<BoardDto> getBoardList(int startRow, int endRow) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("board.dao.mapper.boardList", map);
	}
	
	/**
	* @name : boardWrite
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board작성 시 파일이 없는 경우를 board 테이블에 저장
	 */
	@Override
	public int boardWrite(BoardDto boardDto) {
		return sqlSession.insert("board.dao.mapper.boardInsert", boardDto);
	}
	
	/**
	* @name : boardWriteFile
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board작성 시 파일이 있는 경우를 board 테이블에 저장
	 */
	@Override
	public int boardWriteFile(BoardDto boardDto) {
		return sqlSession.insert("board.dao.mapper.boardInsertFile", boardDto);
	}

	/**
	* @name : boardRead
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board작성 시 파일이 없는 경우를 board 테이블에 저장
	 */
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

	/**
	* @name : boardDelete
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 삭제, board 테이블에서 해당 게시물 삭제
	 */
	@Override
	public int boardDelete(int boardNum) {
		return sqlSession.update("board.dao.mapper.boardDelete", boardNum);
	}

	/**
	* @name : boardUpdate
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 수정, board 테이블에서 해당 게시물 수정
	 */
	@Override
	public int boardUpdate(BoardDto boardDto) {
		return sqlSession.update("board.dao.mapper.boardUpdate", boardDto);
	}

	/**
	* @name : getFile
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : 게시물 수정 시 원래 게시물에 파일이 있었는지 확인하기 위해 board테이블에 저장된 filepath를 가져온다
	 */
	@Override
	public String getFile(int boardNum) {
		return sqlSession.selectOne("board.dao.mapper.getFile", boardNum);
	}

	/**
	* @name : boardUpdateFile
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 수정 시 파일이 있는 경우
	 */
	@Override
	public int boardUpdateFile(BoardDto boardDto) {
		return sqlSession.update("board.dao.mapper.boardUpdateFile", boardDto);
	}
}
