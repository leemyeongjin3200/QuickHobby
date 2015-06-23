package com.quickHobby.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.member.dto.MemberDto;

@Component
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int registerOk(MemberDto memberDto) {
		// TODO Auto-generated method stub
		if(memberDto.getMemberFileName()!=null){
			return sqlSession.insert("member.dao.mapper.registerOkFile", memberDto);
		}else{
			return sqlSession.insert("member.dao.mapper.registerOk", memberDto);
		}
		
	}

	@Override
	public MemberDto loginOk(HashMap<String, String> hMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.dao.mapper.loginOk", hMap);
	}

}
