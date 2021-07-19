<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="filefolderOk.jsp" method="post" name="form" enctype="multipart/form-data">
<label>아이디</label>
<input type="text" id="bid" name="bid"><br>
<label>제목</label>
<input type="text" id="btitle" name="btitle"><br>
<label>내용</label>
<input type="text" id="bcontent" name="bcontent"><br>
<label>작성자</label>
<input type="text" id="bname" name="bname"><br>
<input type="file" id="file" name="file"> <br>
<input type="submit" value="게시물 업로드"> <br>
</form>
</body>
</html>