package com.dbal.app.emp.service;

import java.util.List;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.EmpVOvo;


public interface CouponService {

	public List<CouponVo> getCouponList(CouponVo vo);
	public void couponInsert(CouponVo vo);
	public int couponDelete(String[] hsc_no);
	
}
