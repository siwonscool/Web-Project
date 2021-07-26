package com.site.web0726.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0725.Service.BService;
import com.site.web0725.Service.BServiceList;
import com.site.web0725.Service.BServiceView;
import com.site.web0725.Service.BServiceWrite;



@WebServlet("*.do")
public class BController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String fpath=uri.substring(contextPath.length());
		BService bservice= null;		
		RequestDispatcher dp = null;
		
		if(fpath.equals("/board/blist.do")) {
			bservice = new BServiceList();
			bservice.excute(request, response);
			dp = request.getRequestDispatcher("./blist.jsp");
		}else if(fpath.equals("/board/bview.do")) {
			bservice = new BServiceView();
			bservice.excute(request, response);
			dp=request.getRequestDispatcher("./bview.jsp");
		}else if(fpath.equals("/board/bwrite.do")) {
			dp=request.getRequestDispatcher("./bwrite.jsp");
		}else if(fpath.equals("/board/bwriteOk.do")) {
			bservice = new BServiceWrite();
			bservice.excute(request, response);
			dp=request.getRequestDispatcher("./blist.jsp");
		}
		
		dp.forward(request, response);
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
