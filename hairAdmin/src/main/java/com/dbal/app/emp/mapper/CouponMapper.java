package com.dbal.app.emp.mapper;

import java.util.List;
import java.util.Map;

import com.dbal.app.emp.CouponVo;

public interface CouponMapper {

	public void deleteCoupon(CouponVo vo);
	
	public CouponVo getCoupon(CouponVo vo);
	public List<CouponVo> getCouponList(CouponVo vo);
	public void couponInsert(CouponVo vo);
	public int couponDelete(String[] hsc_no);
	
	
	
	public String getName(Integer id);
	public List<Map<String, Object>> getCouponMap();
	public List<Map<String, Object>> getDeptCouponCnt();
}

