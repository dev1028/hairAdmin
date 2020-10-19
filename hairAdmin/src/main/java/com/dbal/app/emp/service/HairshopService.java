package com.dbal.app.emp.service;

import java.util.List;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.HairshopVo;


public interface HairshopService {

	
	public List<HairshopVo> getHairshopList(HairshopVo vo);
	public List<HairshopVo> getNewHairshopList(HairshopVo vo);
	
	
	
}
