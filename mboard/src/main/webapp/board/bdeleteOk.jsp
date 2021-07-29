<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if("${result==1}"){
	alert("삭제가 완료되었습니다.");
	location.href="bList.do";
}
</script>
</body>
</html>