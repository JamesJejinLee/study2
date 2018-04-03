package com.study.board.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class BoardEditController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();
		
		String viewPage = "/WEB-INF/view/board/boardEdit.jsp";
		int bo_no = Integer.parseInt(request.getParameter("bo_no"));
		
		Board board = boardService.getBoard(bo_no);
		request.setAttribute("board", board);
		return viewPage;
	}
}