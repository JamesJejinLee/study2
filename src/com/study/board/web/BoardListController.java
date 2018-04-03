package com.study.board.web;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.servlet.IController;

public class BoardListController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();
		BoardSearch boardSearch = new BoardSearch();
		
		// Beanutils 활용 = <jsp:setProperty property = "*" name = "boardSearch"/>
		// currentPage is a parameter that has crossed over from the list.
//		String currentPage = request.getParameter("currentPage");
//		
//		//currentPage != null && Not empty currentPage -> That is, When there is a value !!!
//		if(currentPage != null && !currentPage.trim().equals("")) {
//			boardSearch.setCurrentPage(Integer.parseInt(currentPage));
//		}
		
		try {
			BeanUtils.populate(boardSearch, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		boardSearch.setting(boardService.getBoardCount(boardSearch));;
		List<Board> list = boardService.getBoardList(boardSearch);
		request.setAttribute("list", list);
		request.setAttribute("board", boardSearch);  
		String viewPage = "/WEB-INF/view/board/boardList.jsp";
		return viewPage;
	}
}