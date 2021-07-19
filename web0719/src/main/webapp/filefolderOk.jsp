<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table,th,td{border:1px solid; border-collapse: collapse;}
</style>
<title>Insert title here</title>
</head>
<body>
<%
String path = request.getRealPath("upload");
int size=10*1024*1024;

MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
String bid = multi.getParameter("bid");
String btitle = multi.getParameter("btitle");
String bcontent = multi.getParameter("bcontent");
String bname = multi.getParameter("bname");
String fileName = multi.getFilesystemName("file");
%>

<table>
	<tr>
		<th>번호</th>
		<th><%=bid %></th>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=btitle %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=bcontent %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=bname %></td>
	</tr>
	<tr>
		<td>파일명</td>
		<td><%=fileName %></td>
	</tr>
	<tr>
		<td>파일</td>
		<td> <img src="./upload/<%=fileName %>"> </td>
	</tr>
</table>
</body>
</html>