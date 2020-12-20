package com.dbal.app.emp.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dbal.app.emp.AnalysisVo;
import com.dbal.app.emp.service.AnalysisService;

import net.sf.json.JSONArray;

@Controller
public class AnalysisController {

	@Autowired
	AnalysisService analysisService;

	@RequestMapping("/admin/adminAnalysisByTreat.do")
	public String analysisByTreatRank(Model model) {

		return "coupon/adminAnalysisByTreat";
	}

	@RequestMapping("/admin/adminAnalysisByHairshop.do")
	public String analysisByHairshop(Model model) {

		return "coupon/adminAnalysisByHairshop";
	}

	@RequestMapping(value = "/ajax/adminAnalysisByTreatRank.do", method = RequestMethod.GET

	)
	public @ResponseBody List<AnalysisVo> jaxView(HttpServletResponse response) {

		return analysisService.getRankByTreat(null);


	}
	// 공지사항 목록

	@RequestMapping("/admin/hairshopAnalysis.do")
	public String analysisByT(Model model) {
		AnalysisVo vo = new AnalysisVo();
		vo.setDate("2020-10");
		List<AnalysisVo> rsvlist = analysisService.getRankByRsvHairshop(vo);
		model.addAttribute("rsvlist", rsvlist);
		model.addAttribute("rsvjsonlist", JSONArray.fromObject(rsvlist));

		List<AnalysisVo> saleslist = analysisService.getRankBySalesHairshop(vo);
		model.addAttribute("saleslist", saleslist);
		model.addAttribute("salesjsonlist", JSONArray.fromObject(saleslist));
		List<AnalysisVo> ratelist = analysisService.getRankByRateHairshop(vo);
		model.addAttribute("ratelist", ratelist);
		model.addAttribute("ratejsonlist", JSONArray.fromObject(ratelist));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminAnalysisByHairshop";
	}

}
