package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.TtCategoryVo;

@Repository
public class TtCategoryDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void tmicDelete(TtCategoryVo vo) {
		mybatis.delete("com.dbal.app.emp.mapper.TtCategoryDAO.tmicDelete", vo);
	}

	public List<TtCategoryVo> getTmacList(TtCategoryVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.TtCategoryDAO.getTmacList", vo);
	}

	public List<TtCategoryVo> getTmicList(TtCategoryVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.TtCategoryDAO.getTmicList", vo);
	}
	public List<TtCategoryVo> getRequestTmicList(TtCategoryVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.TtCategoryDAO.getRequestTmicList", vo);
	}
	public void tmicUpdate(TtCategoryVo vo) {
		mybatis.update("com.dbal.app.emp.mapper.TtCategoryDAO.tmicUpdqte", vo);
	}

	public void tmicInsert(TtCategoryVo vo) {
		mybatis.insert("com.dbal.app.emp.mapper.TtCategoryDAO.tmicInsert", vo);
	}
	// getName 메서드 선언
	// getCnt 메서드 선언
	// getEmpMap 메서드 선언
}
