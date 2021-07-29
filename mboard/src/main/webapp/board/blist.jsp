<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
</head>
<body>
<section>
    <h1>NOTICE</h1>
    <div class="wrapper">
      <form action="bList.do?" name="search" method="post">
        <select name="category" id="category">
          <option value="all" ${(category=='all')?'selected':''}>전체</option>
          <option value="title" ${(category=='title')?'selected':''}>제목</option>
          <option value="content" ${(category=='content')?'selected':''}>내용</option>
        </select>

        <div class="title">
          <input type="text" size="16" name="keyword" value="${keyword}">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="15%">
        <col width="45%">
        <col width="15%">
        <col width="15%">
        <col width="10%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No.</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <!-- 내용부분 -->
      <c:forEach items="${list}" var="list">
	      <tr>
	        <td><span class="table-notice">${list.bid}</span></td>
	        <td class="table-title">
	        <a href="bView.do?bid=${list.bid}&category=${category}&keyword=${keyword}">${list.btitle}</a>
	        </td>
	        <td>${list.bname}</td>
	        <td>${list.bdate}</td>
	        <td>${list.bhit}</td>
	      </tr>
      </c:forEach>
      
    </table>

    <ul class="page-num">
      <!-- 1 페이지 이동 -->
      <c:if test="${page!=1}">
        <a href="bList.do?page=1"><li class="first"></li></a>
      </c:if>
      <c:if test="${page==1}">
        <li class="first"></li>
      </c:if>
      
      <!--이전 페이지 이동  -->
      <c:if test="${page>startpage}">
        <a href="bList.do?page=${page-1}&category=${category}&keyword=${keyword}"><li class="prev"></li></a>
      </c:if>
      <c:if test="${page<=startpage}">
        <li class="prev"></li>
      </c:if>
      
      <!-- 모든 페이지 넘버링 -->
      <c:forEach var="pageNum" begin="${startpage}" end="${endpage}">
        <c:if test="${pageNum==page}">
          <li class="num"><div>${pageNum}</div></li>
        </c:if>
        <c:if test="${pageNum!=page }">
          <a href="bList.do?page=${pageNum}&category=${category}&keyword=${keyword}"><li class="num"><div>${pageNum}</div></li> </a>         
        </c:if>
      </c:forEach>
      
      <!-- 다음 페이지 이동 -->
      <c:if test="${page<endpage}">
        <a href="bList.do?page=${page+1}"><li class="next"></li></a>
      </c:if>
      <c:if test="${page>=endpage}">
        <li class="next"></li>
      </c:if>
      
      <!-- 마지막 페이지 이동 -->
      <c:if test="${page!=maxpage}">
        <a href="bList.do?page=${maxpage}&category=${category}&keyword=${keyword}"><li class="last"></li></a>
      </c:if>
      <c:if test="${page==maxpage }">
        <li class="last"></li>
      </c:if>
    </ul>

    <a href="bwrite.jsp"><div class="write">쓰기</div></a>
  </section>

</body>
</html>