package com.site.web0726.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.site.web0728.Dao.MDao;
import com.site.web0728.Vo.MVo;

public class MServiceLogin implements MService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MDao mDao = new MDao();
		MVo mVo = mDao.mLoginSelect(request.getParameter("id"), request.getParameter("pw"));
		if(mVo!=null) {
			session.setAttribute("session_id", mVo.getId());
			session.setAttribute("session_pw", mVo.getPw());
			session.setAttribute("session_flag", "success");
		}
	}

}
