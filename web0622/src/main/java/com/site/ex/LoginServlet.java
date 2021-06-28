package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LS")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DoGet");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DoPost");
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = "", pw = "", mail = "", age = "", gender = "", married = "", child = "", job = "", hobbys = "";
		String[] hobby;
		id = String.format("%s@%s", request.getParameter("id1"), request.getParameter("id2"));
		pw = request.getParameter("pw");
		mail = request.getParameter("mail");
		age = request.getParameter("age");
		gender = request.getParameter("gender");
		married = request.getParameter("married");
		child = request.getParameter("child");
		job = request.getParameter("job");
		hobby = request.getParameterValues("hobby");

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
		writer.println("<p>mail : " + mail + "</p>");
		writer.println("<p>age : " + age + "</p>");
		writer.println("<p>gender : " + gender + "</p>");
		writer.println("<p>married : " + married + "</p>");
		writer.println("<p>child : " + child + "</p>");
		writer.println("<p>job : " + job + "</p>");
		writer.println("<p>hobby : " + hobbys + "</p>");
		writer.println("</body></html>");
		writer.close();

	}

}
