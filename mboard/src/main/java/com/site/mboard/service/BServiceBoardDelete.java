package com.site.mboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.mboard.dao.BDao;

public class BServiceBoardDelete implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		int result = 0;
		result= bDao.boardDelete(request.getParameter("bid"));
		request.setAttribute("result", result);
	}

}
