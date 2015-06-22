package com.quickHobby.apply.dao;

import java.util.List;

import com.quickHobby.apply.dto.ApplyDto;

public interface ApplyDao {
	public int insert(ApplyDto applyDto);
	public List<ApplyDto> getListByCreateDate();
}
