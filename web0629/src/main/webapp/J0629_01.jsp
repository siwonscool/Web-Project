<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookie</title>
	</head>
	<body>
		<% 
		Cookie loginId = new Cookie("login_id","aaa");
		Cookie cookie_flag = new Cookie("cookie_flag","success");
		loginId.setMaxAge(60*30); // 30분동안 쿠키를 가지고 있겠다.
		cookie_flag.setMaxAge(60*30);
		response.addCookie(loginId);
		response.addCookie(cookie_flag);
		%>
		
		<a href="cookieGet.jsp">쿠키 저장 확인</a>
	</body>
</html>