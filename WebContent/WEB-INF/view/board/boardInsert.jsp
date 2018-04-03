<%@page import="com.study.board.service.BoardServiceImpl"%>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> 
  </head>
  <body>
  		<div class = "row text-center">
  			<div class = "alert alert-info col-md-4 col-md-offset-4">
		  		${message}
  			</div>
  		</div>
		<div class = "row">
			<div class = "col-md-6 col-xs-4">
				<a href = "boardList.do"><button type = "submit" class = "btn btn-sm btn-success">목록</button></a>
				<a href = "boardView.do?bo_no=${board.bo_no}"><button type = "submit" class = "btn btn-sm btn-success">글 보기</button></a>
			</div>
		</div>	
  </body>
</html>