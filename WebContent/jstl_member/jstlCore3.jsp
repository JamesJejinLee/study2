<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	 <script src="<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
  <body>
	<a href ="<%=request.getContextPath()%>/15/memberList.jsp">회원목록</a> <br>
	<a href ="${pageContext.request.contextPath}/15/memberList.jsp">회원목록</a> <br>
	<a href = '<c:url value = "/15/memberList.jsp"/>'>회원목록</a>

	<c:url var = "downUrl" value = "/common/download.do">
		<c:param name = "id" value = "234"/>
		<c:param name = "path" value = "board"/>
	</c:url>
	<a href = "${downUrl}" class = "btn btn-sm btn-primary">
		<span class = "glyphicon glyphicon-floppy-disk"> Down</span>
	</a> 
  </body>
</html>

