package com.quickHobby.report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.report.dto.ReportDto;

@Component
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getReportCount(){
		return sqlSession.selectOne("getReportCount");
	}

	@Override
	public List<ReportDto> getReportList(int startRow, int endRow) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("getReportList", map);
	}
}
