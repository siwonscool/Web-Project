<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1></h1>
	<%
	Cookie[] cookies_all = request.getCookies();
	if(cookies_all!=null){
		for (int i = 0; i < cookies_all.length; i++) {
			String cookieName = cookies_all[i].getName();
			String cookieValue = cookies_all[i].getValue();
			out.println(cookieName);
			out.println(cookieValue + "<br>");
			response.addCookie(cookies_all[i]);
		}
	}else{
		out.println("쿠키가 존재하지 않습니다.");
	}
	%>
	<br>
	<a href="cookieResult.jsp">쿠키 최종확인</a>
</body>
</html>