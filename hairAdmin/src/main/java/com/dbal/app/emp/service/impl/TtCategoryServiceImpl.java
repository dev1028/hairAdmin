package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.TtCategoryVo;
import com.dbal.app.emp.mapper.TtCategoryMapper;
import com.dbal.app.emp.service.TtCategoryService;

@Service
public class TtCategoryServiceImpl implements TtCategoryService {

	@Autowired
	TtCategoryMapper TtCategoryDAO;

	@Override
	public void tmicDelete(TtCategoryVo vo) {
		TtCategoryDAO.tmicDelete(vo);

	}

	@Override
	public List<TtCategoryVo> getTmacList(TtCategoryVo vo) {
		// TODO Auto-generated method stub
		return TtCategoryDAO.getTmacList(vo);
	}

	@Override
	public List<TtCategoryVo> getTmicList(TtCategoryVo vo) {
		return TtCategoryDAO.getTmicList(vo);
	}

	@Override
	public List<TtCategoryVo> getRequestTmicList(TtCategoryVo vo) {
		return TtCategoryDAO.getRequestTmicList(vo);
	}

	@Override
	public void tmicUpdate(TtCategoryVo vo) {
		TtCategoryDAO.tmicUpdate(vo);

	}

	@Override
	public void tmicInsert(TtCategoryVo vo) {
		TtCategoryDAO.tmicInsert(vo);

	}
}
