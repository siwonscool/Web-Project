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
	Cookie[] cookieAll= request.getCookies();

	if(cookieAll!=null){
		for(int i=0;i<cookieAll.length;i++){
			out.println(cookieAll[i].getName());
			out.println(cookieAll[i].getValue());
		}			
	}else{
		out.println("쿠키가 존재하지 않습니다.");
	}
	
	%>
</body>
</html>