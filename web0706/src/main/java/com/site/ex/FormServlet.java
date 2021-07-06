package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FS")
public class FormServlet extends HttpServlet {       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);		
	}
	
	protected void doAction(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String[] hobby =request.getParameterValues("hobby");
		String hobbys="";

		for(int i=0;i<hobby.length;i++){
			if(i==0){
				hobbys=hobby[i];
			}else{
				hobbys+=","+hobby[i];
			}
		}
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset=\"UTF-8\">");
		out.print("<title>formOk</title>");
		out.print("<style type=\"text/css\">");
		out.print("table,tr,td {\r\n"
				+ "				border:1px solid;\r\n"
				+ "				border-collapse: collapse;\r\n"
				+ "			}");
		out.print("</style>");
		out.print("</head>");
		out.print("<body>");
		
		out.print("<table>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>아이디</td>\r\n"
				+ "				<td>"+request.getParameter("id")+ "</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>비밀번호</td>\r\n"
				+ "				<td>"+request.getParameter("pw1")+"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>소식지 수신여부</td>\r\n"
				+ "				<td>"+request.getParameter("newsletter") +"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>관심연령</td>\r\n"
				+ "				<td>"+request.getParameter("interest") +"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>성별</td>\r\n"
				+ "				<td>"+request.getParameter("gender") +"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>결혼여부</td>\r\n"
				+ "				<td>"+request.getParameter("marrige") +"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>자녀유무</td>\r\n"
				+ "				<td>"+request.getParameter("children") +"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>직업</td>\r\n"
				+ "				<td>"+request.getParameter("job") +"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td>관심있는 주제</td>\r\n"
				+ "				<td>"+hobbys+"</td>\r\n"
				+ "			</tr>\r\n"
				+ "		</table>\r\n"
				+ "		</body>\r\n"
				+ "		</html>");
		out.close();
	}

}
