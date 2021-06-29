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
		if(session.getAttribute("login_id")==null){
			out.println("login_id 섹션이 없습니다.");
		}else{
			out.println("login_id 섹션이 있습니다.");
		}
		%>
	</body>
</html>