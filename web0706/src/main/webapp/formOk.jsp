<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formOk</title>
<style type="text/css">

	table,tr,td {
		border:1px solid;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String[] hobby =request.getParameterValues("hobby");
String hobbys="",id,pw,newsletter,interest,gender,marriage,children,job;
id=request.getParameter("id");
pw=request.getParameter("pw1");
newsletter=request.getParameter("newsletter");
interest=request.getParameter("interest");
gender=request.getParameter("gender");
marriage=request.getParameter("marriage");
children=request.getParameter("children");
job=request.getParameter("job");

for(int i=0;i<hobby.length;i++){
	if(i==0){
		hobbys=hobby[i];
	}else{
		hobbys+=","+hobby[i];
	}
}
%>

<table>
	<tr>
		<td>아이디</td>
		<td><%=id %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=pw %></td>
	</tr>
	<tr>
		<td>소식지 수신여부</td>
		<td><%=newsletter %></td>
	</tr>
	<tr>
		<td>관심연령</td>
		<td><%=interest %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=gender %></td>
	</tr>
	<tr>
		<td>결혼여부</td>
		<td><%=marriage %></td>
	</tr>
	<tr>
		<td>자녀유무</td>
		<td><%=children %></td>
	</tr>
	<tr>
		<td>직업</td>
		<td><%=job %></td>
	</tr>
	<tr>
		<td>관심있는 주제</td>
		<td><%=hobbys %></td>
	</tr>
</table>

<form action="form_update.jsp">
	<input type="hidden" name='id' value="<%=id %>">
	<input type="hidden" name='pw' value="<%=pw %>">
	<input type="hidden" name='newsletter' value="<%=newsletter %>">
	<input type="hidden" name='interest' value="<%=interest %>">
	<input type="hidden" name='gender' value="<%=gender %>">
	<input type="hidden" name='marriage' value="<%=marriage %>">
	<input type="hidden" name='children' value="<%=children %>">
	<input type="hidden" name='job' value="<%=job %>">
	<input type="hidden" name='hobby' value="<%=hobbys %>">
	<input type="submit" value="수정">
</form>

</body>
</html>