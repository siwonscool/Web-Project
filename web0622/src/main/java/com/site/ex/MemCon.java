package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MC")
public class MemCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget 실행");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost 실행");
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); //

		String id = "", pw = "", name = "", tel = "", tel2 = "", gender = "";
		String[] hobby;

		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		tel = String.format("%3s - %4s - %4s",request.getParameter("tel"), request.getParameter("tel2").substring(0, 4),
				request.getParameter("tel2").substring(4, 8));
		gender = request.getParameter("gender");
		hobby = request.getParameterValues("hobby");
		String hobbys = "";

		for (int i = 0; i < hobby.length; i++) {
			if (i == 0) {
				hobbys += hobby[i];
			} else {
				hobbys += "," + hobby[i];
			}
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html><head>");
		writer.println("<title></title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<p>id : " + id + "</p>");
		writer.println("<p>pw : " + pw + "</p>");
		writer.println("<p>name : " + name + "</p>");
		writer.println("<p>tel : " + tel  + "</p>");
		writer.println("<p>gender : " + gender + "</p>");
		writer.println("<p>hobby : " + hobbys + "</p>");
		writer.println("</body></html>");
		writer.close();

	}// doAction
}// class
