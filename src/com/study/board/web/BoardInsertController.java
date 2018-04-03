package com.study.board.web;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class BoardInsertController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		
		String viewPage = "/WEB-INF/view/board/boardInsert.jsp";
		Board board = new Board();		
		
		try {
			BeanUtils.populate(board, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		//ip 설정 , 상대방에서 넘어오는 데이터가 아니므로 직접 set해서 더 넣어줘야한다.
		board.setBo_ip(request.getRemoteAddr());
		BoardServiceImpl boardService = new BoardServiceImpl();
		int cnt = boardService.registBoard(board);
		//request에 값을 담았고 , 그다음 페이지에서 ${message}를 쓰면서 값을 확인할 수 있다.
		if(cnt > 0) {
			request.setAttribute("message", "성공입니다");
		}else {
			request.setAttribute("message", "실패했습니다.");
		}
		request.setAttribute("board", board);
		return viewPage;
	}
}
