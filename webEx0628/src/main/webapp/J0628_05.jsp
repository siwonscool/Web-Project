<%@page import="java.net.URLEncoder"%>
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

<jsp:forward page="result.jsp">
	<jsp:param value="admin" name="id"/>
	<jsp:param value="1234" name="pw"/>
	<jsp:param name="name" value='<%= URLEncoder.encode("관리자","utf-8") %>' />
</jsp:forward>
</body>
</html>