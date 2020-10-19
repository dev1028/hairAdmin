package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.BoardVo;
import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.DesignerVo;
import com.dbal.app.emp.HairshopVo;
import com.dbal.app.emp.MembersVo;
import com.dbal.app.emp.NoticeVo;
import com.dbal.app.emp.QnaVo;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int answerInsert(QnaVo vo) {
		return mybatis.insert("com.dbal.app.emp.mapper.BoardDAO.answerInsert", vo);
	}

	public QnaVo qnaSelectOne(QnaVo vo) {
		return mybatis.selectOne("com.dbal.app.emp.mapper.BoardDAO.qnaSelectOne", vo);
	}

	public List<QnaVo> getQnaList(QnaVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.BoardDAO.getQnaList", vo);
	}

	public int qnaInsert(QnaVo vo) {
		return mybatis.insert("com.dbal.app.emp.mapper.BoardDAO.qnaInsert", vo);
	}

	public int qnaDelete(String[] vo) {
		return mybatis.delete("com.dbal.app.emp.mapper.BoardDAO.qnaDelete", vo);
	}

	public int qnaUpdate(QnaVo vo) {
		return mybatis.update("com.dbal.app.emp.mapper.BoardDAO.qnaUpdate", vo);
	}

	public int updateRePos(QnaVo vo) {
		return mybatis.update("com.dbal.app.emp.mapper.BoardDAO.updateRePos", vo);
	}

	public List<NoticeVo> getNoticeList(NoticeVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.BoardDAO.getNoticeList", vo);
	}

	public int noticeInsert(NoticeVo vo) {
		return mybatis.insert("com.dbal.app.emp.mapper.BoardDAO.noticeInsert", vo);

	}

	public int noticeDelete(String[] vo) {
		return mybatis.delete("com.dbal.app.emp.mapper.BoardDAO.noticeDelete", vo);
	}

	public int noticeUpdate(NoticeVo vo) {
		return mybatis.update("com.dbal.app.emp.mapper.BoardDAO.noticeUpdate", vo);
	}

	public NoticeVo noticeSelectOne(NoticeVo vo) {
		return mybatis.selectOne("com.dbal.app.emp.mapper.BoardDAO.noticeSelectOne", vo);
	}

//	public List<BoardVo> getBoardList(BoardVo vo) {
//		return mybatis.selectList("com.dbal.app.emp.mapper.BoardDAO.getBoardList", vo);
//	}

	public List<BoardVo> countQna(BoardVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.BoardDAO.countQna", vo);

	}

	public List<BoardVo> countNotice(BoardVo vo) {
		return mybatis.selectList("com.dbal.app.emp.mapper.BoardDAO.countNotice", vo);
	}

}
