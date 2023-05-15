package com.itwillbs.action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;

public class KakaoLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
System.out.println(" M : MemberLoginAction_execute() 호출 ");
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");

		// 세션에 아이디정보 저장
		HttpSession session = request.getSession();
		session.setAttribute("id",id);
		
		// 페이지 이동-ActionForward객체 생성
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.me");
		forward.setRedirect(true);
		
		return forward;
	}

}
