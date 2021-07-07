<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<style type="text/css">
			table,th,td{
				border:1px solid;
				border-collapse: collapse;
			}
		</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id,title,content,name,date,hit,ip,n_write,hobbys="";
if(request.getParameterValues("category")!=null){
	String[] hobby=request.getParameterValues("category");
	
	for(int i=0;i<hobby.length;i++){
		if(i==0){
			hobbys=hobby[i];
		}else{
			hobbys+=","+hobby[i];
		}
	}
}

id=request.getParameter("b_id");
title=request.getParameter("b_title");
content=request.getParameter("b_content");
name=request.getParameter("b_name");
date=request.getParameter("b_date");
hit=request.getParameter("b_hit");
n_write=request.getParameter("n_write");
%>
<h3>게시판</h3>
	<table>
		<tr>
			<td>번호</td>
			<td> <%=id %> </td>
		</tr>
		<tr>
			<td>제목</td>
			<td> <%=title %> </td>
		</tr>
		<tr>
			<td>내용</td>
			<td> <%=content %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td> <input type="date" value="<%=date%>"> </td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=hit %></td>
		</tr>
		<tr>
			<td>ip</td>
			<td><%=request.getRemoteAddr() %></td>
		</tr>
		<tr>
			<td>공지글등록</td>
			<td>
				<input type="radio" name="n_write" value="yes" <%=(n_write.equals("yes")?"checked":"") %>>수락
				<input type="radio" name="n_write" value="no" <%=(n_write.equals("no")?"checked":"") %>>미수락
			</td>
		</tr>
		<tr>
			<td>글카테고리</td>
			<td><%=hobbys %></td>
		</tr>
	</table>
	<form action="./modify_view2.jsp" method="post">
		<input type="hidden" name="b_id" value=<%=id %>>
		<input type="hidden" name="b_title" value=<%=title %>>
		<input type="hidden" name="b_content" value=<%=content %>>
		<input type="hidden" name="b_name" value=<%=name %>>
		<input type="hidden" name="b_date" value=<%=date %>>
		<input type="hidden" name="b_hit" value=<%=hit %>>
		<input type="hidden" name="n_write" value=<%=n_write %>>
		<input type="hidden" name="hobby" value=<%=hobbys %>>
		<input type="submit" value="수정">
	</form>
</body>
</html>