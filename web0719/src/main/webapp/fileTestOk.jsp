<%@page import="java.util.Enumeration"%>
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
//tomcat의 upload위치를 말함. 즉 진짜 경로는 서버단으로 간다 라는의미
//String path=request.getRealPath("aaa");
String path="c:/aaa";
int size = 10*1024*1024;

MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
String fileName = multi.getFilesystemName("file1");
String btitle = multi.getParameter("btitle");
String bname = multi.getParameter("bname");
%>
<h3>파일 업로드 정보</h3>
<table>
	<tr>
		<th>글제목</th>
		<th>작성자</th>
		<th>파일</th>
		<th>이미지</th>
	</tr>
	<tr>
		<td><%=btitle %></td>
		<td><%=bname %></td>
		<td><%=fileName %></td>
		<td><img src="./upload/<%=fileName%>"> </td>
	</tr>
</table>
</body>
</html>