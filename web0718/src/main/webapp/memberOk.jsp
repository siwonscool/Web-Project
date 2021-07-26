<%@page import="com.site.web0718.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String nickname = request.getParameter("nickName");
String gender = request.getParameter("gender");
String tel = request.getParameter("tel");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String[] hobbys = request.getParameterValues("hobby");
String hobby="";

for(int i=0;i<hobbys.length;i++){
   if(i==0)hobby=hobbys[i];
   else hobby=","+hobbys[i];
}

MDao mDao = new MDao();
MDto mDto = new MDto(id,pw,name,nickname,gender,tel,address1,address2,hobby);
int resultNum = mDao.memberInsert(mDto);

%>
<html>
   <head>
      <meta charset="UTF-8">
      <title>회원가입</title>
   </head>
   <body>
   <script type="text/javascript">
      if(<%=resultNum==1%>){
         alert("회원가입 완료");
         location.href="./index.jsp";
      }else{
         alert("회원가입이 되지 않았습니다. 다시 입력해주세요.");
         history.back(-1);
      }
   </script>
   </body>
</html>