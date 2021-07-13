
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(url,"ora_user","1234");
		
		stmt = conn.createStatement();
		
		stmt.executeUpdate("insert into member values(mem_seq.nextval,'4444','','','','','','')");
		//return 1 or 0
		
		String sql="select * from member";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String mId = rs.getString("mid");
			String mPw = rs.getString("mpw");
			String mName = rs.getString("mname");
			String mPhone = rs.getString("mphone");
			
			out.print("아이디 : "+mId+", 비밀번호 : "+mPw+", 이름 : "+mName+", 전화번호 : "+mPhone+"<br>");
		}
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>