package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dbal.app.emp.EmpVOvo;

@Repository
public class EmpDAO {

	@Autowired private SqlSessionTemplate mybatis;
	
	public EmpVOvo getEmp(EmpVOvo empVO) {
		return mybatis.selectOne("com.dbal.app.emp.mapper.EmpDAO.getEmp",empVO );
	}	
	public List<EmpVOvo> getEmpList(EmpVOvo empVO) {
		return mybatis.selectList("com.dbal.app.emp.mapper.EmpDAO.getEmpList",empVO);
	}
	public void insertEmp(EmpVOvo empVO) {
		mybatis.insert("com.dbal.app.emp.mapper.EmpDAO.insertEmp", empVO);
	}
	//getName 메서드 선언
	//getCnt 메서드 선언
	//getEmpMap 메서드 선언
}
