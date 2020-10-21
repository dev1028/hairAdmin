package com.dbal.app.emp.web;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dbal.app.emp.TtCategoryVo;
import com.dbal.app.emp.service.TtCategoryService;

import net.sf.json.JSONArray;

@Controller
public class TtCategoryController {

	@Autowired
	TtCategoryService ttCategoryService;
	// 헤어샵회원관리
		@RequestMapping("/admin/ttCategoryRequest.do")
		public String ttrequest(Model model) {

			model.addAttribute("list", ttCategoryService.getRequestTmicList(null));
		
			System.out.println("??dfdfdfd----------------");
			return "coupon/ttCategoryRequest";
		}
	// 헤어샵회원관리
	@RequestMapping("/admin/ttCategoryManage.do")
	public String tt(Model model) {

		model.addAttribute("alist", ttCategoryService.getTmacList(null));
		model.addAttribute("ilist", ttCategoryService.getTmicList(null));
		model.addAttribute("alistjson", JSONArray.fromObject(ttCategoryService.getTmacList(null)));

		System.out.println("??dfdfdfd----------------");
		return "coupon/ttCategoryManage";
	}

	// 헤어샵회원관리
	@RequestMapping("/admin/tmicUpdate.do")

	public @ResponseBody Map<String, Object> tmicUpdate(TtCategoryVo vo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {

		ttCategoryService.tmicUpdate(vo);
		System.out.println("??dfdfdfd----------------");
		return BeanUtils.describe(vo);
	}

	// 헤어샵회원관리
	@RequestMapping("/admin/tmicInsert.do")
	public @ResponseBody Map<String, Object> tmicInsert(TtCategoryVo vo)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {

		ttCategoryService.tmicInsert(vo);

		return BeanUtils.describe(vo);
	}

	// 헤어샵회원관리
	@RequestMapping("/admin/tmicDelete.do")
	@ResponseBody

	public String tmicDelete(TtCategoryVo vo) {
		ttCategoryService.tmicDelete(vo);

		return "1";
	}

}
