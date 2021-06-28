<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	URLEncoder.encode(request.getParameter("name"), "utf-8");

	String birthday = "", name = "", country = "";
	country=request.getParameter("country");
	birthday = request.getParameter("birthday");
	name = request.getParameter("name");
	int intBirthDay = Integer.parseInt(birthday);
	int age = 0;

	Date date = new Date();
	SimpleDateFormat sdp = new SimpleDateFormat("yyyy");

	int intDate = 0;
	intDate = Integer.parseInt(sdp.format(date));

	age = intDate - intBirthDay;
	if (age > 20) {
		response.sendRedirect("success.jsp?age=" + age + "&name=" + name + "&country=" + country);
	} else {
		response.sendRedirect("fail.jsp?age=" + age + "&name=" + name + "&country=" + country);
		//fail.jsp?age=19
	}
	%>
</body>
</html>