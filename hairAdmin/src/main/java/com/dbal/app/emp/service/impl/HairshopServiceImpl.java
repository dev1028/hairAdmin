package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.HairshopVo;
import com.dbal.app.emp.mapper.CouponMapper;
import com.dbal.app.emp.mapper.HairshopDAO;
import com.dbal.app.emp.mapper.HairshopMapper;
import com.dbal.app.emp.service.HairshopService;

@Service
public class HairshopServiceImpl implements HairshopService {

	@Autowired
	HairshopMapper HairshopDAO;



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
}
