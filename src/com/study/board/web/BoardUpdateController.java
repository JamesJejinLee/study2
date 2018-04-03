package com.study.board.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.servlet.IController;

public class BoardUpdateController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();
		String viewPage = "/WEB-INF/view/board/boardUpdate.jsp";
		String bo_no = request.getParameter("bo_no");
/*		String mem_id = request.getParameter("mem_id");
		if(mem_id == null || mem_id.trim().equals("")) {
			return "redirect:/member/memberList.do";
		}
*/		Board board = new Board();
		board.setBo_title(request.getParameter("bo_title"));
		board.setBo_writer(request.getParameter("bo_writer"));
		board.setBo_content(request.getParameter("bo_content"));
		board.setBo_no(Integer.parseInt(bo_no));
		
		int cnt = boardService.modifyBoard(board);
		
		if(cnt > 0) {
			request.setAttribute("message", "회원수정을 완료했습니다.");
		}else {
			request.setAttribute("message", "회원수정에 실패했습니다.");
		}
		return viewPage;
	}
}