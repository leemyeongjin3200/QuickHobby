package com.quickHobby.apply.dao;

import java.util.List;

import com.quickHobby.apply.dto.ApplyDto;

public interface ApplyDao {
	public int insertFile(ApplyDto applyDto);
	public int insert(ApplyDto applyDto);
	public List<ApplyDto> getListByCreateDate();
	public ApplyDto getApplyDto(int apply_num);
	public void incrementReadcount(int apply_num);
	public int delete(int apply_num);
	public int update(ApplyDto applyDto);
	public int updateFile(ApplyDto applyDto);
}
