package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.NoticeDAO;
import com.itwillbs.member.db.NoticeDTO;

public class NoticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeUpdateAction_execute()메소드 호출!");
			
		request.setCharacterEncoding("UTF-8");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_id(Integer.parseInt(request.getParameter("notice_id")));
		
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		//공지사항 업데이트 메소드 호출 
		NoticeDAO dao = new NoticeDAO();
		dao.updateNotice(dto);
		
		//디비처리를 완료하고 페이지 이동 -> 티켓 가지고서
		ActionForward forward = new ActionForward();
		forward.setPath("./NoticeList.me"); //공지사항 쓴 뒤에는 공지 보기 페이지로 이동한다. 
		forward.setRedirect(true);
		System.out.println("M : 공지사항 수정 완료=> 공지사항 보기 페이지로 이동합니다.");
		
		
		
		
		return forward;
	}

}
