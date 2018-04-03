<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	 <script src=<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>

<div class = "container">
	<div class = "page-header">
		<h1>회원가입</h1>
	</div>
<form action = "elTest.jsp" method = "post">
	<div class = "row">
	<%
	//JDBC 변수 선언 
		Connection conn = null;   //like 등산복
		Statement stmt = null;    //like 등산화
		ResultSet rs = null; //select를 한 결과를 담는 객체, like 지팡이
		PreparedStatement pstmt = null;
		
	try{
	%>
	
	<h3>회원 상세정보</h3>
	
	<table class ="table table-striped">
		<tbody>
			<tr>
				<th>ID</th>
				<td>
					<input type ="text" name = "mem_id" value = "">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type ="text" name = "mem_name" value = ""></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type ="text" name = "mem_pwd" value = ""></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type ="text" name = "mem_phone" value = ""></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type ="text" name = "mem_email" value = ""></td>
			</tr>
		</tbody>
	</table>
	</div>
	<div class = "row">
		<div class = "col-md-6 col-md-offset-8">
				<a href = "BoardInsert.jsp>"><button type = "submit" class = "btn btn-sm btn-success">저장</button></a>
		</div>
	</div>
</form>
<%
}finally {
	if(rs!=null) try {rs.close();} catch(SQLException e){}
	if(stmt!=null) try {stmt.close();} catch(SQLException e){}
	
	//연결 세션은 꼭 닫아야 한다.
	if(conn!=null) try {conn.close();} catch(SQLException e){}
	//자원 해제를 안하면 DB가 셧다운 된다.
}
%>
</div>
</body>
</html>