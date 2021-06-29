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
	String session_flag = (String)session.getAttribute("login_flag");
	if(session_flag != null){
		if(session_flag.equals("success")){
	%>
		<a href="logout.jsp"> <img src="../images/logout.jpg"> </a>
		<br>
		<%}
	}else{%>
		<a href="login.jsp"> <img src="../images/login.jpg"> </a>
		<br>
	<%} %>
</body>
</html>