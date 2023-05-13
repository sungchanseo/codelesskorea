package com.itwillbs.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.NoticeDAO;
import com.itwillbs.db.NoticeDTO;

public class NoticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeUpdateAction_execute()메소드 호출!");
			
		request.setCharacterEncoding("UTF-8");
		
		//관리자 계정인지 확인 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("현재 계정 : "+id);
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin@gmail.com")) {
			forward.setPath("./NoticeList.no");
			forward.setRedirect(true);
			return forward;
		}
		
		String pageNum = request.getParameter("pageNum");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_id(Integer.parseInt(request.getParameter("notice_id")));
		
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		//공지사항 업데이트 메소드 호출 
		NoticeDAO dao = new NoticeDAO();
		dao.updateNotice(dto);
		
		//디비처리를 완료하고 페이지 이동 -> 티켓 가지고서
		forward = new ActionForward();
		forward.setPath("./NoticeContent.no?pageNum="+pageNum+"&notice_id="+request.getParameter("notice_id")); 
		forward.setRedirect(true);
		System.out.println("M : 공지사항 수정 완료=> 공지사항 보기 페이지로 이동합니다.");
		
		
		
		
		return forward;
	}

}
