<%@page import="java.net.URLDecoder"%>
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
<table>
<tr>
<td>id</td>
<td><%=request.getParameter("id") %></td>
</tr>
<tr>
<td>pw</td>
<td><%=request.getParameter("pw") %></td>
</tr>
<tr>
<td>name</td>
<td><%=URLDecoder.decode(request.getParameter("name")) %></td>
</tr>
</table>
</body>
</html>