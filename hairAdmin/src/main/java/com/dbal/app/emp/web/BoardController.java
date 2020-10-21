package com.dbal.app.emp.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.emp.NoticeVo;
import com.dbal.app.emp.QnaVo;
import com.dbal.app.emp.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	// 공지사항 삭제
	@RequestMapping("/admin/noticeDelete.do")
	public String deleteNotice(String[] notice_no) {
		boardService.noticeDelete(notice_no);
		return "redirect:noticeManage.do";
	}

	// 공지사항 수정
	@RequestMapping("/admin/noticeUpdate.do")
	public String updateNotice(NoticeVo vo) {
		boardService.noticeUpdate(vo);
		return "redirect:adminNoticeManage";
	} // 공지사항 등록

	@RequestMapping("/admin/noticeInsert.do")
	public String insertNotice(NoticeVo vo) {
		boardService.noticeInsert(vo);
		return "redirect:adminNoticeManage";
	}

	// 공지사항 검색
	@RequestMapping("/admin/noticeFind.do")
	public String noticeFind(Model model, NoticeVo vo) {
		model.addAttribute("list", boardService.getNoticeList(vo));
		return "coupon/adminNoticeManage";
	}

	// 공지사항 상세
	@RequestMapping("/admin/adminNoticeView.do")
	public String noticeView(Model model, NoticeVo vo) {
		model.addAttribute("vo", boardService.noticeSelectOne(vo));
		return "coupon/adminNoticeView";
	}

	// 공지사항 목록
	@RequestMapping("/admin/noticeManage.do")
	public String noticeList(Model model) {
		model.addAttribute("list", boardService.getNoticeList(null));
		// model.addAttribute("hairshoplist", boardService.getNoticeList(null));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminNoticeManage";
	}

	// qna 게시판 관리
	@RequestMapping("/admin/qnaManage.do")
	public String qnaList(Model model) {
		model.addAttribute("list", boardService.getQnaList(null));
		// model.addAttribute("hairshoplist", boardService.getNoticeList(null));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminQnaManage";
	}

	// qna 게시글 상세보기
	@RequestMapping("/admin/qnaView.do")
	public String qnaView(Model model, QnaVo vo) {
		System.out.println(vo.toString());
		model.addAttribute("vo", boardService.qnaSelectOne(vo));

		System.out.println("??dfdfdfd----------------");
		return "coupon/adminQnaView";
	}

	// qna 답변 등록
	@RequestMapping("/admin/qnaAnswer.do")
	public String qnaAnswer(Model model, QnaVo vo, HttpSession session) {

		if (vo.getQna_category().equals("답변")) {
			boardService.answerupdate(vo);
			model.addAttribute("vo", boardService.qnaSelectOne(vo));

			return "redirect:qnaManage.do";

		} else {

			//String emp_no = session.getAttribute("empno").toString();
			String emp_no = "51";
			String qna_ref = vo.getQna_no();
			vo.setEmp_no(emp_no);
			vo.setQna_ref(vo.getQna_no());

			QnaVo tempVo = new QnaVo();
			tempVo.setQna_no(qna_ref);
			tempVo = boardService.qnaSelectOne(tempVo);
			String qna_level = tempVo.getQna_level();
			String qna_repos = tempVo.getQna_repos();
			vo.setQna_repos(qna_repos);
			vo.setQna_ref(qna_ref);
			boardService.updateRePos(vo);

			vo.setQna_ref(qna_ref);

			vo.setQna_level(qna_level + 1);
			vo.setQna_repos(qna_repos + 1);
			vo.setQna_contents(vo.getAnswer_contents());
			vo.setQna_title(vo.getAnswer_title());
			model.addAttribute("vo", boardService.answerInsert(vo));

		}

		return "redirect:qnaManage.do";
	}

	// qna 답변 수정
	@RequestMapping("/admin/anwerUpdate.do")
	public String answerUpdate(Model model, QnaVo vo) {

		model.addAttribute("vo", boardService.answerupdate(vo));

		return "coupon/adminQnaView";
	}

	// qna 삭제
	@RequestMapping("/admin/qnaDelete.do")
	public String deleteQna(String[] qna_no) {
		System.out.println(qna_no.toString());
		boardService.qnaDelete(qna_no);
		return "redirect:qnaManage.do";
	}

	// qna 검색
	@RequestMapping("/admin/qnaFind.do")
	public String QnaFind(Model model, QnaVo vo) {
		model.addAttribute("list", boardService.getQnaList(vo));
		return "coupon/adminQnaManage";
	}

	/*
	 * @RequestMapping("/admin/boardSetting.do") public String boardSetting(Model
	 * model, BoardVo vo ) { model.addAttribute("list",
	 * boardService.getBoardList(vo)); return "coupon/adminQnaManage"; }
	 * 
	 * 
	 * @RequestMapping("/admin/boardSetting.do") public String boardCount(Model
	 * model, BoardVo vo ) {
	 * 
	 * boardService.countNew(vo);
	 * 
	 * 
	 * 
	 * model.addAttribute("list", boardService.getBoardList(vo)); return
	 * "coupon/adminQnaManage"; }
	 */

}
