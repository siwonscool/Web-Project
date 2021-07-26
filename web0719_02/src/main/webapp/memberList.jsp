<%@page import="java.util.ArrayList"%>
<%@page import="com.site.web0719_02.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
if(<%=!session.getAttribute("session_id").equals("aaa")%>){
	alert("관리자만 접속할 수 있습니다.");
	location.href="./index.jsp";
}
</script>
<%
MDao mDao = new MDao();
ArrayList<MDto> list = mDao.memberSelect();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table,th,td{border:1px solid; border-collapse: collapse;}
</style>
</head>
<body>
<table>
<tr>
	<th>아이디</th>
	<th>패스워드</th>
	<th>이름</th>
	<th>별명</th>
	<th>성별</th>
	<th>전화번호</th>
	<th>주소1</th>
	<th>주소2</th>
	<th>취미</th>
</tr>

<% for(int i=0; i<list.size();i++){%>
<tr>
	<td><%=list.get(i).getId() %></td>
	<td><%=list.get(i).getPw() %></td>
	<td><%=list.get(i).getName() %></td>
	<td><%=list.get(i).getNickname() %></td>
	<td><%=list.get(i).getGender() %></td>
	<td><%=list.get(i).getTel() %></td>
	<td><%=list.get(i).getAddress1() %></td>
	<td><%=list.get(i).getAddress2() %></td>
	<td><%=list.get(i).getHobby() %></td>
</tr>
<%} %>
</table>
</body>
</html>