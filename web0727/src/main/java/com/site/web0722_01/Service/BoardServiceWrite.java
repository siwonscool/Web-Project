package com.site.web0722_01.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.site.web0722_01.Dao.BDao;

public class BoardServiceWrite implements BoardService{
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		int result=0;
		
		String cpath="c:/upload";
		int size = 10*1024*1024;
		try {
			MultipartRequest multi = new MultipartRequest(request,cpath,size,"utf-8",new DefaultFileRenamePolicy());
			String bname = multi.getParameter("bname");
			String btitle = multi.getParameter("btitle");
			String bcontent = multi.getParameter("bcontent");
			String bupload = multi.getFilesystemName("file1");
			
			//게시판 1개 저장
			result = bDao.boardWrite(bname,btitle,bcontent,bupload);
			request.setAttribute("result", result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
