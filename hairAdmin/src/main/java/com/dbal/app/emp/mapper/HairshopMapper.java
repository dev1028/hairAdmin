package com.dbal.app.emp.mapper;

import java.util.List;
import java.util.Map;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.HairshopVo;

public interface HairshopMapper {


	public List<HairshopVo> getHairshopList(HairshopVo vo);
	public List<HairshopVo> getNewHairshopList(HairshopVo vo);

}

