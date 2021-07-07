<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 쓰기</title>
</head>
<body>
<form action="./content_view2.jsp" method="post" name="form1">
<label>번호</label>
<input type="text" name="b_id"> <br>
<label>제목</label>
<input type="text" name="b_title"> <br>
<label>내용</label>
<input type="text" name="b_content"> <br>
<label>작성자</label>
<input type="text" name="b_name"> <br>
<label>작성일</label>
<input type="date" name="b_date"> <br>
<label>조회수</label>
<input type="text" name="b_hit"> <br>
<label>ip</label>
<input type="text" name="b_ip" value="<%=request.getRemoteAddr() %>" readonly> <br>
<label>공지글 등록</label>
<input type="radio" name="n_write" value="yes">수락
<input type="radio" name="n_write" value="no">미수락<br>
<label>글카테고리</label>
<input type="checkbox" name="category" value="영화">영화
<input type="checkbox" name="category" value="운동">운동
<input type="checkbox" name="category" value="음악">음악
<input type="checkbox" name="category" value="기타">기타

<input type="submit" value="저장">
<input type="reset" value="취소">
</form>
</body>
</html>