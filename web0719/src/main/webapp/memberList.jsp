<%@page import="java.util.ArrayList"%>
<%@page import="com.site.web0719.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
if(<%=!(session.getAttribute("session_id").equals("aaa"))%>){
	alert("관리자만 접속이 가능합니다.");
	location.href="./index.jsp";
}
</script>
<%
MDao mDao = new MDao();
ArrayList<MDto> mDto = mDao.memberSelect();

%>
<head>
<meta charset="UTF-8">
<title>회원정보 리스트</title>
<style type="text/css">
table,th,td{border:1px solid; border-collapse: collapse;}
</style>
</head>
<body>
<h3>회원정보 리스트</h3> <span><a href="./index.jsp">메인으로</a></span>
<table>
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>성별</th>
		<th>전화번호</th>
		<th>주소1</th>
		<th>주소2</th>
		<th>취미</th>
	</tr>
	<%for(int i=0;i<mDto.size();i++){ %>
	<tr>
		<td><%=mDto.get(i).getId() %></td>
		<td><%=mDto.get(i).getPw() %></td>
		<td><%=mDto.get(i).getName() %></td>
		<td><%=mDto.get(i).getNickname() %></td>
		<td><%=mDto.get(i).getGender() %></td>
		<td><%=mDto.get(i).getTel() %></td>
		<td><%=mDto.get(i).getAddress1() %></td>
		<td><%=mDto.get(i).getAddress2() %></td>
		<td><%=mDto.get(i).getHobby() %></td>
	</tr>
	<%} %>
</table>
</body>
</html>