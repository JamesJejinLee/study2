<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>16/ memberList.jsp</title>
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	 <script src="<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>
<div class = "container">
	<div class = "page-header">
		<h1>게시판 목록</h1>
	</div>
	<div>
		<div class = "col-md-6 col-md-offset-8 text-right">
				<a href = "boardForm.do" class = "btn btn-sm btn-success">게시물 등록</a>
		</div>
	</div>
	
	<div class = "row">
		<!-- 검색폼 -->
		<form action = "" method = "post" >
			검색어 : <select name = "searchType">
						<option value = "all"> 전체</option>
						<option value = "bo_title">제목</option>
						<option value = "bo_writer">작성자</option>
						<option value = "bo_content">내용</option>
					 </select>
				<input type = "text" name = "searchWord" value = "${search.searchWord}">
				<button type = "submit">검색</button>
		</form>
		<!-- searchWord가  all bo_title bo_writer bo_content 이걸들을 끌고 갈 것이다.-->		
		<!-- 컨트롤러가 searchWord와 searchBoard를 받을 준비가 되어있는지 확인!! BoardListController에 들어가라!! -->
	</div>
	
	<div class = "row">
	
	전체 레코드 갯수 : ${board.totalRowCount } <br/> 
	전체 페이지 갯수 : ${board.totalPageCount } <br/>
	시작 페이지 : ${board.startPage} <br/>
	마지막 페이지 : ${board.endPage} <br/>
	페이지 사이즈 : ${board.pageSize} <br/>
	현재 페이지 : ${board.currentPage} <br/>
	
	<table class = "table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>이메일</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test ="${empty list}">
				<tr>
					<td colspan = "5">목록이 조회되지 않았습니다.</td>
				</tr>
			</c:if>
			<c:if test = "${not empty list}">
				<c:forEach var = "board" items = "${list}" varStatus="status">
					<tr>
						<td> ${board.bo_no}</td>
						<td>
							<a href = "boardView.do?bo_no=${board.bo_no}">  
								${board.bo_title}
							</a>
						</td>
						<td> ${board.bo_writer}</td>
						<td> ${board.bo_email}</td>
						<td> ${board.bo_read_cnt}</td>
						<td> ${board.bo_reg_date}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>	
	</table>
	</div>
	<div class = "row">
		<div>
			<ul class="pagination">
				<!-- Left Arrow -->
    			<c:if test = "${board.startPage > 1}">
					<li>
		      			<a href = "boardList.do?currentPage=${board.startPage - 1}">
		        			<span aria-hidden="true">&lt;</span>
		      			</a>
	    			</li>
    			</c:if>
				<c:forEach var = "i" begin ="${board.startPage}" end = "${board.endPage}">
							<li><a href = "boardList.do?currentPage=${i}">${i}</a></li>
				</c:forEach>
				<!-- Right Arrow -->
				<c:if test = "${board.endPage < board.totalPageCount}">
					<li>
		      				<a href = "boardList.do?currentPage=${board.endPage + 1}">
		        			<span aria-hidden="true">&gt;</span>
		      			</a>
	    			</li>
				</c:if>
			</ul>
		</div>	
	</div>
</div>
</body>
</html>