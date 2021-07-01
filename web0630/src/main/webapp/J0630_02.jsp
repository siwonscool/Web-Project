<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table{border:1px solid;}
			td{border:1px solid;}
		</style>
	</head>
	<body>
		<!--  -->
		<jsp:useBean id="m" class="com.site.ex.Member" scope="page"/>
		<jsp:setProperty name="m" property="number" value="1"/>
		<jsp:setProperty name="m" property="name" value="홍길동"/>
		
		<%
		m.setId("aaa");
		m.setPw("1111");
		m.setGender("남자");
		m.setTel("010-1111-1111");
		%>
		
		<table>
			<tr>
				<td>번호</td>
				<td> <%=m.getNumber() %> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td> <jsp:getProperty property="name" name="m"/> </td>
			</tr>
			<tr>
				<td>id</td>
				<td><%=m.getId() %></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><%=m.getPw() %></td>
			</tr>
			<tr>
				<td>gender</td>
				<td><%=m.getGender() %></td>
			</tr>
			<tr>
				<td>tel</td>
				<td><%=m.getTel() %></td>
			</tr>
		</table>
		
	</body>
</html>