package com.quickHobby.groupBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.groupBoard.dto.GroupBoardDto;

/**
* @name : GroupBoardDaoImpl
* @date : 2015. 6. 25.
* @author : 차건강
* @description : Group Board DB와 연결하는 부분
 */
@Component
public class GroupBoardDaoImpl implements GroupBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getGroupBoardCount() {
		return sqlSession.selectOne("groupBoard.dao.mapper.groupBoardCount");
	}

	@Override
	public List<GroupBoardDto> getGroupBoardList(int startRow, int endRow) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("groupBoard.dao.mapper.groupBoardList", map);
	}

	@Override
	public int groupBoardWrite(GroupBoardDto groupBoardDto) {
		return sqlSession.insert("groupBoard.dao.mapper.groupBoardInsert", groupBoardDto);
	}

	@Override
	public GroupBoardDto groupBoardRead(int groupBoardNum) {
		GroupBoardDto groupBoard=null;
		
		try{
			sqlSession.update("groupBoard.dao.mapper.groupReadCount", groupBoardNum);
			groupBoard=sqlSession.selectOne("groupBoard.dao.mapper.groupBoardRead",groupBoardNum);
		}catch(Exception e){
			sqlSession.rollback();
		}
		return groupBoard;
	}

	@Override
	public int boardDelete(int groupBoardNum) {
		return sqlSession.update("groupBoard.dao.mapper.groupBoardDelete", groupBoardNum);
	}

	@Override
	public int groupBoardUpdate(GroupBoardDto groupBoardDto) {
		return sqlSession.update("groupBoard.dao.mapper.groupBoardUpdate", groupBoardDto);
	}

}
