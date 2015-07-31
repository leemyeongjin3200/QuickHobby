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
* @description : Tip & Review BoardReply DB와 연결
 */
@Component
public class BoardReplyDaoImpl implements BoardReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	* @name : boardReplyWrite
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : 게시물에 댓글 작성시 boardreply 테이블에 정보 저장 
	 */
	@Override
	public int boardReplyWrite(BoardReplyDto boardReplyDto) {
		return sqlSession.insert("boardReply.dao.mapper.boardReplyWrite", boardReplyDto);
	}

	/**
	* @name : getBoardReplyList
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : 게시물에 해당되는 댓글 목록 가져오기
	 */
	@Override
	public List<BoardReplyDto> getBoardReplyList(int boardNum) {
		return sqlSession.selectList("boardReply.dao.mapper.getBoardReplyList", boardNum);
	}

	/**
	* @name : boardReplyModify
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : 수정한 댓글 정보 boardreply 테이블에서 수정
	 */
	@Override
	public int boardReplyModify(BoardReplyDto boardReplyDto) {
		return sqlSession.update("boardReply.dao.mapper.boardReplyModify", boardReplyDto);
	}

	/**
	* @name : boardReplyDelete
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : 삭제할 댓글 boardreply 테이블에서 삭제
	 */
	@Override
	public int boardReplyDelete(BoardReplyDto boardReplyDto) {
		return sqlSession.delete("boardReply.dao.mapper.boardReplyDelete", boardReplyDto);
	}

	/**
	* @name : getBoardReplyCount
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : 게시물의 댓글 갯수 가져온다.
	 */
	@Override
	public int getBoardReplyCount(int boardNum) {
		return sqlSession.selectOne("boardReply.dao.mapper.getBoardReplyCount", boardNum);
	}
}
