package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.CouponVo;
import com.dbal.app.emp.NoticeVo;
import com.dbal.app.emp.QnaVo;
import com.dbal.app.emp.mapper.BoardMapper;
import com.dbal.app.emp.mapper.CouponDAO;
import com.dbal.app.emp.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper BoardDAO;

	@Override
	public List<QnaVo> getQnaList(QnaVo vo) {
		return BoardDAO.getQnaList(vo);
	}

	@Override
	public int qnaInsert(QnaVo vo) {
		return BoardDAO.qnaInsert(vo);
	}

	@Override
	public int qnaDelete(String[] vo) {
		// TODO Auto-generated method stub
		return BoardDAO.qnaDelete(vo);
	}

	@Override
	public int qnaUpdate(QnaVo vo) {
		return BoardDAO.qnaUpdate(vo);
	}

	@Override
	public List<NoticeVo> getNoticeList(NoticeVo vo) {
		return BoardDAO.getNoticeList(vo);
	}

	@Override
	public int noticeInsert(NoticeVo vo) {
		return BoardDAO.noticeInsert(vo);
	}

	@Override
	public int noticeDelete(String[] vo) {
		return BoardDAO.noticeDelete(vo);
	}

	@Override
	public int noticeUpdate(NoticeVo vo) {
		return BoardDAO.noticeUpdate(vo);
	}

	@Override
	public int answerInsert(QnaVo vo) {
		return BoardDAO.answerInsert(vo);
	}

	@Override
	public int updateRePos(QnaVo vo) {
		return BoardDAO.updateRePos(vo);
	}

	@Override
	public QnaVo qnaSelectOne(QnaVo vo) {
		return BoardDAO.qnaSelectOne(vo);
	}

	@Override
	public NoticeVo noticeSelectOne(NoticeVo vo) {
		return BoardDAO.noticeSelectOne(vo);
	}

}
