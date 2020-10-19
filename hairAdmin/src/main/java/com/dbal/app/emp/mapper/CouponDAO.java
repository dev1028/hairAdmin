package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.EmpVOvo;

@Repository
public class CouponDAO {

	@Autowired private SqlSessionTemplate mybatis;
	
	public void couponDelete(String[] hsc_no) {
		 mybatis.delete("com.dbal.app.emp.mapper.CouponDAO.couponDelete",hsc_no );
	}	
	public List<CouponVo> getCouponList(CouponVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.CouponDAO.getCouponList",vo);
	}
	public void couponInsert(CouponVo vo) {
		mybatis.insert("com.dbal.app.emp.mapper.CouponDAO.couponInsert", vo);
	}
	//getName 메서드 선언
	//getCnt 메서드 선언
	//getEmpMap 메서드 선언
}
