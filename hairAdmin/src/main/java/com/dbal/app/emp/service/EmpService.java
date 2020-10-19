package com.dbal.app.emp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dbal.app.emp.EmpVOvo;


public interface EmpService {

	public EmpVOvo getEmp(EmpVOvo empVO);
	public List<EmpVOvo> getEmpList(EmpVOvo empVO);
	public void empInsert(EmpVOvo empVO);
	
}
