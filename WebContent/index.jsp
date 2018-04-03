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
	<style>
		#header {}
		#left {width : 20%; float : left;}
		#contents {width : 80%; float : left;}
		#footer {clear : both;}
	</style>
</head>
<body>
	<div id = "header">
		<div>	<jsp:include page="/include/top.jsp" flush = "false"/> </div>	
		<div>
			<div id = "left">
				<!-- 좌측메뉴 start -->
				<jsp:include page = "/include/left.jsp" flush="false"/>
				<!-- 좌측메뉴 end --></div>
			<div id = "contents">
				<!-- 본문 START -->
				<h3>Main HomePage!</h3>
				<!-- 본문 END -->
			</div>
		</div>	
		<div id = "footer">
				<!--푸터 start -->
				<jsp:include page = "/include/footer.jsp" flush="false"/>
				<!-- 푸터 end -->
		</div>	
	</div>
	<%-- <table>
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
	</table> --%>
</body>
</html>