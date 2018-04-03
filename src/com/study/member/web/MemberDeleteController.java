package com.study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;



public class MemberDeleteController implements IController{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		//jsp에서 넘어온 request, response객체를 어떻게 받고 어떻게 보내줄꺼야 라는 인터페이스 객체?이다.
		//jsp(사용자 브라우저)에서 넘겨온 파라미터 값 name이 mem_id인 것을 request 객체로 받아 오겠다고 선언
		String mem_id = request.getParameter("mem_id");
		//log
		System.out.println(mem_id);
		
		//비지니스 로직을 여기서 실행 시킬것이다. DB연결도 되고 Query가 실행이 되고 여러가지 영역이 실행되는 영역...!!!!! 이것이 service 클래스
		//트랜잭션 걸고 , commit , rollback 하는 것도 service쪽에서 이루어진다.
		//데이터 베이스 레코드가 생성된게 인스턴스가 생성이 된것이다.
		MemberServiceImpl memService = new MemberServiceImpl();
		Member member = new Member();
		member.setMem_id(mem_id);
		
		try {
			memService.deleteMember(member);
			request.setAttribute("message", "삭제 성공했습니다.");
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		return "/WEB-INF/view/member/memberDelete.jsp";
	}
}
