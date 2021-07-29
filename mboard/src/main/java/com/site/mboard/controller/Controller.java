package com.site.mboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.mboard.service.Service;
import com.site.mboard.service.BServiceBoardDelete;
import com.site.mboard.service.BServiceBoardList;
import com.site.mboard.service.BServiceBoardModify;
import com.site.mboard.service.BServiceBoardView;
import com.site.mboard.service.BServiceBoardWrite;
import com.site.mboard.service.MServiceLoginSelect;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("doAction");
		String uri = request.getRequestURI();
		String cpath = request.getContextPath();
		String filepath = uri.substring(cpath.length());
		RequestDispatcher dis = null;
		Service service=null;
		
		if(filepath.equals("/member/login.do")) {
			dis=request.getRequestDispatcher("./login.jsp");			
		}else if(filepath.equals("/member/doLogin.do")) {
			service= new MServiceLoginSelect();
			service.execute(request, response);
			dis=request.getRequestDispatcher("../index.jsp");
		}else if(filepath.equals("/board/bList.do")) {
			service = new BServiceBoardList();
			service.execute(request, response);
			dis=request.getRequestDispatcher("./blist.jsp");
		}else if(filepath.equals("/board/bView.do")) {
			service = new BServiceBoardView();
			service.execute(request, response);
			dis=request.getRequestDispatcher("./bview.jsp");
		}else if(filepath.equals("/board/bWriteOk.do")) {
			service = new BServiceBoardWrite();
			service.execute(request, response);
			dis=request.getRequestDispatcher("bWriteOk.jsp");
		}else if(filepath.equals("/board/bModify.do")) {
			service = new BServiceBoardView();
			service.execute(request, response);
			dis=request.getRequestDispatcher("bmodify.jsp");
		}else if(filepath.equals("/board/bModifyOk.do")) {
			service = new BServiceBoardModify();
			service.execute(request, response);
			dis=request.getRequestDispatcher("bmodifyOk.jsp");
		}else if(filepath.equals("/board/bDelete.do")) {
			service = new BServiceBoardDelete();
			service.execute(request, response);
			dis=request.getRequestDispatcher("bdeleteOk.jsp");
		}
		
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
		System.out.println("doGet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
		System.out.println("doPost");	
	}

}
