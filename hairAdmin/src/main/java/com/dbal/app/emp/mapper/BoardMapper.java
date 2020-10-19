package com.dbal.app.emp.mapper;

import java.util.List;

import com.dbal.app.emp.NoticeVo;
import com.dbal.app.emp.QnaVo;

public interface BoardMapper {

	public List<QnaVo> getQnaList(QnaVo vo);

	public int qnaInsert(QnaVo vo);

	public int qnaDelete(String[] vo);

	public int qnaUpdate(QnaVo vo);

	public int answerInsert(QnaVo vo);

	public int updateRePos(QnaVo vo);

	public QnaVo qnaSelectOne(QnaVo vo);

	public List<NoticeVo> getNoticeList(NoticeVo vo);

	public int noticeInsert(NoticeVo vo);

	public int noticeDelete(String[] vo);

	public int noticeUpdate(NoticeVo vo);

	public NoticeVo noticeSelectOne(NoticeVo vo);
}
