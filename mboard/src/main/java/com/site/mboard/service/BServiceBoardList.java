package com.site.mboard.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.mboard.dao.BDao;
import com.site.mboard.vo.BVo;

public class BServiceBoardList implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		String category="";
		String keyword="";
		
		if(request.getParameter("category")!=null) {
			category=request.getParameter("category");
			keyword=request.getParameter("keyword");
		}
		System.out.println("category : "+category);
		System.out.println("keyword : "+keyword);
		int listcount = bDao.boardCountSelect(category, keyword);
		int page = 1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10; //한페이지당 최대개수
		int numlimit=10; //하단에 보여지는 리스트 선택 갯수
		int maxpage =(int)((double)listcount/limit+0.99);
		int startpage = (((int)((double)page/limit+0.99))-1)*numlimit+1;
		
		int endpage = maxpage;
		if(endpage>startpage+numlimit-1)endpage=startpage+numlimit-1;
		
		//10개데이터 검색범위
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		
		ArrayList<BVo> list = bDao.boardAllSelect(category, keyword, startrow, endrow);
		request.setAttribute("list", list);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("category", category);
		request.setAttribute("keyword", keyword);
		request.setAttribute("page", page);
	}

}
