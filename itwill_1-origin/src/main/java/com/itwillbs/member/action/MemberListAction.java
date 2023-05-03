package com.itwillbs.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberListAction_execute() ");
		
		// 세션정보 제어(로그인 + 관리자일때만 사용)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 회원정보 목록 - MemberDAO : getMemberList()
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> memberList =  dao.getMemberList();
		System.out.println(" M : 회원 수 " + memberList.size() + "명");
		// request 영역에 저장
		request.setAttribute("memberList", memberList);
		
		// 연결된 view에 출력(./member/memberList.jsp)
		forward.setPath("./member/memberList.jsp");
		forward.setRedirect(false);
		System.out.println(forward);
		return forward;
	}

}
