<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- index 로그인전, 로그인후 -> login.jsp->loginCheck.jsp -> index.jsp -> logout.jsp -->
<%
String check=(String)session.getAttribute("flag");
if(check!=null){
	if(check!="flag"){%>
<a href="logout.jsp">로그아웃 페이지 이동</a>
	
<%}
}else{
%>
<a href="login.jsp">로그인 페이지 이동</a>
<%}%>

</body>
</html>