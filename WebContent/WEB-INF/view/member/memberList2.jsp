<%-- <%@page import="com.study.member.vo.Member"%>
<%@page import="com.study.member.dao.MemberServiceImpl"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>타이틀을 입력하세요!!</title>
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	 <script src="<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>
<div class = "container">
	<div class = "page-header">
		<h1>회원목록</h1>
	</div>
	<div>
		<div class = "col-md-6 col-md-offset-8 text-right">
				<a href = "MemberForm.jsp" class = "btn btn-sm btn-success">회원등록</a>
		</div>
	</div>
	<div class = "row">
	<%
		MemberServiceImpl memberService = new MemberServiceImpl();
		List<Member> list = memberService.getMemberList();
	%>	
	
	<table class = "table table-striped">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<%
				if(list.isEmpty()) {
					
			%>
					<tr>
						<td colspan = "5">목록이 조회되지 않았습니다.</td>
					</tr>
			<%
				}else {
					for(int i=0; i<list.size(); i++) {
						Member member = list.get(i);
						%>
						<tr>
							<td><%=member.getMem_id()%></td>
							<td>
								<a href = "memberView.jsp?mem_id=<%=member.getMem_id()%>">  
									<%=member.getMem_name()%>
								</a>
							</td>
							<td><%=member.getMem_phone()%></td>
							<td><%=member.getMem_email()%></td>
							<td><%=member.getReg_date()%></td>
						</tr>
					<%		
						}			
				}
			%>
		</tbody>	
	</table>
	</div>
</div>
</body>
</html> --%>