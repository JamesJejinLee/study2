<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>

	Lee 사이트
	<%
		Member member = (Member)session.getAttribute("LOGIN");
		if(member != null) {
	%>
			<!-- 로그인 상태인 경우 -->
			<%=member.getMem_name()%>님!!!<br>
			안녕하세요~~~ <br>
	<%
		}else {
	%>
			로그인 해주세요.	
			<a href = "<%=request.getContextPath()%>/12/login.jsp">로그인</a>			
	<% 		
		}
	%>
	
	<a href = "<%=request.getContextPath()%>/index.jsp"></a>
	<a href = "<%=request.getContextPath()%>/member/memberList.do">회원관리</a>
	<a href = "<%=request.getContextPath()%>/board/boardList.do">게시판</a>
	<a href = "<%=request.getContextPath()%>/12/logout.jsp">로그아웃</a>     <!-- 절대경로로 쓰는게 좋다. -->
	<!-- 왜냐하면 top.jsp는 index를 위한게 아니라 /study에 있는 모든 jsp들이 참고 할 수 있으니까...! -->
	
	<!-- 비 로그인 상태인 경우 -->	
	<a href = " <%= request.getContextPath()%>/12/login.jsp">로그인</a>
</div>