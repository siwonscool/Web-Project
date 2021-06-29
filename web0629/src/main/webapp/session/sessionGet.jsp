<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String login_id = (String)session.getAttribute("login_id");
	String login_nName = (String)session.getAttribute("login_nName");
	String login_flag = (String)session.getAttribute("login_flag");
	out.print("login_id : " + login_id+"<br>");
	out.print("login_nName : " + login_nName+"<nName>"+"<br>");
	out.print("login_flag : " + login_flag+"<flag>"+"<br>");
	
	//섹션 1개 삭제
	//session.removeAttribute("login_id");
	
	//섹션 전체삭제
	//session.invalidate();
	
	/* Enumeration<String> enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()){
		
	} */
	%>
	
	<a href="sessionResult1.jsp">섹션 결과</a>
</body>
</html>