package com.itwillbs.action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;

public class AjaxEmail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AjaxEmail_execute ");

		/*
		 *  차단 사용자 세션제어 시작
		 */
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(userid);
		boolean blocked = mdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
			return forward;
		}
		/*
		 *  차단 사용자 세션제어 끝
		 */
		
		
		 response.setContentType("text/html; charset=UTF-8");
		 String email = request.getParameter("email");
		
		  System.out.println(email);
		
		  MemberDAO dao = new MemberDAO();
		  String result = dao.emailCheck(email);
		  
		  PrintWriter out = response.getWriter();
		  if(result =="1"){
			  out.print("no");
		  }else{
			  out.print("yes");
		  }
		
		return null;
	}

}
