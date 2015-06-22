package com.quickHobby.apply.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
