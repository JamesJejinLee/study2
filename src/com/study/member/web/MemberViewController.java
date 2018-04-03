package com.study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class MemberViewController implements IController{
	//memberView.jsp에 있던 소스들을 controller로 빼버렸고, memberView.jsp의 자바 소스를 줄였다. 
	// 이게 MVC 2 패턴이다! jsp파일에는 딱 view부분만 있는 것이다.
	//process는 메인 컨트롤러가 해야할 일을 대신 하는 놈이다.
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		MemberServiceImpl memberService = new MemberServiceImpl();
		List<Member> list = memberService.getMemberList();
		request.setAttribute("list", list) ;
		//  /"WEB-INF/view/member/memberList.jsp" 폴더 경로를 바꿔줬기 때문에 이렇게 바꿔줘야한다.
		//  대소문자도 주의해서!
		String viewPage = "/WEB-INF/view/member/memberView.jsp";
		
		String mem_id = request.getParameter("mem_id");
		//아이디가 널이거나 비어있으면 회원목록으로 리다이렉트
		if(mem_id == null || mem_id.trim().equals("")) {
			return "redirect:/member/memberList.do";
		}
		
		Member member = memberService.getMember(request.getParameter("mem_id"));
		//속성에 저장
		request.setAttribute("member", member);
		return viewPage;
	}
}