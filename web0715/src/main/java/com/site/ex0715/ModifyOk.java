package com.site.ex0715;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		request.setCharacterEncoding("utf-8");
		
		String id =request.getParameter("id");
		String pw =request.getParameter("pw");
		String name =request.getParameter("name");
		String nickName =request.getParameter("nickName");
		String gender =request.getParameter("gender");
		String tel =request.getParameter("tel");
		String address1 =request.getParameter("address1");
		String address2 =request.getParameter("address2");
		String[] hobby =request.getParameterValues("hobby");
		String hobbys="";
		for(int i=0;i<hobby.length;i++) {
			if(i==0) {
				hobbys=hobby[i];
			}else {
				hobbys+=","+hobby[i];
			}
		}
		
		try {
			Context context = new InitialContext();
			DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			conn=ds.getConnection();
			String sql="update member2 set id=?,pw=?,name=?,nickname=?,gender=?,tel=?,address1=?,address2=?,hobby=? where id=?";
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, nickName);
			pstmt.setString(5, gender);
			pstmt.setString(6, tel);
			pstmt.setString(7, address1);
			pstmt.setString(8, address2);
			pstmt.setString(9, hobbys);
			pstmt.setString(10, id);
			
			int i = pstmt.executeUpdate();
			if(i==1) {
				System.out.println("데이터 수정 성공");
				response.sendRedirect("./success.jsp");
			}else {
				System.out.println("데이터 수정 실패");
				response.sendRedirect("./modify.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
				try {
					if(conn!=null)conn.close();
					if(pstmt!=null)pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
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
