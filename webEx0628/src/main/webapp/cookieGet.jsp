<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookie get</title>
	</head>
	<body>
		<%
			Cookie[] cookies = request.getCookies();
			for(int i=0; i<cookies.length;i++){
				String cookName = cookies[i].getName();
				String cookValue = cookies[i].getValue();
				if(cookName.equals("login_id")){
					out.print("login_id=aaa 쿠키가 존재합니다."+"</br>");
				}
				
				out.println("쿠키이름 : "+cookName+"</br>");
				out.println("쿠키값 : "+cookValue+"</br>");
			}
		%>
	</body>
</html>