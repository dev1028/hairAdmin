package com.dbal.app.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.service.CouponService;
import com.dbal.app.emp.service.HairshopService;

@Controller
public class CouponController {

	@Autowired
	CouponService couponService;
	@Autowired
	HairshopService hairshopService;

	// 등록폼
	@RequestMapping("/admin/adminCouponDelete.do")
	public String deleteCoupon(String[] hsc_no) {
		couponService.couponDelete(hsc_no);
		
		return "redirect:adminCouponManage.do";
	}

	// 등록처리
	@RequestMapping("/admin/adminCouponInsertSubmit.do")
	public String insertCoupon(CouponVo vo) {
		couponService.couponInsert(vo);
		return "redirect:adminCouponManage.do";
	}

	// 목록조회
	@RequestMapping("/admin/adminCouponManage.do")
	public String couponList(Model model) {
		model.addAttribute("list", couponService.getCouponList(null));
		model.addAttribute("hairshoplist", hairshopService.getHairshopList(null));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminCouponManage";
	}

}
