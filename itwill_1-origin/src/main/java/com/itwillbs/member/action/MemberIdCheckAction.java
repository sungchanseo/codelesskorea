package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.MemberDAO;

public class MemberIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		String check = dao.idCheck(id);
		PrintWriter out=response.getWriter();
		out.print(check);
		
		return null;
	}

}
