package com.itwillbs.action.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;
import com.itwillbs.db.FaqDAO;
import com.itwillbs.db.FaqDTO;

public class FaqContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: FaqContentAction_execute()메소드 호출!");
		
		/*
		 *  차단 사용자 세션제어 시작
		 */
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(id);
		boolean blocked = mdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
			return forward;
		}
		/*
		 *  차단 사용자 세션제어 끝
		 */
		
		String faq_id = request.getParameter("faq_id");
		String pageNum = request.getParameter("pageNum");
		
		forward = new ActionForward();
		
		FaqDAO dao = new FaqDAO();
		//글정보 불러오기 메소드 호출
		FaqDTO dto = dao.getFaqContent(faq_id);
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		forward.setPath("./faq/faqContent.jsp");
		forward.setRedirect(false);
		
		
		
		
		
		
		return forward;
	}

}
