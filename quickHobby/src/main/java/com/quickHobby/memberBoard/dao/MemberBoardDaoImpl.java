package com.quickHobby.memberBoard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.board.dto.BoardDto;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.memberBoard.dto.MemberBoardDto;


/**
 *@name : JesusDaoImpl
 *@date:2015. 7. 2.
 *@author:염상아
 *@description:getSumlist으로 받은 board_writer와 groupboard_writer을 hMap으로 묶어서 mapper로 넘겨준다. 그리고 board 테이블에 있는 board_writer의 값에 해당하는 행과, groupboard 테이블에 있는 groupboard_writer에 해당하는 행을 뽑아오기 위해 mapper에서 union all을 사용하였다. 
                   그리고 해당하는 값들을 모두 뽑아와서  List 형식으로 dto에 값을 반환을 한다. 
 */
@Component
public class MemberBoardDaoImpl implements MemberBoardDao {
	/**
	 * 
	 */
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberBoardDto list(int board_writer) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("dao.boardMapper.boardSelect",board_writer);
	}

	@Override
	public MemberBoardDto list1(int groupboard_writer) {
		return sqlSession.selectOne("dao.boardMapper.groupboardSelect",groupboard_writer);
	}

	@Override
	public int getBoardCount() {

		return sqlSession.selectOne("dao.boardMapper.boardCount");
	}

	@Override
	public List<MemberBoardDto> getBoardList(int board_writer) {

		return sqlSession.selectList("dao.boardMapper.boardList",board_writer);
	}

	@Override
	public int getGroupCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.boardMapper.groupCount");
	}

	@Override
	public List<MemberBoardDto> getGroupList(int groupboard_writer) {

		return sqlSession.selectList("dao.boardMapper.groupList",groupboard_writer);
	}

	@Override
	public int getNum(String memberNickName) {
		return sqlSession.selectOne("dao.boardMapper.getn",memberNickName);
	}

	@Override
	public MemberDto getNumm(String memberNickName) {
		return sqlSession.selectOne("dao.boardMapper.getnn",memberNickName);
	}
	
	@Override
	public List<BoardDto> getSumlist(int memberNum) {
		return sqlSession.selectList("dao.boardMapper.skyList",memberNum);

	}

	public List<BoardDto>getNextList(HashMap<String, String> map){
		return sqlSession.selectList("getNextList", map);
	}


}
