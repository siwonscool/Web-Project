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
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String nickname = request.getParameter("nickName");
String gender = request.getParameter("gender");
String tel = request.getParameter("tel");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String[] hobby = request.getParameterValues("hobby");
%>
</body>
</html>