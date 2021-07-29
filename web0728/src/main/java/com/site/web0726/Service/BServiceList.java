package com.site.web0726.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.web0728.Dao.BDao;
import com.site.web0728.Vo.BVo;

public class BServiceList implements BService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		
		String keyword="";
		String category="";
		
		if(request.getParameter("category")!=null) {
			keyword = request.getParameter("keyword");
			category = request.getParameter("category");			
		}
		int listcount = bDao.boardCountSelect(keyword,category); //list 총 게시글 수			
		
		
		int page = 1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		int limit = 5; //한페이지당 최대개수
		int numlimit=5; //하단에 보여지는 리스트 선택 갯수
		int maxpage =(int)((double)listcount/limit+0.99);
		int startpage = (((int)((double)page/limit+0.99))-1)*numlimit+1;
		
		int endpage = maxpage;
		if(endpage>startpage+numlimit-1)endpage=startpage+numlimit-1;
		
		//10개데이터 검색범위
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		ArrayList<BVo> list = bDao.boardListSelect(startrow,endrow,category,keyword);
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("category", category);
		request.setAttribute("keyword", keyword);		
		request.setAttribute("list", list);
	}

}
