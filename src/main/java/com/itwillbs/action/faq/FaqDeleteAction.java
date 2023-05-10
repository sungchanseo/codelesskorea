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

public class FaqDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : FaqDeleteAction_execute()메소드 호출! ");
		
		//공지사항 계정이 admin인지 확인 
		/*
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();

		if(id.equals("admin")) {
			forward.setPath("./FaqList.me");
			forward.setRedirect(false);
			return forward;
		}
		*/
		FaqDAO dao = new FaqDAO();
		FaqDTO dto = new FaqDTO();
		dto.setFaq_id(Integer.parseInt(request.getParameter("faq_id")));
		int result = dao.deleteFaq(dto);
		
		if(result ==1) {
			JSForward.alertAndMove(response, "게시글 삭제 성공!", "./FaqList.fa");
		}
		
		
		return null;
	}

}
