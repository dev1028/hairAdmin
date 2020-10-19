package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.EmpVOvo;
import com.dbal.app.emp.mapper.EmpMapper;
import com.dbal.app.emp.service.EmpService;


@Service
public class EmpServiceImpl implements EmpService {

	@Autowired EmpMapper empDAO;
	
	@Override
	public EmpVOvo getEmp(EmpVOvo empVO) {
		return empDAO.getEmp(empVO);
	}

	@Override
	public List<EmpVOvo> getEmpList(EmpVOvo empVO) {
		return empDAO.getEmpList();
	}

	@Override
	public void empInsert(EmpVOvo empVO) {
		//empDAO.insertEmp(empVO);
	}

}
