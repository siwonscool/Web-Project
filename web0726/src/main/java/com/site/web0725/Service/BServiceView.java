package com.site.web0725.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0725.Vo.BVo;
import com.site.web0726.Dao.BDao;

public class BServiceView implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		BVo bVo = bDao.selectOne(Integer.parseInt(request.getParameter("bid")));
		request.setAttribute("bVo", bVo);
	}

}
