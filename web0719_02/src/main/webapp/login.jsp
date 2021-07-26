<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인</h3>
<form action="./loginOk.jsp" method="post">
<label>아이디</label>
<input type="text" id="id" name="id" required><br>
<label>패스워드</label>
<input type="password" id="pw" name="pw" required><br>
<input type="submit" value="로그인">
<input type="reset" value="취소">
</form>
</body>
</html>