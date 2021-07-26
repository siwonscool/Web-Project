<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	if(<%=request.getParameter("msg")!=null%>){
		alert("<%=request.getParameter("msg")%>");
		return false;
	}
});

function formcheck(){
	if($("#id").val()==""){
		alert("id를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	return document.form.submit();
}
</script>
</head>
<body>
	<h3>로그인</h3>
	<form action="./LoginOk" name="form" method="post">
		<label>아이디</label>
		<input type="text" id="id" name="id"><br>
		<label>패스워드</label>
		<input type="password" id="pw" name="pw"><br>
		
		<input type="button" onclick="formcheck()" value="로그인">
		<a href="index.jsp"><input type="button" value="취소"></a>
	</form>
</body>
</html>