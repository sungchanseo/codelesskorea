package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.member.db.NoticeDTO;

public class NoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeDeleteAction_execute()메소드 호출! ");
		
		//공지사항 계정이 admin인지 확인 
		/*
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();

		if(id.equals("admin")) {
			forward.setPath("./NoticeList.me");
			forward.setRedirect(false);
			return forward;
		}
		*/
		MemberDAO dao = new MemberDAO();
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_id(Integer.parseInt(request.getParameter("notice_id")));
		int result = dao.deleteNotice(dto);
		
		if(result ==1) {
			JSForward.alertAndMove(response, "게시글 삭제 성공!", "./NoticeList.me");
		}
		
		
		return null;
	}

}
