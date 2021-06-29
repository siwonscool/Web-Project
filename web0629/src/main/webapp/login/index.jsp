<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<!-- localhost:8181/web0629/login/index.jsp -->
	<!-- 로그인전 -->
	<%
		Cookie[] cookies= request.getCookies();
		int count=0;
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("cookie_nName")){
					out.print("<h3> 닉네임 : "+cookies[i].getValue()+"님 환영합니다</h3>");
					
				}
				if(cookies[i].getName().equals("cookie_id")){
					
					out.print("<h3> 아이디 :"+cookies[i].getValue()+"님 환영합니다</h3>");					
				}
				
				if(cookies[i].getName().equals("cookie_flag")){
					count=1;
						
					%>
					<!-- 로그인 후 -->
					<img src="../images/login.jpg">
					<li> <a href="./logout.jsp">로그아웃</a></li>
					<li> <a href="./index.jsp">index</a> </li>					
					<li>게시판</li>
					<li>이벤트</li>
					
				<%}//if
			}//for
		}//if
			
		if(count==0){ //로그인 실패%>
				
				<h3>[ 로그인 실패 ]</h3>
				<img src="../images/logout.jpg">
				<li> <a href="./login.jsp">로그인</a></li>
				<li> <a href="./index.jsp">index</a> </li> 
				<li>공지사항</li>
		<%}%>
</ul>
</body>
</html>