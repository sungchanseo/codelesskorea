package com.itwillbs.action.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.FaqDAO;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.FaqDAO;
import com.itwillbs.db.FaqDTO;

public class FaqUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : FaqUpdateAction_execute()메소드 호출!");
			
		request.setCharacterEncoding("UTF-8");
		
		FaqDTO dto = new FaqDTO();
		dto.setFaq_id(Integer.parseInt(request.getParameter("faq_id")));
		
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		//공지사항 업데이트 메소드 호출 
		FaqDAO dao = new FaqDAO();
		dao.updateFaq(dto);
		
		//디비처리를 완료하고 페이지 이동 -> 티켓 가지고서
		ActionForward forward = new ActionForward();
		forward.setPath("./FaqContent.fa?faq_id="+request.getParameter("faq_id")); //공지사항 쓴 뒤에는 공지 보기 페이지로 이동한다. 
		forward.setRedirect(true);
		System.out.println("M : FAQ 수정 완료=> FAQ 보기 페이지로 이동합니다.");
		
		
		
		
		return forward;
	}

}
