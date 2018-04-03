<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn"%>
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
  	<c:set var = "msg" value = "Hello 오늘은 금요일! ~~~~ hahaha"/>
  	${fn:length(msg)} <br>
  	${fn:toUpperCase(msg)} <br>
  	${fn:contains(msg,"금요일")} <br>
  	
  	<c:forEach items = "${fn:split(msg, ' ')}" varStatus = "st">
  		${st.count} , ${st.current} 
  	</c:forEach>
  	
  	<c:set var = "member" value = '<%= new Member("hong","gildong","1234","042-719-8850","hong@naver.com", 10) %>'/><br>
	  	id = ${member.mem_id}<br>
	  	id = ${member.getMem_id()}<br>
	  	${member.setMem_id("Nolja")}<br>
	  	id = ${member.mem_id} <br>
   <h1></h1>
	   ${FileUtil.fancySize(500342)}
	   ${greaterThan = (a,b) -> a > b ? true : false; ''}
	   ${greaterThan(3,2)} <br>
		   
	   <!-- 삼항 다항식 선언 -->
	   ${fancy = (size) -> size < 1024 ? size += "bytes" : (size < 10485760 ? size/1024.0 += "Kb" 
	   															: size / 10485760.0 += "Mb"); ''}
	   <hr>
	   ${fancy(102455541)}<br>	   	
	   
	   <!-- 문제 : 람다식을 한번 만들어 보세요! -->
	   
	   <!-- 1번. 7단 출력하기 -->
	   <c:set var = "dan" value = "7"/>
	   <ul>
		   	<c:forEach begin = "1" end = "9" var = "i">
		   		${gugudan = (dan,i) -> i == 10? 1 : dan += ' * ' += i += ' = ' += dan*i; ''}
				<li>${gugudan(dan,i)}</li>	   	
		   	</c:forEach>
	   </ul>
	   
	   <!-- 2번. 1 ~ 9단 출력하기-->
	   <ul>
		   	<c:forEach begin = "1" end = "9" var = "i">
		   		<c:forEach begin = "1" end = "9" var = "j">
			   		${gugudan = (dan,i,j) -> i == 10? 
			   		true : (j == 10 ? true : i += ' * ' += j += ' = ' += i * j); ''}
					<li>${gugudan(dan,i,j)}</li>	   	
		   		</c:forEach>
		   		<br>
		   	</c:forEach>
	   </ul>
	   
		<!-- 3번. 람다식 밖으로 빼기-->
		<c:set var = "dan" value = "7"/> 
		${gugu = (a,b) -> a += " * " += b += ' = ' += a * b; ''}	   
		<ul>
			<c:forEach begin = "1" end = "9" var = "i">
				<li>${gugu(dan,i)}</li>
			</c:forEach>
		</ul>
  </body>
</html>