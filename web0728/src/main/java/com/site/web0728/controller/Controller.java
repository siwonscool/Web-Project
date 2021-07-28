package com.site.web0728.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0726.Service.BService;
import com.site.web0726.Service.BServiceList;
import com.site.web0726.Service.MService;
import com.site.web0726.Service.MServiceLogin;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("doAction");
		
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String fileName = uri.substring(cPath.length());
		RequestDispatcher dis = null;
		MService mService = null;
		BService bService = null; 
		
		if(fileName.equals("/member/login.do")) {
			dis=request.getRequestDispatcher("login.jsp");
		}else if(fileName.equals("/member/doLogin.do")) {
			mService = new MServiceLogin();
			mService.excute(request, response);
			dis=request.getRequestDispatcher("doLogin.jsp");
		}else if(fileName.equals("/board/bList.do")) {
			bService = new BServiceList();
			bService.excute(request, response);
			dis=request.getRequestDispatcher("blist.jsp");
		}
		
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
