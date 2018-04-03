package com.study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;
//MemberListController 회원 목록만 처리하는 놈, 그런데 IController를 이용해서 process를 강제 오버라이딩 시킨다.
public class MemberListController implements IController{
	//process는 메인 컨트롤러가 해야할 일을 대신 하는 놈이다.
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		MemberServiceImpl memberService = new MemberServiceImpl();
		List<Member> list = memberService.getMemberList();
		request.setAttribute("list", list) ;
		String viewPage = "/WEB-INF/view/member/memberList.jsp";
		return viewPage;
	}
}