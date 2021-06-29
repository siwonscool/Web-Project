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
	String id=request.getParameter("id");
	String pw=request.getParameter("Pw");
	//id,pw 비교
	if(id.equals("aaa") && pw.equals("1111")){
		session.setAttribute("session_flag","success");
		response.sendRedirect("index.jsp");
	}else{
		//id,pw불일치 -> alert 호출
		response.sendRedirect("login.jsp?session_flag=fail");
	}
	%>
</body>
</html>