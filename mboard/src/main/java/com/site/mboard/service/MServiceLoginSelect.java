package com.site.mboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.site.mboard.dao.MDao;
import com.site.mboard.vo.MVo;

public class MServiceLoginSelect implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MDao mDao = new MDao();
		MVo mVo = mDao.memberLoginSelect(request.getParameter("id"), request.getParameter("pw"));
		request.setAttribute("mVo", mVo);
		HttpSession session = request.getSession();
		
		if(mVo!=null) {
			session.setAttribute("session_id", mVo.getId());
			session.setAttribute("session_pw", mVo.getPw());
			session.setAttribute("session_flag", "success");			
		}else {
			session.setAttribute("session_flag", "fail");						
		}
	}

}
