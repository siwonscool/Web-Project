package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Join02Ok")
public class Join02Ok extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		Connection conn = null;
		Statement stmt =null;
		
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw1");
		String email1=request.getParameter("mail_id");
		String email2=request.getParameter("main_tail");
		String zipcode=request.getParameter("f_postal")+"-"+request.getParameter("l_postal");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String tel1=request.getParameter("f_tell");
		String tel2=request.getParameter("m_tell");
		String tel3=request.getParameter("l_tell");
		String birth1=request.getParameter("birth_year");
		String birth2=request.getParameter("birth_month");
		String birth3=request.getParameter("birth_day");
		String calendar=request.getParameter("calendar");
		String gender=request.getParameter("gender");
		String news=request.getParameter("newletter");
		String sms=request.getParameter("sms");
		String job=request.getParameter("job");
		String marry=request.getParameter("marital_status");
		String[] hobbys=request.getParameterValues("hobby");
		String hobby="";
		
		for(int i=0;i<hobbys.length;i++) {
			if(i==0)hobby=hobbys[i];
			else hobby+=","+hobbys[i];
		}
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1234");
			stmt=conn.createStatement();
			String sql="insert into member3 values("
					+"'"+name+"','"+id+"','"+pw+"','"+email1
					+"','"+email2+"','"+zipcode+"','"+address1+"','"
					+address2+"','"+tel1+"','"+tel2+"','"+tel3+"',"
					+ "'"+birth1+"','"+birth2+"','"+birth3+"','"+calendar+"','"+gender+"','"+news+"','"+sms+"','"+job+"','"+marry+"','"+hobby+"')";
			int i = stmt.executeUpdate(sql);
			if(i==1) {
				System.out.println("데이터 저장 성공");
				response.sendRedirect("./join03_success.jsp");
			}else {
				System.out.println("데이터 저장 실패");
				response.sendRedirect("./main.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
		
	}

}
