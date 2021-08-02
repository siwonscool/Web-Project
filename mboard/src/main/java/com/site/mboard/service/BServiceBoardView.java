package com.site.mboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.mboard.dao.BDao;
import com.site.mboard.vo.BVo;

public class BServiceBoardView implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		int bid= Integer.parseInt(request.getParameter("bid"));
		BVo bVo = bDao.boardOneSelect(bid);
		BVo bVoN = bDao.boardOneSelect(bDao.boardNext(bid));
		BVo bVoB = bDao.boardOneSelect(bDao.boardBefore(bid));
		request.setAttribute("bVo", bVo);
		request.setAttribute("bVoN", bVoN);
		request.setAttribute("bVoB", bVoB);
		request.setAttribute("category", request.getParameter("category"));
		request.setAttribute("keyword", request.getParameter("keyword"));
	}
}