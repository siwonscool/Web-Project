<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	table,th,td{boder:1px solid black; border-collapse:collapse;}

</style>
</head>
<body>
	
	<%
	
	String name="", gender="", id="", pw="", major="", hobbys="",eleID="";
	String[] hobby;
	request.setCharacterEncoding("utf-8");
	name = request.getParameter("name");
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	major = request.getParameter("major");
	hobby = request.getParameterValues("hobby");
	for (int i = 0; i < hobby.length; i++) {
		if (i == 0) {
			hobbys = hobby[i];
		} else {
			hobbys += "," + hobby[i];
		}
	}
	
	int i =0;
	
	/* Enumeration<String> enum1 = request.getParameterNames();
	while(enum1.hasMoreElements()){//읽어올 데이터가 있는지 확인 if문과 동일
		if (i == 0) {
			eleID += enum1;
		} else {
			eleID += "," + enum1;
		}
		i++;
	} */
	%>

	<table>
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><%=pw %></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><%=major %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%=hobbys %></td>
		</tr>
		<tr>
			<th>변수명</th>
			<td><%=eleID%></td>
		</tr>
	</table>
	


</body>
</html>