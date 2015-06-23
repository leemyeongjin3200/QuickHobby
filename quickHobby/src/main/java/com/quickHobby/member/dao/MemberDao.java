package com.quickHobby.member.dao;

import java.util.HashMap;

import com.quickHobby.member.dto.MemberDto;

public interface MemberDao {
	public int registerOk(MemberDto memberDto);
	public MemberDto loginOk(HashMap<String, String> hMap);
}
