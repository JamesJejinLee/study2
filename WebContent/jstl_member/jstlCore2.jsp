<%@page import="com.study.member.vo.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  </head>
  <body>
  	<c:set var = "msg"> 홍길동, 이순신, 을지문적, 신립, 하하하 </c:set>
  	<c:set var = "msg2">
  		<b>화이팅!</b>
  	</c:set>
	<c:forTokens items = "${msg}" delims= "," var = "msg" varStatus = "st">
		${st.count}, ${msg}
	</c:forTokens>
	<c:out value = "${msg2}" escapeXml = "false"/>	
	msg3 = <c:out value = "${msg3}" default = "N/A"/>
	<c:set var = "member" value = '<%= new Member("hong","gildong","1234","042-719-8850","hong@naver.com", 10) %>'/>
	<br>
	<c:catch var="ex">  <!-- 예외가 발생하면 예외가 발생하는 값이 ex에 담기게 되고 -->
		${member.mem_name}
		${member.mem_id}
		${member.mem_pwd}
	</c:catch>
	휴~~~~~~~
	<c:if test = "${not empty ex}"> <!-- 여기서 not empty를 이용해서 처리! -->
		예외 발생 : ${ex.message}
	</c:if>
  </body>
</html>