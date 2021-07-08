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
  <script type="text/javascript">
  function check(){
	  return document.form.submit();
  }
  function check2(){
	  return document.form2.submit();
  }
  </script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("bName");
String title=request.getParameter("bTitle");
String content=request.getParameter("bContent");
String date=request.getParameter("bDate");
%>

<form action="./modify_view.jsp" name="form">
<input type="hidden" name="bName" value="<%=name%>">
<input type="hidden" name="bTitle" value="<%=title%>">
<input type="hidden" name="bContent" value="<%=content%>">
<input type="hidden" name="bDate" value="<%=date%>">
</form>
<form action="./list.jsp" name="form2">
<input type="hidden" name="bName" value="<%=name%>">
<input type="hidden" name="bTitle" value="<%=title%>">
<input type="hidden" name="bContent" value="<%=content%>">
<input type="hidden" name="bDate" value="<%=date%>">
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
        <td colspan="2"><strong><%=title %></strong></td>
        <td class="article"><%=date %></td>
      </tr>
      <tr>
        <td><%=name %></td>
        <td>조회수</td>
        <td>111</td>
      </tr>
      <tr>
        <td colspan="3" class="article"><%=content %></td>
      </tr>
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span> [키즈잼] 2월 프로그램 안내</td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span> [키즈잼] 2020년 1분기 정기 휴관일 안내</td>
      </tr>
    </table>

    <a href="#"><div class="list" onclick="check2()">목록</div></a>
    <a href=""><div class="list">삭제</div></a>
    <a href="#"><div class="list" onclick="check()">수정</div></a>
    <a href=""><div class="list">답변달기</div></a>
  </section>
</body>
</html>