package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.AnalysisVo;
import com.dbal.app.emp.mapper.AnalysisMapper;
import com.dbal.app.emp.service.AnalysisService;

@Service
public class AnalysisServiceImpl implements AnalysisService {

	@Autowired
	 AnalysisMapper AnalysisDAO;

	@Override
	public List<AnalysisVo> getRankByTreat(AnalysisVo vo) {
		return AnalysisDAO.getRankByTreat(vo);
	}

	@Override
	public List<AnalysisVo> getRankBySalesHairshop(AnalysisVo vo) {
		return AnalysisDAO.getRankBySalesHairshop(vo);
	}

	@Override
	public List<AnalysisVo> getRankByRsvHairshop(AnalysisVo vo) {
		// TODO Auto-generated method stub
		return AnalysisDAO.getRankByRsvHairshop(vo);
	}

	@Override
	public List<AnalysisVo> getRankByRateHairshop(AnalysisVo vo) {
		// TODO Auto-generated method stub
		return AnalysisDAO.getRankByRateHairshop(vo);
	}


}
