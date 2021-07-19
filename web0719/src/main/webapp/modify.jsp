<%@page import="com.site.web0719.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<script type="text/javascript">
	if(<%=session.getAttribute("session_flag")==null%>){
		alert("로그인후 이용 가능합니다.");
		location.href="./login.jsp";
	}
	
	function formCheck(){
	   if($("#id").val().length<5){
	      alert("id는 5자리이상");
	      $("#id").val("");
	      $("#id").focus();
	      return false;
	   }
	   
	   if($("#pw").val().length<3){
	      alert("pw는 3자리이상");
	      $("#pw").val("");
	      $("#pw").focus();
	      return false;
	   }
	   
	   return document.form.submit();
	}
   
</script>
<% 
MDao mDao = new MDao();
MDto mDto = mDao.loginSelect((String)session.getAttribute("session_id"), (String)session.getAttribute("session_pw"));
%>
<h3>회원가입</h3>
<form action="./modifyOk.jsp" id="form" name="form">
<label>아이디</label>
<input type="text" id="id" name="id" placeholder="id는 5자리이상" value="<%=mDto.getId()%>"><br>
<label>비밀번호</label>
<input type="password" id="pw" name="pw" placeholder="pw는 3자리이상" value="<%=mDto.getPw()%>"><br>
<label>이름</label>
<input type="text" id="name" name="name" value="<%=mDto.getName()%>"><br>
<label>닉네임</label>
<input type="text" id="nickName" name="nickName" value="<%=mDto.getNickname()%>"><br>
<label>성별</label>
<input type="radio" id="male" name="gender" value="male" <%=mDto.getGender().equals("male")? "checked":""%>> <label for="male">남자</label>
<input type="radio" id="female" name="gender" value="female" <%=mDto.getGender().equals("female")? "checked":"" %>> <label for="female">여자</label><br>
<label>전화번호</label>
<input type="text" id="tel" name="tel" value="<%=mDto.getTel()%>"><br>
<label>주소1</label>
<input type="text" id="address1" name="address1" value="<%=mDto.getAddress1()%>"><br>
<label>주소2</label>
<input type="text" id="address2" name="address2" value="<%=mDto.getAddress2()%>"><br>
<label>취미</label>
<input type="checkbox" id="swim" name="hobby" value="swim" <%=mDto.getHobby().contains("swim")? "checked":"" %>><label for="swim" >수영</label>
<input type="checkbox" id="golf" name="hobby" value="golf" <%=mDto.getHobby().contains("golf")? "checked":"" %>><label for="golf" >골프</label> 
<input type="checkbox" id="run" name="hobby" value="run" <%=mDto.getHobby().contains("run")? "checked":"" %>><label for="run" >달리기</label>
<input type="checkbox" id="read" name="hobby" value="read" <%=mDto.getHobby().contains("read")? "checked":"" %>><label for="read" >독서</label><br>
<input type="button" onclick="formCheck()" value="수정완료">
<input type="reset" value="취소"> <br>


</form>
</body>
</html>