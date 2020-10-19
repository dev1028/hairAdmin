package com.dbal.app.emp.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.emp.DesignerVo;
import com.dbal.app.emp.service.CustomerService;
import com.dbal.app.emp.service.HairshopService;

import net.sf.json.JSONArray;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	@Autowired
	HairshopService hairshopService;

	//신규헤어샵목록
	@RequestMapping("/admin/newHairshopList.do")
	public String newHairshop(Model model) {
		model.addAttribute("list", hairshopService.getNewHairshopList(null));
		model.addAttribute("hairshoplist", JSONArray.fromObject(hairshopService.getNewHairshopList(null)));

		return "coupon/adminNewHairshopList";
	}

	// 헤어샵회원관리
	@RequestMapping("/admin/hairshopManage.do")
	public String hairshopManage(Model model) {

		model.addAttribute("list", hairshopService.getHairshopList(null));
		model.addAttribute("hairshoplist", JSONArray.fromObject(hairshopService.getHairshopList(null)));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminHairshopManage";
	}

	// 유저회원관리
	@RequestMapping("/admin/memberManage.do")
	public String memberManage(Model model) {

		model.addAttribute("list", customerService.getMemberList(null));
		model.addAttribute("jsonlist", JSONArray.fromObject(customerService.getMemberList(null)));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminCustomerManage";
	}

	// 디자이너 회원관리
	@RequestMapping("/admin/designerManage.do")
	public String designerManage(Model model) {
		List<DesignerVo> list = customerService.getDesignerList(null);
		System.out.println("ds" + list.toString());
		model.addAttribute("list", customerService.getDesignerList(null));
		model.addAttribute("jsonlist", JSONArray.fromObject(customerService.getDesignerList(null)));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminDesignerManage";
	}
}
