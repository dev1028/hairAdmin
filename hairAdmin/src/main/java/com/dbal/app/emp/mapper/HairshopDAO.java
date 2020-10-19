package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.EmpVOvo;
import com.dbal.app.emp.HairshopVo;

@Repository
public class HairshopDAO {

	@Autowired private SqlSessionTemplate mybatis;
	
		
	public List<HairshopVo> getHairshopList(HairshopVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.HairshopDAO.getHairshopList",vo);
	}
	public List<HairshopVo> getNewHairshopList(HairshopVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.HairshopDAO.getNewHairshopList",vo);
	}
	//getName 메서드 선언
	//getCnt 메서드 선언
	//getEmpMap 메서드 선언
}
