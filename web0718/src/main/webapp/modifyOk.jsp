<%@page import="com.site.web0718.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
int resultNum = mDao.memberUpdate((String)session.getAttribute("session_id"),mDto);

%>
<script type="text/javascript">
if(<%=resultNum==1%>){
	alert("회원정보 수정이 완료되었습니다.");
	location.href="./index.jsp";
	<%
	session.setAttribute("session_id", mDto.getId());
	session.setAttribute("session_pw", mDto.getPw());
	session.setAttribute("session_nickName", mDto.getNickname());
	%>
}else{
	alert("회원정보 수정이 실패했습니다.");
	location.href="./member.jsp";
}
</script>

</body>
</html>