package com.itwillbs.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.NoticeDAO;
import com.itwillbs.db.NoticeDTO;

public class NoticeContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: NoticeContentAction_execute()메소드 호출!");
		
		NoticeDTO dto = new NoticeDTO();
		
//		HttpSession session = request.getSession();
//		String notice_id = (String) session.getAttribute("notice_id");
		
		String notice_id = request.getParameter("notice_id");
		String pageNum = request.getParameter("pageNum");
		
		ActionForward forward = new ActionForward();
		
		NoticeDAO dao = new NoticeDAO();
		//글정보 불러오기 메소드 호출
		NoticeDTO dto1 = dao.getNoticeContent(notice_id);
		
		//글정보를 불러왔으니 조회수를 증가시켜야겠지 메소드 호출
		dao.updateReadCount(notice_id);
		
		request.setAttribute("dto", dto1);
		request.setAttribute("pageNum", pageNum);
		
		forward.setPath("./notice/noticeContent.jsp");
		forward.setRedirect(false);
		
		
		
		
		
		
		return forward;
	}

}
