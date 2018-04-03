package com.study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class MemberInsertController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		MemberServiceImpl memberService = new MemberServiceImpl();
		String viewPage = "/WEB-INF/view/member/memberInsert.jsp";
		
		Member member = new Member();
		
		member.setMem_id(request.getParameter("mem_id"));
		member.setMem_name(request.getParameter("mem_name"));
		member.setMem_pwd(request.getParameter("mem_pwd"));
		member.setMem_phone(request.getParameter("mem_phone"));
		member.setMem_email(request.getParameter("mem_email"));
		
		int cnt = memberService.insertMember(member);
		//request에 값을 담았고 , 그다음 페이지에서 ${message}를 쓰면서 값을 확인할 수 있다.
		if(cnt > 0) {
			request.setAttribute("message", "성공입니다");
		}else {
			request.setAttribute("message", "실패했습니다.");
		}
		return viewPage;
	}
}
