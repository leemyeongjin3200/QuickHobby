package com.quickHobby.apply.dao;

import java.util.HashMap;
import java.util.List;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.member.dto.MemberDto;

public interface ApplyDao {
	public int insertFile(ApplyDto applyDto);
	public int insert(ApplyDto applyDto);
	public List<ApplyDto> getListByCreateDate();
	public ApplyDto getApplyDto(int apply_num);
	public void incrementReadcount(int apply_num);
	public int delete(int apply_num);
	public int update(ApplyDto applyDto);
	public int updateFile(ApplyDto applyDto);
	public int getJoins(int applyNum);
	public int getRecommends(int applyNum);
	public MemberDto getHost(int apply_num);
	public int memberRecommend(HashMap<String, Integer> memberMap);
	public int memberGroups(int memberNum);
	public int isJoinGroup(HashMap<String, Integer> memberMap);
	public int addRecommend(HashMap<String, Object> hMap);
	public int incrementRecommend(int board_num);
	public int removeRecommend(HashMap<String, Object> hMap);
	public int decrementRecommend(int board_num);
	public int getReports(int apply_num);
}
