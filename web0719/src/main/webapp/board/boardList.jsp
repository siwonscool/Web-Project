<%@page import="java.util.ArrayList"%>
<%@page import="com.site.web0719.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table,th,td{border:1px solid; border-collapse: collapse;}
</style>
</head>
<body>
<%
BDao bDao = new BDao(); 
ArrayList<BDto> list = bDao.boardSelect();
%>
<h3>회원정보 리스트</h3> <span><a href="../index.jsp">메인으로</a></span>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>파일명</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%for(int i=0;i<list.size();i++){ %>
	<tr>
		<td><%=list.get(i).getBid() %></td>
		<td><%=list.get(i).getBtitle() %></td>
		<td><%=list.get(i).getBupload() %></td>
		<td><%=list.get(i).getBcontent() %></td>
		<td><%=list.get(i).getBname() %></td>
		<td><%=list.get(i).getBdate() %></td>
		<td><%=list.get(i).getBhit() %></td>
	</tr>
	<%} %>
</table>
</body>
</html>