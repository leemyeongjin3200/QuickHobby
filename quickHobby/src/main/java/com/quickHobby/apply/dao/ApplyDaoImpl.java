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
	 * @name        : getJoins
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 해당 그룹에 참여한 회원 수 가져온다.
	 */
	public int getJoins(int applyNum){
		return sqlSession.selectOne("getJoins", applyNum);
	}
	
	/*
	 * @name        : getRecommends
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 해당 그룹에 좋아요 수를 가져온다
	 */
	public int getRecommends(int applyNum){
		return sqlSession.selectOne("getRecommends", applyNum);
	}
	
	/*
	 * @name        : getHost
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 회원번호로 해당회원의 닉네임 가져온다.
	 */
	public MemberDto getHost(int apply_num){
		return sqlSession.selectOne("getHost", apply_num);
	}
	
	/*
	 * @name        : memberRecommend
	 * @date        : 2015. 6. 24.
	 * @author      : 서인구
	 * @description : 현재 로그인된 회원이 해당 게시물에 좋아요를 눌렀는지 안눌렀는지 확인한다
	 */
	public int memberRecommend(HashMap<String, Integer> memberMap){
		return sqlSession.selectOne("memberRecommend", memberMap);
	}
	
	/*
	 * @name        : memberGroups
	 * @date        : 2015. 6. 24.
	 * @author      : 서인구
	 * @description : 현재 로그인된 회원이 가입되어있는 그룹의 갯수를 가져온다.
	 */
	public int memberGroups(int memberNum){
		return sqlSession.selectOne("memberGroups", memberNum);
	}
	
	/*
	 * @name        : isJoinGroup
	 * @date        : 2015. 6. 24.
	 * @author      : 서인구
	 * @description : 현재 로그인된 회원이 해당그룹에 가입되어 있는지 확인한다.
	 */
	public int isJoinGroup(HashMap<String, Integer> memberMap){
		return sqlSession.selectOne("isJoinGroup", memberMap);
	}
	
	/*
	 * @name        : memberRecommend
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : recommend테이블에 회원번호와 그룹번호를 저장한다.
	 */
	public int addRecommend(HashMap<String, Object> hMap){
		return sqlSession.insert("addRecommend", hMap);
	}
	
	/*
	 * @name        : incrementRecommend
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : apply 테이블에 해당 게시물의 좋아요 수를 1증가시킨다.
	 */
	public int incrementRecommend(int board_num){
		return sqlSession.update("incrementRecommend", board_num);
	}
	
	/*
	 * @name        : removeRecommend
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : recommend테이블에 해당회원번호와 그룹번호를 삭제한다
	 */
	public int removeRecommend(HashMap<String, Object> hMap){
		return sqlSession.delete("removeRecommend", hMap);
	}
	
	/*
	 * @name        : decrementRecommend
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : apply 테이블에 해당 게시물의 좋아요 수를 1감소시킨다.
	 */
	public int decrementRecommend(int board_num){
		return sqlSession.update("decrementRecommend", board_num);
	}
	
	/*
	 * @name        : getReports
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : 해당 게시물이 신고받은 횟수를 가져온다.
	 */
	public int getReports(int apply_num){
		return sqlSession.selectOne("getReports", apply_num);
	}
	
	/*
	 * @name        : insertReport
	 * @date        : 2015. 6. 28.
	 * @author      : 서인구
	 * @description : report테이블에 신고한 회원번호와 게시물 번호를 저장한다.
	 */
	public int insertReport(ReportDto reportDto){
		return sqlSession.insert("insertReport", reportDto);
	}
}
