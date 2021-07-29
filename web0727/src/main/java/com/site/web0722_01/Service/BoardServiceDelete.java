package com.site.web0722_01.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0722_01.Dao.BDao;

public class BoardServiceDelete implements BoardService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		int result = bDao.boardDelete(request.getParameter("bid"));
		request.setAttribute("result", result);
		
	}

}
