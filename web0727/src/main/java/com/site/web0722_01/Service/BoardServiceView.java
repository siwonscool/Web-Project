package com.site.web0722_01.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0722_01.Vo.BVo;
import com.site.web0722_01.Dao.BDao;

public class BoardServiceView implements BoardService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		// boardList.jsp에서 파라미터값으로 bid전달 받음
		int bid = Integer.parseInt(request.getParameter("bid"));
		//게시판 1개 가져오기
		BVo bVo = bDao.boardOneList(bid);
		int page = 1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		request.setAttribute("page", page);
		request.setAttribute("bVo", bVo);

	}

}
