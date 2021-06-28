<%@page import="java.net.URLEncoder"%>
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
	request.setCharacterEncoding("utf-8");
	URLEncoder.encode(request.getParameter("stuNo"), "utf-8");
	URLEncoder.encode(request.getParameter("name"), "utf-8");
	URLEncoder.encode(request.getParameter("score"), "utf-8");
	
	String stuNo= "", name = "", score = "";
	stuNo = request.getParameter("stuNo");
	name = request.getParameter("name");
	score=request.getParameter("score");
	
	int IntScore = Integer.parseInt(score);
	
	if(IntScore>60){
	%>
	<h3>html 코드</h3>
	<jsp:forward page="testSuccess.jsp">
		<jsp:param value="<%=stuNo %>" name="StuNo"/>
		<jsp:param value="<%=name %>" name="name"/>
		<jsp:param value="<%=score %>" name="score"/>
		<jsp:param value="성공" name="param_test"/>
	</jsp:forward>
	
	  	response.sendRedirect("testSuccess.jsp?stuNo=" + stuNo + "&name=" + name + "&score=" + score);
		response.sendRedirect("testFail.jsp?StuNo="+stuNo+"&name="+name+"&score="+score);		
	<%}else{
		
	}
	%>
	
</body>
</html>