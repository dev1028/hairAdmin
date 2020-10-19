package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.DesignerVo;
import com.dbal.app.emp.HairshopVo;
import com.dbal.app.emp.MembersVo;
import com.dbal.app.emp.mapper.CouponMapper;
import com.dbal.app.emp.mapper.CustomerMapper;
import com.dbal.app.emp.mapper.HairshopDAO;
import com.dbal.app.emp.mapper.HairshopMapper;
import com.dbal.app.emp.service.CustomerService;
import com.dbal.app.emp.service.HairshopService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	HairshopMapper HairshopDAO;
	@Autowired
	CustomerMapper CustomerDAO;


	@Override
	public List<HairshopVo> getHairshopList(HairshopVo vo) {
		// TODO Auto-generated method stub
		return HairshopDAO.getHairshopList(vo);
	}
	@Override
	public List<HairshopVo> getNewHairshopList(HairshopVo vo) {
		// TODO Auto-generated method stub
		return HairshopDAO.getNewHairshopList(vo);
	}
	@Override
	public List<DesignerVo> getDesignerList(DesignerVo vo) {
		List<DesignerVo> list = CustomerDAO.getDesignerList(null);
		System.out.println("impl"+list.toString());
		return CustomerDAO.getDesignerList(vo);
	}
	@Override
	public List<MembersVo> getMemberList(MembersVo vo) {
		return CustomerDAO.getMemberList(vo);
	}
}
