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
request.setCharacterEncoding("utf-8");
%>
<h3>테스트 성공</h3>
<h1><%= request.getParameter("stuNo") %></h1>
<h1><%= request.getParameter("name") %></h1>
<h1><%= request.getParameter("score") %></h1>
<h1><%= request.getParameter("param_test") %></h1>
</body>
</html>