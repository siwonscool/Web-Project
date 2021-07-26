package com.site.web0725.Service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.site.web0726.Dao.BDao;

public class BServiceWrite implements BService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		BDao bDao = new BDao();
		String path="c:/upload";
		int size = 10*1024*1024;
		int result=0;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size,"utf-8", new DefaultFileRenamePolicy());
			result = bDao.insertBoard(multi.getParameter("bTitle"), multi.getParameter("bName"),
					multi.getParameter("bContent"), multi.getFilesystemName("file"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("result", result);
	}

}
