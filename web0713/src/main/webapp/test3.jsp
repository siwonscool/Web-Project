<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1234");
				
				stmt=conn.createStatement();
				
				
				String sql ="select emp_name,salary,case when salary>=8000 then '1등급' when salary>=7000 then '2등급' when salary>=6000 then '3등급' when salary>=4000 then '4등급' else '5등급' end as rank from employees";
				rs=stmt.executeQuery(sql);
				while(rs.next()){
					String emp_name=rs.getString("emp_name");
					double salary=rs.getDouble("salary");
					String rank = rs.getString("rank");
					
					out.println("이름 : "+emp_name+", 월급 : "+salary+", 랭크: "+rank+"<br>");
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		%>
	</body>
</html>