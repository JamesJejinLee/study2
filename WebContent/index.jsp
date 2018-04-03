<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>08/ index.jsp</title>
</head>
<body>
	<table>
		<tr>
			<td colspan = "2">
				<jsp:include page="/include/top.jsp" flush = "false"/> 
			</td>	
		</tr>
		<tr>
			<td>
				<!-- 좌측메뉴 start -->
				<jsp:include page = "/include/left.jsp" flush="false"/>
				<!-- 좌측메뉴 end -->
			</td>
			<td>
				<!-- 본문 START -->
				<h3>Main HomePage!</h3>
				<!-- 본문 END -->
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<!--푸터 start -->
				<jsp:include page = "/include/footer.jsp" flush="false"/>
				<!-- 푸터 end -->
			</td>
		</tr>
	</table>
</body>
</html>