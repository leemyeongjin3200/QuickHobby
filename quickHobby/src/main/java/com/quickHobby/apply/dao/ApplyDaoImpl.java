package com.quickHobby.apply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.apply.dto.ApplyDto;

/*
 * @name        : ApplyDaoImpl
 * @date        : 2015. 6. 22.
 * @author      : ���α�
 * @description : Apply Table DAO
 */
@Component
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * @name        : insertFile
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ������ ÷�ε� ��û�Խù� ����.
	 */
	public int insertFile(ApplyDto applyDto){
		return sqlSession.insert("applyInsertFile", applyDto);
	}
	
	/*
	 * @name        : insert
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ������ ÷�ε��� ���� ��û�Խù� ����.
	 */
	public int insert(ApplyDto applyDto){
		return sqlSession.insert("applyInsert", applyDto);
	}
	
	/*
	 * @name        : getListByCreateDate
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խù����� ����� �ֱ� ������ ������� �ҷ���.
	 */
	public List<ApplyDto> getListByCreateDate(){
		return sqlSession.selectList("getListByCreateDate");
	}
	
	/*
	 * @name        : getApplyDto
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ��û�Խù� ������ �ҷ���.
	 */
	public ApplyDto getApplyDto(int apply_num){
		return sqlSession.selectOne("getApplyDto", apply_num);
	}
	
	/*
	 * @name        : incrementReadcount
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ��û�Խù��� ��ȸ���� 1 ����.
	 */
	public void incrementReadcount(int apply_num){
		sqlSession.update("incrementReadcount", apply_num);
	}
	
	/*
	 * @name        : delete
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ��û�Խù��� ����.
	 */
	public int delete(int apply_num){
		return sqlSession.delete("applyDelete", apply_num);
	}
	

	/*
	 * @name        : update
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ��û�Խù� ����(���� ÷�ΰ� ���� ��).
	 */
	public int update(ApplyDto applyDto){
		return sqlSession.update("applyUpdate", applyDto);
	}
	
	/*
	 * @name        : updateFile
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ��û�Խù� ����(���� ÷�ν�)
	 */
	public int updateFile(ApplyDto applyDto){
		return sqlSession.update("applyUpdateFile", applyDto);
	}
}
