<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
    <title>16 /jstlCore</title>
    
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> -->
  </head>
  <body>
  	<!-- jstl에서!!! var로 시작하는 속성에는 el 표기법을 사용하지 마세요~  그냥 이름만 써라!-->
  	<c:set var="msg" value = "1000"/>
  	${msg} <br>
  	<c:set var="msg2" value = "${msg + 4}"/>
  	${msg2}
	<c:set var = "member" value = "<%= new Member()%>"/>

	<c:set target = "${member}" property = "mem_name" value = "길동"/>  	
	<c:set target = "${member}" property = "mem_id" value = "gildong"/><br>
	
	1 : ${member.mem_name} <br>  	
	${member.mem_phone = '042-719-8850'; ''} <br>
	2 : ${member.mem_phone} <br>
  	<hr>
  	<c:remove var = "member"/>
  	
  	1 : ${member.mem_name} <br>  	
  	2 : ${member.mem_phone} <br>
  	
  	<c:set var = "jumsu" value="86"/>
  	<c:if test = "${jumsu > 90 and jumsu <= 100}">참 잘했어요!<br></c:if>  	
  	<c:if test = "${jumsu > 80 and jumsu <= 90}">잘했어요!<br></c:if>  	
  	<c:if test = "${jumsu > 70 and jumsu <= 80}">보통!<br></c:if>  	
  	<c:if test = "${jumsu <= 70}">너 때문에 못살아!<br></c:if>
	
	<c:choose>
		<c:when test = "${jumsu > 90 and jumsu <= 100}">
			참 잘했어요! ${jumsu}
		</c:when>
		<c:when test = "${jumsu > 80 and jumsu <= 90}">
			잘했어요!	${jumsu}
		</c:when>
		<c:when test = "${jumsu > 70 and jumsu <= 80}">
			보통!	${jumsu}
		</c:when>
		<c:otherwise>
			너 때문에 못살아!	${jumsu}
		</c:otherwise>
	</c:choose>
	<c:forEach begin = "1" end = "10" step = "1">
		배고파요~<br>
	</c:forEach>
	<c:set var = "sum" value = "0"/>
	<c:forEach var = "i" begin = "1" end = "100">
		<c:set var = "sum" value = "${sum + i}"/> <!--sum = sum + i-->
	</c:forEach>
		1부터 100까지의 합 = ${sum}
	<hr>
	<%
		List<Member> list = new ArrayList();
		list.add(new Member("hong","홍길동","3234","010-1234-9007","naver789@daum.net",0));
		list.add(new Member("lee","이황","1255","010-4334-7734","naver123@daum.net",0));
		list.add(new Member("kim","김지석","1344","010-6634-3910","naver456@daum.net",0));
		request.setAttribute("list", list);
	%>
	<hr>
	<hr>
	<hr>
	<ul>
		<c:forEach var = "user" items = "${list}" varStatus = "st" >
			<li>${st.count}. ${user.mem_id} = ${user.mem_name} </li>		
		</c:forEach>
	</ul>
	<ul>
		<c:forEach var = "user" items = "${list}" begin = "0" varStatus = "st">
			<c:if test = "${st.first}"><hr style = "border-color : red; border-style:dotted	;"></c:if>
			<li>${st.index} ${user.mem_id} = ${user.mem_name} </li>		
			<c:if test = "${st.last}"><hr style = "border-color : blue; border-style:dotted;"></c:if>
		</c:forEach>
	</ul>
	</body>
</html>