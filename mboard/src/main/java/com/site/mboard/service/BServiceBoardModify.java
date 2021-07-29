package com.site.mboard.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.site.mboard.dao.BDao;
import com.site.mboard.vo.BVo;

public class BServiceBoardModify implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		String path = "c:/upload";
		int size= 10*1024*1024;
		int result=0;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size,"utf-8", new DefaultFileRenamePolicy());
			result=bDao.boardModifyUpdate(multi.getParameter("bId"),multi.getParameter("bTitle")
					, multi.getParameter("bContent"), multi.getFilesystemName("file"));
			request.setAttribute("bid", multi.getParameter("bId"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("result", result);
	}

}
