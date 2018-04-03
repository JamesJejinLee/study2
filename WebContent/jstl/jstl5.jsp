<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<%
		application.setAttribute("tokens", "v1=20&v2=30&op=+");
	%>
	<c:forTokens var = "item" items ="${tokens}" delims="&">
		<li>${item}</li>
	</c:forTokens>
</ul>
</body>
</html>