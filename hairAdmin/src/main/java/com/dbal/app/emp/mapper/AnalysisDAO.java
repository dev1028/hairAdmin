package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.AnalysisVo;

@Repository
public class AnalysisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	

	public List<AnalysisVo> getRankByTreat(AnalysisVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.AnalysisDAO.getRankByTreat", vo);
	}

	public List<AnalysisVo> getRankBySalesHairshop(AnalysisVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.AnalysisDAO.getRankBySalesHairshop", vo);
	}

	public List<AnalysisVo> getRankByRsvHairshop(AnalysisVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.AnalysisDAO.getRankByRsvHairshop", vo);
	}

	public List<AnalysisVo> getRankByRateHairshop(AnalysisVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.AnalysisDAO.getRankByRateHairshop", vo);
	}



	

}
