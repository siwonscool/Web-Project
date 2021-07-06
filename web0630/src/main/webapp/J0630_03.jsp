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
%>

<jsp:useBean id="student" class="com.site.ex.Student" scope="page"/>
<jsp:setProperty name="student" property="*"/>


<div> <jsp:getProperty name="student" property="name" /> </div>
<div> <%=student.getKor() %> </div>
<div> <%=student.getEng() %> </div>
<div> <%=student.getMath() %> </div>
<div> <%=student.getTotal() %> </div>
<div> <%=student.getAvg() %> </div>
</body>
</html>