<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
		<h2>index</h2>
		<h3>메인페이지</h3>
		<%
			if(session.getAttribute("id")==null){
		%>
			<ul>
			  <li><a href="./login.jsp"> 로그인</a></li>
			  <li><a href="./join.jsp">회원가입</a></li>
			</ul>
		<%
		}else{
		%>
		<h3><%=session.getAttribute("nickName") %>님 환영슨</h3>
		<ul>
		  <li><a href="logout.jsp">로그아웃</a></li>
		  <li>회원정보수정</li>
		</ul>
		<%
		} 
		%>
	</body>
</html>