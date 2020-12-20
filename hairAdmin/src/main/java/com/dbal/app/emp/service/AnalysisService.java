package com.dbal.app.emp.service;

import java.util.List;

import com.dbal.app.emp.AnalysisVo;

public interface AnalysisService {

	public List<AnalysisVo> getRankByTreat(AnalysisVo vo);
	public List<AnalysisVo> getRankBySalesHairshop(AnalysisVo vo);
	public List<AnalysisVo> getRankByRsvHairshop(AnalysisVo vo);
	public List<AnalysisVo> getRankByRateHairshop(AnalysisVo vo);

}
