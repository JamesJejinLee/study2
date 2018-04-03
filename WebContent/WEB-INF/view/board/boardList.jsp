<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>타이틀을 입력하세요 !!!</title>
    <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </head>
<body>
<script type="text/javascript">
$(function(){	
	$(".pagination li a", $("#board")).click(function(){    //
			// 페이지값 구하고,  form 에 설정 하고, form submit
		   // alert($(this).data("page"));
		 	var frm = document.forms.frm_search; //form태그의 name의 값을 가져옴
			frm.currentPage.value = $(this).data("page");
			frm.submit(); 
	});
	
	//select 태그에서 name이 listSize인 것
	$('select[name = "listSize"]', $("#board")).change(function (){
		// this를 구하고 form에 설정하고 , form submit
		// alert($(this).data("page"));
		console.log($(this).val());
		var frm = document.forms.frm_search;     //form 태그안에 search
		frm.listSize.value = this.value;
		frm.submit();
	});
});

</script>
<div class="container" id = "board">
<div class="page-header">
	<h2>게시판 목록</h2>
</div>



<div class="row">
<!--  검색폼 -->
<form action="boardList.do" name="frm_search" method="post"  class="form-inline">
	<input type="hidden" name="currentPage" value="${search.currentPage}" >
	<input type="hidden" name="liseSize" value="${search.listSize}" >
	<div class="form-group">
	검색구분 : <select name="searchType" class="form-control">
				   <option value="all"  ${search.searchType eq 'all' ? 'selected="selected"' : '' }  > 전체</option>
					<option value="bo_title" ${search.searchType eq "bo_title" ? 'selected="selected"' : '' } >제목</option>
					<option value="bo_writer" ${search.searchType eq 'bo_writer' ? 'selected="selected"' : '' }>작성자</option>
					<option value="bo_content" ${search.searchType eq 'bo_content' ? 'selected="selected"' : '' }>내용</option> 
				</select>
   </div> 
   <div class="form-group">
   <input type="text" name="searchWord" class="form-control" value="${search.searchWord}" >
   </div>
	 <button type="submit" class="btn btn-primary">검색</button>
	<div class="form-group">
		<select name="listSize" class="form-control">
			<option value="5" ${search.listSize eq '5' ? 'selected="selected"' : '' } >5개씩</option>
			<option value="10" ${search.listSize eq '10' ? 'selected="selected"' : '' }  >10개씩</option>
			<option value="20" ${search.listSize eq '20' ? 'selected="selected"' : '' }  >20개씩</option>
			<option value="30" ${search.listSize eq '30' ? 'selected="selected"' : '' }  >30개씩</option>
		</select>
	</div>
</form>
</div>

<div class="row">
	<div class="col-md-4 col-md-offset-8  text-right">
		<a href="boardForm.do" class="btn btn-sm btn-primary">글등록</a>	
	</div>
</div>

<div class="row">
<%-- 	전체 레코드 갯수 : ${search.totalRowCount } <br/> 
	전체 페이지 갯수 : ${search.totalPageCount } <br/>
	시작 페이지 : ${search.startPage} <br/>
	마지막 페이지 : ${search.endPage} <br/>
	페이지 사이즈 : ${search.pageSize} <br/>
	현재 페이지 : ${search.currentPage} <br/>  --%>

<table class="table table-striped">
	<colgroup>
		<col style="width: 8%;" />
		<col />
		<col style="width: 15%;" />
		<col style="width: 10%;" />
		<col style="width: 15%;" />
	</colgroup>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">목록이 조회되지 않았습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach items="${list}" var="board" >		
				<tr>
					<td>${board.bo_no}</td>					
					<td>
						<a href="boardView.do?bo_no=${board.bo_no}">
							${board.bo_title}
						</a>
					</td>
					<td>${board.bo_writer}</td>
					<td>${board.bo_read_cnt}</td>
					<td>${board.bo_reg_date}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
</div>
<div class="row text-center">
	<div>
		<ul class="pagination">
			<c:if test="${search.startPage > 1}">
				<li><a href="#" data-page="${search.startPage - 1}">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${search.startPage}" end="${search.endPage}" >
				<c:if test="${i eq search.currentPage}">
					<li class="active"><a href="#">${i}</a></li>
				</c:if>	
				<c:if test="${i ne search.currentPage}">
					<li><a href="#" data-page="${i}"  >${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${search.endPage < search.totalPageCount }">
				<li><a href="#" data-page="${search.endPage + 1}">
						 <span aria-hidden="true">&raquo;</span>						
					</a>
				</li>
			</c:if>
			
		</ul>	
	</div>
</div>
</div>
</body>
</html>
