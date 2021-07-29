<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<script type="text/javascript">
if("${session_flag}"=="success"){
	alert("로그인 되었습니다.");
	location.href="../index.jsp";
}else{
	alert("아이디 비번 일치 ㄴㄴ");
	location.href="./login.jsp"
}
</script>
</body>
</html>