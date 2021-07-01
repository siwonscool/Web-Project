<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Index</title>
	</head>
	<body>
		<%
		String flag = (String)session.getAttribute("session_flag");
		if(flag.equals("success")){
			out.print("로그인 완료 <br>");
		}
		session.removeAttribute("session"); //한개 삭제
		%>
	</body>
</html>