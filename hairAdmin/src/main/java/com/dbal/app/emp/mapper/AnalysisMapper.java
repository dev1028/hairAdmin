package com.dbal.app.emp.mapper;

import java.util.List;

import com.dbal.app.emp.AnalysisVo;

public interface AnalysisMapper {

	public List<AnalysisVo> getRankByTreat(AnalysisVo vo);

	public List<AnalysisVo> getRankBySalesHairshop(AnalysisVo vo);

	public List<AnalysisVo> getRankByRsvHairshop(AnalysisVo vo);

	public List<AnalysisVo> getRankByRateHairshop(AnalysisVo vo);
}
