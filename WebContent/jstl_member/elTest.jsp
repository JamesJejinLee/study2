<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>16/ elTest.jsp</title>
    
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> -->
  </head>
  <body>
		mem_id = <%=request.getParameter("mem_id") %><br>
		<%-- el mem_id = ${param.mem_id} <br>
		
		${1000 + "4"} <br>
		${20 div 4 } <br>
		${20 % 3 } <br>
		${20 mod 3 } <br>
		
		${ 4 > 3 } <br>
		${ 4 gt 3 } <br>
		${4 gt 3 and 1 eq 1} <br>
		${4 > 3 && 1 == 1 } <br>
<%
	request.setAttribute("abc", "hello");
%>
		${abc} <br>
		${empty abc}<br>
		${empty param.mem_id}<br>
		
		\${not empty abc} = ${! empty abc } <br>
		\${empty param.mem_id} = ${empty param.mem_id} <br>
		
		${4 > 5 ? '4가 큽니다.':'4가 작습니다.' } <br> --%>
		
<%
	Member member = new Member("hong","홍길동","1234","010-3532-3432","lwd7843@naver.com",1004);
	Member member2 = new Member("lee","이순신","4321","010-9999-9999","lss3292@naver.com",1004);
	
	request.setAttribute("member", member);
	 /*  ${sessionScope.member.mem_id}; */
%>

	${member.mem_id} = ${member.mem_id} <br>
	
	<hr>
	${member.mem_name += '의 마일리지는 ' += member.mem_mileage += "입니다." } <br>		
	
	${arr = [1,2,3,4,5]; ''} <br>
	\${arr[2]} = ${arr[2]}  <br>
	
	<hr>
	<%= member.getMem_name() %> <br>
	<%= member2.getMem_name() %> <br>
	
	${var1 = 1004; var2 = 100; var3 = 100; ''}  <!-- ''은 흔적 지우기 -->
	값은 = ${var1}, ${var1 + var2 + var3}  <br> 
	
	<hr>
	${arr1 = ['홍길동','소향','설현']; ''} <!-- 배열 처럼 보이지만 EL 표기법에서는 list계열이다. -->
	${arr2 = {'name':'홍길동','age':20}; ''} <!-- EL 표기법에서는 Map -->
	
	\${arr1[2]} = ${arr1[2]} <br>
	\${arr1['name']} = ${arr2['name']} <br>
	\${arr1['age']} = ${arr2['age']} <br>

</body>
</html>