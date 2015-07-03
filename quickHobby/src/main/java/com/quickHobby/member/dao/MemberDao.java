package com.quickHobby.member.dao;

import java.util.HashMap;

import com.quickHobby.member.dto.MemberDto;

public interface MemberDao {
	public int registerOk(MemberDto memberDto);
	public MemberDto loginOk(HashMap<String, String> hMap);
	public String getFile(int memberNum);
	public int updateOk(MemberDto member);
	public MemberDto getMember(int memberNum);
	public String nicknameCheck(String nickname);
}
