package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.EmpVOvo;
import com.dbal.app.emp.mapper.CouponMapper;
import com.dbal.app.emp.mapper.EmpMapper;
import com.dbal.app.emp.service.CouponService;
import com.dbal.app.emp.service.EmpService;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	CouponMapper CouponDAO;

	@Override
	public int couponDelete(String[] hsc_no) {
	return 	CouponDAO.couponDelete(hsc_no);
	}

	@Override
	public List<CouponVo> getCouponList(CouponVo vo) {
		// TODO Auto-generated method stub
		return CouponDAO.getCouponList(vo);
	}

	@Override
	public void couponInsert(CouponVo vo) {
		CouponDAO.couponInsert(vo);

	}

}
