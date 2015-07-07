package com.quickHobby.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.member.dto.MemberDto;

/**
* @name : MemberDaoImpl
* @date : 2015. 6. 25.
* @author : 이명진
* @description : Service클래스에서 처리한 데이터를 DB에 저장 및 가져오기 위한 클래스
 */
@Component
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	* @name : registerOk
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원가입시 입력된 데이터를 member 테이블에 저장하기 위한 메소드
	 */
	@Override
	public int registerOk(MemberDto memberDto) {
		// TODO Auto-generated method stub
		if(memberDto.getMemberFileName()!=null){
			return sqlSession.insert("member.dao.mapper.registerOkFile", memberDto);
		}else{
			return sqlSession.insert("member.dao.mapper.registerOk", memberDto);
		}
		
	}

	/**
	* @name : loginOk
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 로그인 시 해당하는 아이디, 비밀번호와 일치하는 데이터를 DB에서 찾는 메소드
	 */
	@Override
	public MemberDto loginOk(HashMap<String, String> hMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.dao.mapper.loginOk", hMap);
	}

	/**
	* @name : getFile
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원번호를 통해 해당 회원의 프로필사진 경로를 가져오는 메소드
	 */
	@Override
	public String getFile(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.dao.mapper.getFile", memberNum);
	}

	/**
	* @name : updateOk
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원정보수정 시 입력된 데이터로 member테이블을 수정하는 메소드
	 */
	@Override
	public int updateOk(MemberDto member) {
		// TODO Auto-generated method stub
		if(member.getMemberFileName()!=null){
			return sqlSession.update("member.dao.mapper.updateOkFile", member);
		}else{
			return sqlSession.update("member.dao.mapper.updateOk", member);
		}
		
	}

	/**
	* @name : getMember
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 해당하는 회원번호로 회원의 정보를 가져오는 메소드
	 */
	@Override
	public MemberDto getMember(int memberNum) {
		return sqlSession.selectOne("member.dao.mapper.getMember", memberNum);
	}

	@Override
	public String checkNickname(String nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.dao.mapper.checkNickname", nickname);
	}

	@Override
	public String checkEmail(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.dao.mapper.checkEmail", email);
	}
}
