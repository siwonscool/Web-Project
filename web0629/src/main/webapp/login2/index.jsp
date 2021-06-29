<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
	
	<%
	Cookie[] cookies = request.getCookies();
	int count=0;
	if(cookies!=null){
		for(int i =0;i<cookies.length;i++){
			if(cookies[i].getName().equals("c_flag")){
				count=1;
			%>
				<a href="./logout.jsp">
				<img src="../images/logout.jpg">
				</a>			
			<%}
		}
	}
	//로그인 실패시
	if(count==0){%>
		<a href="./login.jsp">
		<img src="../images/login.jpg">
		</a>	
	<%}%>
	
	</body>
</html>