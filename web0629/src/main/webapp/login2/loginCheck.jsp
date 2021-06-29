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
	 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//로그인 성공
	if(id.equals("aaa") && pw.equals("1111")){
		Cookie c_flag = new Cookie("c_flag","success");
		c_flag.setMaxAge(30*60);
		response.addCookie(c_flag);
		
		response.sendRedirect("./index.jsp");		
	}else{ //로그인 실패
		response.sendRedirect("./login.jsp");
	}
%>
</body>
</html>