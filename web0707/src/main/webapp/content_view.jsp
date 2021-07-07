<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/read.css">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript">
	  function check(){
		  return document.form.submit();
	  }
  </script>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
//db에서 데이터를 가져옴 write->db로 저장시키고->db에서 데이터 가져오기
String bname = request.getParameter("bName");
String btitle = request.getParameter("bTitle");
String bcontent = request.getParameter("bContent");
String bip = request.getRemoteAddr();
String bid="1";
String bhit="1";
%>
<form action="./modify_view.jsp" name="form">
	<input type="hidden" name="bName" value="<%=bname%>">
	<input type="hidden" name="bTitle" value="<%=btitle%>">
	<input type="hidden" name="bContent" value="<%=bcontent%>">
	<input type="hidden" name="bId" value="<%=bid%>">
	<input type="hidden" name="bhit" value="<%=bhit%>">
	<input type="hidden" name="bip" value="<%=bip%>">
</form>
<section>
    <h1>NOTICE</h1>

    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">제목</th>
      </tr>
      <tr>
        <td colspan="3"><strong><%=btitle %></strong></td>
      </tr>
      <tr>
        <td><%=bname %></td>
        <td>조회수</td>
        <td><%=bhit %></td>
      </tr>
      <tr>
        <td colspan="3" class="article"><%=bcontent %></td>
      </tr>
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span> [키즈잼] 2월 프로그램 안내</td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span> [키즈잼] 2020년 1분기 정기 휴관일 안내</td>
      </tr>
    </table>

    <a href=""><div class="list">목록</div></a>
    <a href=""><div class="list">삭제</div></a>
    <a href="#"><div class="list" onclick="check()">수정</div></a>
    <a href=""><div class="list">답변달기</div></a>
  </section>
</body>
</html>