package com.dbal.app.emp.mapper;

import java.util.List;
import java.util.Map;

import com.dbal.app.emp.EmpVOvo;

public interface EmpMapper {

	public EmpVOvo getEmp(EmpVOvo empVO);
	public List<EmpVOvo> getEmpList();
	public void empInsert(EmpVOvo empVO);
	public String getName(Integer id);
	public List<Map<String, Object>> getEmpMap();
	public List<Map<String, Object>> getDeptEmpCnt();
}

