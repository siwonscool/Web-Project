package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FS")
public class FormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET 호출");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 호출");
		doAction(request, response);
	}
	
	public void doAction(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8"); // post방식은 이거 계속 써줘야됨
		String stuNo = "", name = "",avg="";
		int kor = 0, eng = 0, math = 0, total = 0;
		stuNo = request.getParameter("stuNo");
		name = request.getParameter("name");
		kor = Integer.parseInt(request.getParameter("kor"));
		eng = Integer.parseInt(request.getParameter("eng"));
		math = Integer.parseInt(request.getParameter("math"));
		total = kor + eng + math;
		avg = String.format("%.2f", total / 3.0);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><head>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>학번 : " + stuNo + "</h3>");
		pw.println("<p>이름 : " + name + "</p>");
		pw.println("<p>국어 : " + kor + "</p>");
		pw.println("<p>영어 : " + eng + "</p>");
		pw.println("<p>수학 : " + math + "</p>");
		pw.println("<p>합계 : " + total + "</p>");
		pw.println("<p>평균 : " + avg + "</p>");
		pw.println("</body></html>");
		pw.close();
	}

}// main
