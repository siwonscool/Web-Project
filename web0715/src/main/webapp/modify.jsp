<%@page import="java.sql.*"%>
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

	<%-- if(<%=session.getAttribute("id")%>==null){
		alert("로그인 되어있지 않습니다. 로그인하세요");
		location.href="./login.jsp";
	} --%>
	
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
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs =null;

String id="",pw="",name="",nickName="",gender="",tel="",address1="",address2="",hobby="";

try {
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1234");
	String sql="select * from member2 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("session_id"));
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		id = rs.getString("id");
		pw = rs.getString("pw");
		name = rs.getString("name");
		nickName = rs.getString("nickname");
		gender = rs.getString("gender");
		tel = rs.getString("tel");
		address1 = rs.getString("address1");
		address2 = rs.getString("address2");
		hobby = rs.getString("hobby");
	}else {
		response.sendRedirect("./login.jsp?check=1");
	}
	
	
} catch (Exception e) {
	e.printStackTrace();
}finally {
	try {
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	} catch (Exception e2) {
		e2.printStackTrace();
	}
}
%>

<h3>회원정보수정</h3>
<form action="./ModifyOk" id="form" name="form">
<label>아이디</label>
<input type="text" id="id" name="id" placeholder="id는 5자리이상" value="<%=id%>"><br>
<label>비밀번호</label>
<input type="password" id="pw" name="pw" placeholder="pw는 3자리이상" required><br>
<label>이름</label>
<input type="text" id="name" name="name" value="<%=name%>"><br>
<label>닉네임</label>
<input type="text" id="nickName" name="nickName" value="<%=nickName%>"><br>
<label>성별</label>
<input type="radio" id="male" name="gender" value="male" <%=gender.equals("male")?"checked":"" %>> <label for="male">남자</label>
<input type="radio" id="female" name="gender" value="female" <%=gender.equals("female")?"checked":"" %>> <label for="female">여자</label><br>
<label>전화번호</label>
<input type="text" id="tel" name="tel" value="<%=tel%>"><br>
<label>주소1</label>
<input type="text" id="address1" name="address1" value="<%=address1%>"><br>
<label>주소2</label>
<input type="text" id="address2" name="address2" value="<%=address2%>"><br>
<label>취미</label>
<input type="checkbox" id="swim" name="hobby" value="swim" <%=hobby.contains("swim")?"checked":"" %>><label for="swim">수영</label>
<input type="checkbox" id="golf" name="hobby" value="golf" <%=hobby.contains("golf")?"checked":"" %>><label for="golf">골프</label> 
<input type="checkbox" id="run" name="hobby" value="run" <%=hobby.contains("run")?"checked":"" %>><label for="run">달리기</label>
<input type="checkbox" id="read" name="hobby" value="read" <%=hobby.contains("read")?"checked":"" %>><label for="read">독서</label><br>
<input type="button" onclick="formCheck()" value="수정완료">
<input type="reset" value="취소"> <br>


</form>
</body>
</html>