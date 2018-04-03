<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<fmt:setLocale value="en"/>
<fmt:bundle basename="resource.message">  <!-- 범위 지정 -->
  <head> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><fmt:message key = "MEMBER.TITLE"/></title>
    
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	 <script src=<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>
<div class = "container">
	<div class = "page-header">
		<h1>게시글 보기</h1>
	</div>
	<div class = "row">
	<h3>상세보기</h3>
	<div>
		<table class ="table table-striped">
			<tbody>
				<c:if test = "${not empty board}">
					<tr>
						<th>제목</th>
						<td>${board.bo_title}</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>${board.bo_writer}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><div>${board.bo_content}</div></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${board.bo_reg_date}</td>
					</tr>
				</c:if>
				<c:if test = "${empty board}">
					<tr>
						<td>잘못됐습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		</div>
			<div class = "row">
				<div class = "col-md-6">
					<a href = "boardList.do" class = "btn btn-sm btn-warning">목록으로</a>
				</div>
				<div class = "col-md-6 text-right">
						<a href = "boardEdit.do?bo_no=${board.bo_no}" class = "btn btn-sm btn-success">수정</a>
				</div>
			</div>
		</div>
</div>
</body>
</fmt:bundle> <!-- 범위 지정 끝부분 -->
</html>