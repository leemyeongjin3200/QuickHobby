package com.quickHobby.apply.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.report.dto.ReportDto;

/*
 * @name        : ApplyDaoImpl
 * @date        : 2015. 6. 22.
 * @author      : 서인구
 * @description : Apply Table DAO
 */
@Component
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * @name        : insertFile
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 사진이 포함된 신청게시물을 DB에 저장
	 */
	public int insertFile(ApplyDto applyDto){
		return sqlSession.insert("applyInsertFile", applyDto);
	}
	
	/*
	 * @name        : insert
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 사진이 포함되지 않은 신청 게시물을 DB에 저장
	 */
	public int insert(ApplyDto applyDto){
		return sqlSession.insert("applyInsert", applyDto);
	}
	
	/*
	 * @name        : getListByCreateDate
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물들의 리스트를 생성 순서대로 가져온다.
	 */
	public List<ApplyDto> getListByCreateDate(){
		return sqlSession.selectList("getListByCreateDate");
	}
	
	/*
	 * @name        : getApplyDto
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청 게시물의 ATO를 가져온다.
	 */
	public ApplyDto getApplyDto(int apply_num){
		return sqlSession.selectOne("getApplyDto", apply_num);
	}
	
	/*
	 * @name        : incrementReadcount
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청 게시물의 조회수를 1 증가시킨다.
	 */
	public void incrementReadcount(int apply_num){
		sqlSession.update("incrementReadcount", apply_num);
	}
	
	/*
	 * @name        : delete
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청 게시물을 DB에서 삭제한다.
	 */
	public int delete(int apply_num){
		return sqlSession.delete("applyDelete", apply_num);
	}
	

	/*
	 * @name        : update
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 사진 변동이 없는 신청 게시물을 수정한다.
	 */
	public int update(ApplyDto applyDto){
		return sqlSession.update("applyUpdate", applyDto);
	}
	
	/*
	 * @name        : updateFile
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 사진 변동이 있는 신청 게시물을 수정한다.
	 */
	public int updateFile(ApplyDto applyDto){
		return sqlSession.update("applyUpdateFile", applyDto);
	}
	
	public int getJoins(int applyNum){
		return sqlSession.selectOne("getJoins", applyNum);
	}
	
	public int getRecommends(int applyNum){
		return sqlSession.selectOne("getRecommends", applyNum);
	}
	
	public MemberDto getHost(int apply_num){
		return sqlSession.selectOne("getHost", apply_num);
	}
	
	public int memberRecommend(HashMap<String, Integer> memberMap){
		return sqlSession.selectOne("memberRecommend", memberMap);
	}
	
	public int memberGroups(int memberNum){
		return sqlSession.selectOne("memberGroups", memberNum);
	}
	
	public int isJoinGroup(HashMap<String, Integer> memberMap){
		return sqlSession.selectOne("isJoinGroup", memberMap);
	}
	
	public int addRecommend(HashMap<String, Object> hMap){
		return sqlSession.insert("addRecommend", hMap);
	}
	
	public int incrementRecommend(int board_num){
		return sqlSession.update("incrementRecommend", board_num);
	}
	
	public int removeRecommend(HashMap<String, Object> hMap){
		return sqlSession.delete("removeRecommend", hMap);
	}
	
	public int decrementRecommend(int board_num){
		return sqlSession.update("decrementRecommend", board_num);
	}
	
	public int getReports(int apply_num){
		return sqlSession.selectOne("getReports", apply_num);
	}
	
	public int insertReport(ReportDto reportDto){
		return sqlSession.insert("insertReport", reportDto);
	}
}
