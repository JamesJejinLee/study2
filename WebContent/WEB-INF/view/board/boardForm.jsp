<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>

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
		<h1>게시판 등록</h1>
	</div>
<form action = "boardInsert.do" method = "post">
	<div class = "row">
	<table class ="table table-striped">
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type ="text" name = "bo_title" value = ""></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type ="text" name = "bo_writer" value = ""></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type ="password" name = "bo_passwd" value = ""></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type ="text" name = "bo_email" value = ""></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name = "bo_content"></textarea>
			</tr>
		</tbody>
	</table>
	</div>
	<div class = "row">
		<div class = "col-md-6 col-md-offset-8">
				<a href = "boardInsert.do>"><button type = "submit" class = "btn btn-sm btn-success">저장</button></a>
		</div>
	</div>
</form>
</div>
</body>
</html>