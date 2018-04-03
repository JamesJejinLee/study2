package com.study.board.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class BoardViewController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		String bo_no = request.getParameter("bo_no");
		if(bo_no == null  || bo_no.trim().equals("")) {
			return "redirect:/member/memberList.do";
		}
		
		BoardServiceImpl boardService = new BoardServiceImpl();
		BoardSearch boardSearch = new BoardSearch();
		Board board = boardService.getBoard(Integer.parseInt(bo_no));
		request.setAttribute("search", boardSearch);
		request.setAttribute("board", board);
		String viewPage = "/WEB-INF/view/board/boardView.jsp";
		return viewPage;
	}
}