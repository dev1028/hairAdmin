package com.dbal.app.emp.service;

import java.util.List;

import com.dbal.app.emp.TtCategoryVo;

public interface TtCategoryService {

	public void tmicDelete(TtCategoryVo vo) ;

	public List<TtCategoryVo> getTmacList(TtCategoryVo vo);

	public List<TtCategoryVo> getTmicList(TtCategoryVo vo);

	public List<TtCategoryVo> getRequestTmicList(TtCategoryVo vo);

	public void tmicUpdate(TtCategoryVo vo);

	public void tmicInsert(TtCategoryVo vo);
}
