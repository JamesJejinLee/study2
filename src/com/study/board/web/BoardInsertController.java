package com.study.board.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class BoardInsertController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();
		
		String viewPage = "/WEB-INF/view/board/boardInsert.jsp";
		Board board = new Board();		
		
		board.setBo_title(request.getParameter("bo_title"));
		board.setBo_writer(request.getParameter("bo_writer"));
		board.setBo_passwd(request.getParameter("bo_passwd"));
		board.setBo_email(request.getParameter("bo_email"));
		board.setBo_content(request.getParameter("bo_content"));
		
		int cnt = boardService.registBoard(board);
		//request에 값을 담았고 , 그다음 페이지에서 ${message}를 쓰면서 값을 확인할 수 있다.
		if(cnt > 0) {
			request.setAttribute("message", "성공입니다");
		}else {
			request.setAttribute("message", "실패했습니다.");
		}
		return viewPage;
	}
}
