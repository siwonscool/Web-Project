<%@page import="com.site.web0719_02.*"%>
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

MDao mDao = new MDao();
MDto mDto = mDao.loginSelect(request.getParameter("id"), request.getParameter("pw"));
%>

<script type="text/javascript">
	if(<%=mDto==null%>){
		alert("아이디 패스워드가 일치하지 않습니다.");
		location.href="./login.jsp";
	}else{
		<%
		session.setAttribute("session_flag", "success");
		session.setAttribute("session_id", request.getParameter("id"));
		%>
		alert("로그인 성공");
		location.href="./index.jsp";
	}
</script>

</body>
</html>