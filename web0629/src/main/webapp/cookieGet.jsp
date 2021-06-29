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
	Cookie[] cookies_all = request.getCookies();
	for (int i = 0; i < cookies_all.length; i++) {
		String cookieName = cookies_all[i].getName();
		String cookieValue = cookies_all[i].getValue();
		out.println(cookieName);
		out.println(cookieValue + "<br>");

		/* if (cookies_all[i].getValue().equals("success")) {
			out.println("로그인이 되었습니다.");
		} */

		cookies_all[i].setMaxAge(0);
		response.addCookie(cookies_all[i]);
		/* if(cookies_all[i].getName().equals("login_id")){
			cookies_all[i].setMaxAge(0);
			response.addCookie(cookies_all[i]);
		} */
	}
	//삭제
	%>
	<br>
	<a href="cookieDel.jsp">쿠키 삭제 확인</a>
</body>
</html>