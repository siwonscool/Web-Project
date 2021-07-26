<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인 페이지</h3>
<%if(session.getAttribute("session_flag")==null){%>
<ul>
	<li> <a href="./login.jsp">로그인</a> </li>
	<li> <a href="./member.jsp">회원가입</a> </li>
</ul>
<%}else{ %>
<ul>
	<li> <a href="./logout.jsp">로그아웃</a> </li>
	<li> <a href="./memberList.jsp">회원리스트 출력</a> </li>
	<li> <a href="#">회원정보수정</a> </li>
</ul>
<%} %>
</body>
</html>