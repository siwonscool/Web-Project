<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과값</title>
<%request.setCharacterEncoding("utf-8"); %>

<style type="text/css">
table{border:1px solid; border-collapse:collapse;}
</style>
</head>
<body>
<!-- memberForm.jsp 번호 이름 id pw 전화번호 성별,월급,공제액(10%) -->
<!-- 공제액은 월급에서 10%로 자동으로 계산해서 -->
<!-- salary.java 번호 이름 id pw 전화번호 성별 월급,공제액(10%)-->
<!-- J0630_04.jsp에서 폼에서 넘어온 데이터를 useBean에 값을 삽입 -->
<!-- useBean 테이블에 출력 -->

<jsp:useBean id="salary" class="com.site.ex.Salary" />
<jsp:setProperty name="salary" property="*"/>

<form action="memberForm.jsp">
	<table>
		<tr>
			<td>번호</td>
			<td> <%=salary.getNum()%> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td> <%=salary.getName()%> </td>
		</tr>
		<tr>
			<td>id</td>
			<td> <%=salary.getId()%> </td>
		</tr>
		<tr>
			<td>pw</td>
			<td> <%=salary.getPw()%> </td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td> <%=salary.getTel()%></td>
		</tr>
		<tr>
			<td>성별</td>
			<td> 
				<%=salary.getGender()%>
			</td>
		</tr>
		<tr>
			<td>월급</td>
			<td> <%=salary.getSalary1()%></td>
		</tr>
		<tr>
			<td>공제액</td>
			<td> <%=salary.getMinus()%></td>
		</tr>
		<tr>
			<td> <input type="submit" value="뒤로가기"> </td>
		</tr>
		
	</table>
</form>
</body>
</html>