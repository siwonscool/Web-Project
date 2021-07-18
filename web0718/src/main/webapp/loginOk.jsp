<%@page import="com.site.web0718.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

MDao mDao = new MDao();
MDto mDto =mDao.loginSelect(id, pw);
%>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <script type="text/javascript">
         if(<%=(mDto.getId()==null)%>){
            alert("아이디 패스워드가 일치하지 않습니다.");
            location.href="./login.jsp";
         }else{
            alert("로그인 ㅊㅊ");
            <%
            session.setAttribute("session_flag", "success");
            session.setAttribute("session_id", mDto.getId());
            session.setAttribute("session_pw", mDto.getPw());
            session.setAttribute("session_nickName", mDto.getNickname());
            
            %>
            location.href="./index.jsp"
         }
      </script>
   </head>
   <body>
      
   </body>
</html>