package com.dbal.app.emp.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.emp.EmpVo;
import com.dbal.app.emp.QnaVo;
import com.dbal.app.emp.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService mainService;

//	@RequestMapping(value = "/loginProcess")
	@RequestMapping("/admin/adminLogin.do")
	public String loginProcess(HttpSession session, EmpVo vo) {
		EmpVo resultVo = mainService.getLoginInfo(vo);
		
		
		
		if (resultVo == null) { // 아이디없음
			session.setAttribute("errormsg", "noid");
			return "coupon/adminLogin";
		
		} else {
			if (vo.getEmp_password().equals(resultVo.getEmp_password())) {
				session.setAttribute("loginCheck", true);
				session.setAttribute("login", resultVo);
				session.setAttribute("empno", resultVo.getEmp_no());
				session.setAttribute("empname", resultVo.getEmp_name());
				session.setAttribute("empemail", resultVo.getEmp_email());
				return "redirect:adminMain.do";
				
			} else { // 패스워드 불일치
				session.setAttribute("errormsg", "nopw");
				return "coupon/adminLogin";
			}
		}
		
		
	
	}
	@RequestMapping("/admin/adminMain.do")
	public String main(Model model, HttpSession session) {
	

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminMain";
	}

	@RequestMapping(value = "/login/logoutProcess")
	public String logoutProcess(HttpSession session) {

		session.setAttribute("loginCheck", null);
		session.setAttribute("id", null);

		return "login/adminLogin";
	}

	@RequestMapping(value = "/needLogin")
	public String needLoginPage(HttpSession session) {

		// 세션 검사를 통해 Access control
		if (session.getAttribute("loginCheck") != null) {
			return "needLogin";
		} else {
			return "login";
		}
	}

	

}
