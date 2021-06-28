<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			Cookie cookie = new Cookie("login_id","aaa");
			Cookie nickName = new Cookie("nickName","korea");
			cookie.setMaxAge(60*30); //60*30 = 30분
			response.addCookie(cookie);
			nickName.setMaxAge(60*30);
			response.addCookie(nickName);
			
		%>
		
		<a href="cookieGet.jsp">쿠키정보읽기</a>
	</body>
</html>