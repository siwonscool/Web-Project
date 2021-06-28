<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>출생년도 나이계산</h3>
		<form action="rCheck.jsp" method="post" name="form1">
			<label>이름</label>
			<input type="text" name="name"> <br>
			<label>출생년도를 입력하세요.</label>
			<input type="text" name="birthday"> <br>
			<label>출생지</label>
			<input type="text" name="country"> <br>
			
			<input type="submit" value="제출">
			<input type="reset" value="취소">
			
		</form>
	</body>
</html>