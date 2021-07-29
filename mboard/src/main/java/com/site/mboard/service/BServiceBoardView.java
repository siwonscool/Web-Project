package com.site.mboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.mboard.dao.BDao;
import com.site.mboard.vo.BVo;

public class BServiceBoardView implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		BVo bVo = bDao.boardOneSelect(request.getParameter("bid"));
		request.setAttribute("bVo", bVo);
		request.setAttribute("category", request.getParameter("category"));
		request.setAttribute("keyword", request.getParameter("keyword"));
	}
}