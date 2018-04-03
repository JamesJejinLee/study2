<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>타이틀을 입력하세요!!</title>
    
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> -->
  </head>
  <body>
  	<c:set var = "price" value = "1000000"/>
  	<fmt:formatNumber value = "${price}" type = "number" groupingUsed = "false"/> <br>
  	<fmt:formatNumber value = "${price}" type = "currency"/> <br>
  	<fmt:formatNumber value = "${price}" type = "percent" /> <br>
  	<fmt:formatNumber value = "${price}" type = "number" pattern ="#,###,###.00"/> <br>
    <h1></h1>
  </body>
</html>