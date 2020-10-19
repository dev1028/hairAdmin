package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.DesignerVo;
import com.dbal.app.emp.EmpVo;
import com.dbal.app.emp.HairshopVo;
import com.dbal.app.emp.MembersVo;
import com.dbal.app.emp.mapper.CustomerDAO;
import com.dbal.app.emp.mapper.HairshopDAO;
import com.dbal.app.emp.mapper.MainMapper;
import com.dbal.app.emp.service.CustomerService;
import com.dbal.app.emp.service.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainMapper MainDAO;

	@Override
	public EmpVo getLoginInfo(EmpVo vo) {
		// TODO Auto-generated method stub
		return MainDAO.getLoginInfo(vo);
	}
}
