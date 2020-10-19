package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.DesignerVo;
import com.dbal.app.emp.HairshopVo;
import com.dbal.app.emp.MembersVo;

@Repository
public class CustomerDAO {

	@Autowired private SqlSessionTemplate mybatis;
	
		
	public List<HairshopVo> getHairshopList(HairshopVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.HairshopDAO.getHairshopList",vo);
	}
	public List<HairshopVo> getNewHairshopList(HairshopVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.HairshopDAO.getNewHairshopList",vo);
	}
	
	public List<MembersVo>getMemberList(MembersVo vo){
		return mybatis.selectList("com.dbal.app.emp.mapper.CustomerDAO.getMemberList",vo);
	}
	
	public List<DesignerVo>getDesignerList(DesignerVo vo){
		List<DesignerVo> list = mybatis.selectList("com.dbal.app.emp.mapper.CustomerDAO.getDesgienrList",vo);
		System.out.println("dao"+list.toString());
		return mybatis.selectList("com.dbal.app.emp.mapper.CustomerDAO.getDesgienrList",vo);
	}
	
}
