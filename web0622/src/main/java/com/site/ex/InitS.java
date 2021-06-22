package com.site.ex;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/initS")
public class InitS extends HttpServlet {

	@PostConstruct
	public void postCont() {
		System.out.println("선처리는 Init()메소드보다 먼저 실행");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("객체생성시 단 1번 호출이 됩니다.");
		System.out.println("두번째 호출부터는 실행되지 않습니다.");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("서버 종료시에 단 1번 호출이 됩니다.");
	}
	
	@PreDestroy
	public void preDes() {
		System.out.println("서버 종료시 후처리는 destroy()메소드보다 나중에 실행");
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
	}
}
