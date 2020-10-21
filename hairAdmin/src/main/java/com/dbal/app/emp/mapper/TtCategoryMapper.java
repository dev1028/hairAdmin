package com.dbal.app.emp.mapper;

import java.util.List;
import java.util.Map;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.TtCategoryVo;

public interface TtCategoryMapper {

	public void tmicDelete(TtCategoryVo vo) ;

	public List<TtCategoryVo> getTmacList(TtCategoryVo vo);

	public List<TtCategoryVo> getTmicList(TtCategoryVo vo);

	public List<TtCategoryVo> getRequestTmicList(TtCategoryVo vo);

	public void tmicUpdate(TtCategoryVo vo);

	public void tmicInsert(TtCategoryVo vo);
}

