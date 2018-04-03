<%@page import="com.study.board.vo.Board"%>
<%@page import="com.study.board.service.BoardServiceImpl"%>
<%@page import="com.study.member.vo.Member"%>
<%@page import="com.study.member.dao.MemberServiceImpl"%>
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
		<h1>게시글 수정하기</h1>
	</div>
<body>
<form action = "boardUpdate.do" method = "post">
<div class = "row">

<%
	String no = request.getParameter("bo_no");
	BoardServiceImpl boardService = new BoardServiceImpl();
	Board board = boardService.getBoard(Integer.parseInt(no));
	request.setAttribute("board", board);
%>

	<div>
		<table class ="table table-striped">
			<tbody>
			<c:if test ="${not empty board}">
				<tr>
					<th>번호</th>
					<td><input type ="hidden" name = "bo_no" value = "${board.bo_no}">${board.bo_no}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type ="text" name = "bo_title" value = "${board.bo_title}"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><input type ="text" name = "bo_writer" value = "${board.bo_writer}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="60" name = "bo_content">${board.bo_content}</textarea></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${board.bo_reg_date}</td>
				</tr>
			</c:if>
			<c:if test ="${empty board}">
				<tr>
					<td>오류입니다.</td>
				</tr>
			</c:if>
			</tbody>
		</table>
</div>
<div class = "row">
	<div class = "col-md-6 col-xs-4">
		<a href = "boardList.do" class = "btn btn-sm btn-warning">목록으로</a>
	</div>
	<div class = "col-md-6 text-right" class = "btn btn-sm btn-warning">
			<a href = "boardUpdate.do"><button type = "submit" class = "btn btn-sm btn-success">저장</button></a>
	</div>
</div>
</form>
</div>

</body>
</html>