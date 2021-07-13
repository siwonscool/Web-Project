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
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
%>

<table border=1px>
	<tr>
		<td>사원번호</td>
		<td>사원이름</td>
		<td>부서번호</td>
		<td>부서이름</td>
	</tr>
	<%try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1234");
		
		stmt=conn.createStatement();
		
		String sql="select employee_id,e.department_id,department_name,emp_name from employees e,departments d where e.department_id=d.department_id(+)";
		rs=stmt.executeQuery(sql);
		while(rs.next()){%>
			<tr>
				<td><%=rs.getInt("employee_id") %></td>
				<td><%=rs.getInt("department_id") %></td>
				<td><%=rs.getString("department_name") %></td>
				<td><%=rs.getString("emp_name") %></td>
			</tr>
		<%}
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
</table>
</body>
</html>