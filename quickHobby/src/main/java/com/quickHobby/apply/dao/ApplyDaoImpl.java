package com.quickHobby.apply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.apply.dto.ApplyDto;

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
	 * @description : 파일이 첨부된 신청게시물 저장.
	 */
	public int insertFile(ApplyDto applyDto){
		return sqlSession.insert("applyInsertFile", applyDto);
	}
	
	/*
	 * @name        : insert
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 파일이 첨부되지 않은 신청게시물 저장.
	 */
	public int insert(ApplyDto applyDto){
		return sqlSession.insert("applyInsert", applyDto);
	}
	
	/*
	 * @name        : getListByCreateDate
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청게시물들의 목록을 최근 생성된 순서대로 불러옴.
	 */
	public List<ApplyDto> getListByCreateDate(){
		return sqlSession.selectList("getListByCreateDate");
	}
	
	/*
	 * @name        : getApplyDto
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청게시물 정보를 불러옴.
	 */
	public ApplyDto getApplyDto(int apply_num){
		return sqlSession.selectOne("getApplyDto", apply_num);
	}
	
	/*
	 * @name        : incrementReadcount
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청게시물의 조회수를 1 증가.
	 */
	public void incrementReadcount(int apply_num){
		sqlSession.update("incrementReadcount", apply_num);
	}
	
	/*
	 * @name        : delete
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청게시물을 삭제.
	 */
	public int delete(int apply_num){
		return sqlSession.delete("applyDelete", apply_num);
	}
	

	/*
	 * @name        : update
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청게시물 수정(파일 첨부가 없을 시).
	 */
	public int update(ApplyDto applyDto){
		return sqlSession.update("applyUpdate", applyDto);
	}
	
	/*
	 * @name        : updateFile
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청게시물 수정(파일 첨부시)
	 */
	public int updateFile(ApplyDto applyDto){
		return sqlSession.update("applyUpdateFile", applyDto);
	}
}
