package com.quickHobby.reoprt.dao;

import java.util.List;

import com.quickHobby.report.dto.ReportDto;


public interface ReportDao {
	public int getReportCount();
	public List<ReportDto> getReportList(int startRow, int endRow);
}
