package com.itwillbs.action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.MemberDAO;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		  System.out.println(id);
		
		  MemberDAO dao = new MemberDAO();
		  String result = dao.idCheck(id);
		  PrintWriter out = response.getWriter();
		  if(result =="1"){
			  out.print("no");
		  }else{
			  out.print("yes");
		  }
		return null;
	}

}