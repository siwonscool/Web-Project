<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>db연결</title>
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs =null;
			
			try{
				//jar파일 로드에서 메모리에 jdbc 탑재
				Class.forName("oracle.jdbc.driver.OracleDriver"); 
				
				// Date Source Explorer -> properties에서 확인가능
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				
				// 커넥션 실행(접속url,id,pw)
				conn = DriverManager.getConnection(url, "ora_user", "1234");
				
				//sql구문을 입력하는 창 생성
				stmt = conn.createStatement();
				//sql구문을 입력
				String sql ="select * from employees";
				//107개 데이터 들어가있음 
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					int employee_id = rs.getInt("employee_id");
					String emp_name = rs.getString("emp_name");
					String email = rs.getString("email");
					Timestamp date = rs.getTimestamp("hire_date");
					
					out.println("사원번호 : " + employee_id + ", 이름 : "+emp_name+", 입사일 : "+date+"<br>");
						
				}//while
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs!=null) rs.close();		
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();

			}
			
		%>
	</body>
</html>