package com.site.web0725.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0725.Vo.BVo;
import com.site.web0726.Dao.BDao;

public class BServiceList implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		ArrayList<BVo> list= bDao.selectAll();
		request.setAttribute("list", list);
	}
}
