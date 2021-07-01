<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="com.site.ex.Student" scope="page"/>
	<jsp:setProperty name="student" property="stuNo" value="1"/>
	<jsp:setProperty name="student" property="name" value="홍길동"/>
	<jsp:setProperty name="student" property="kor" value="90"/>
	<jsp:setProperty name="student" property="eng" value="100"/>
	<jsp:setProperty name="student" property="math" value="100"/>
	<%
	student.setTotal(student.getKor()+student.getEng()+student.getMath());
	student.setAvg(student.getTotal()/3.0);
	%>
	<table>
		<tr>
			<td>학번</td>
			<td> <jsp:getProperty property="stuNo" name="student"/> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td> <%=student.getName() %> </td>
		</tr>
		<tr>
			<td>국어</td>
			<td> <%=student.getKor() %> </td>
		</tr>
		<tr>
			<td>영어</td>
			<td> <%=student.getEng() %> </td>
		</tr>
		<tr>
			<td>수학</td>
			<td> <%=student.getMath() %> </td>
		</tr>
		<tr>
			<td>총점</td>
			<td> <%=student.getTotal() %> </td>
		</tr>
		<tr>
			<td>평균</td>
			<td> <%=student.getAvg() %> </td>
		</tr>
	</table>
</body>
</html>