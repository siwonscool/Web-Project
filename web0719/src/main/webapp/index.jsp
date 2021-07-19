<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style type="text/css">
        div{border:1px solid black; width:400px; height:80px;
        text-align:center;
        }
      </style>
      <script type="text/javascript">
      </script>
   </head>
   <body>
   <h3><div>메인페이지</div></h3>
      <%if(session.getAttribute("session_flag")==null){%>
      <ul>
         <li><a href="./login.jsp">로그인</a></li>
         <li><a href="./member.jsp">회원가입</a></li>
      </ul>         
            
      <%}else{
         if(session.getAttribute("session_flag").equals("success")){
      %>
      <h3><%=session.getAttribute("session_nickName") %> 님 로그인 되었습니다. </h3>
      <ul>
         <li><a href="./logout.jsp">로그아웃</a></li>
         <li><a href="./board/boardList.jsp">게시판</a></li>
         <li><a href="./modify.jsp">회원정보수정</a></li>
         <li><a href="./memberList.jsp">회원정보리스트</a></li>
      </ul>
      <%}
      }%>      
   </body>
</html>