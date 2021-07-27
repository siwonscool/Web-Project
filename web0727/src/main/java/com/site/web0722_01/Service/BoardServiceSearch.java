package com.site.web0722_01.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0722_01.Dao.BDao;
import com.site.web0722_01.Vo.BVo;

public class BoardServiceSearch implements BoardService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		
		//하단 넘버링 관련정보
		int page = 1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int listcount = bDao.boardCountSelect();
		int maxpage =(int)((double)listcount/limit+0.99);
		int startpage = (((int)((double)page/limit+0.99))-1)*limit+1;
		
		int endpage = maxpage;
		if(endpage>startpage+10-1)endpage=startpage+10-1;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		
		//10개데이터 검색범위
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		String category = request.getParameter("category");
		String search_lang =request.getParameter("search_lang");
		//게시판 전체리스트 가져오기
		ArrayList<BVo> list = bDao.boardSearch(category,search_lang,startrow,endrow);
		request.setAttribute("list", list);

	}

}
