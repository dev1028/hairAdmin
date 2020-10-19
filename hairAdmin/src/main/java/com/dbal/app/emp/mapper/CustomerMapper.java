package com.dbal.app.emp.mapper;

import java.util.List;

import com.dbal.app.emp.DesignerVo;
import com.dbal.app.emp.HairshopVo;
import com.dbal.app.emp.MembersVo;

public interface CustomerMapper {


	public List<HairshopVo> getHairshopList(HairshopVo vo);
	public List<HairshopVo> getNewHairshopList(HairshopVo vo);
	public List<DesignerVo> getDesignerList(DesignerVo vo);
	public List<MembersVo> getMemberList(MembersVo vo);

}

