<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%!
	String id="aaa";
	String pw="1111";
	String name=URLEncoder.encode("김구");
	//response.sendRedirect("result.jsp?id=" + id + "&pw=" + pw + "&name=" + name));
%>
<%
//response.sendRedirect("result.jsp?id=" + id + "&pw=" + pw + "&name=" + name);
%>
<script type="text/javascript">
function send(){
	alert("테스트");
	location.href="result.jsp?id=<%=id %>&pw=<%=pw %>&name=<%=name %>";
}
</script>

</head>

<body>
<!-- 파라미터 방식으로 데이터 전달 -->
 
<a href="result.jsp?id=<%=id %>&pw=<%=pw %> &name=<%=name %>">데이터 전송</a>

<button onclick="send()" name="bt">파라미터 전송</button>

</body>
</html>