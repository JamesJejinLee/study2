package com.study.member.web;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.dao.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class MemberFormController implements IController{
		@Override
		public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
			String viewPage = "/WEB-INF/view/member/memberForm.jsp";
			return viewPage;
		}
}