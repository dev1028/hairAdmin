package com.dbal.app.emp.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.EmpVo;

@Repository
public class MainDAO {

	@Autowired private SqlSessionTemplate mybatis;
	
		
	public EmpVo getLoginInfo(EmpVo vo) {
		return mybatis.selectOne("com.dbal.app.emp.mapper.MainDAO.getLoginInfo",vo);
	}
	
	
	
}
