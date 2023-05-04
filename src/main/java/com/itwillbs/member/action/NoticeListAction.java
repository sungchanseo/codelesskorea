package com.itwillbs.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.NoticeDTO;

public class NoticeListAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeListAction.execute() 메소드 호출");
		
		
		ActionForward forward = new ActionForward();
		
//		if(id == null || !id.equals("admin")) {
//			forward.setPath("./MemberLogin.me");
//			forward.setRedirect(false);
//			return forward;
//		}
		
		//공지 목록  -> getNoticeList()메소드 호출
		MemberDAO dao = new MemberDAO();
		
		List<NoticeDTO> noticeList = dao.getNoticeList();
		System.out.println("M : 공지수 : "+noticeList.size());
		//회원정보를 request 영역에 저장
		request.setAttribute("noticeList", noticeList);
		
		//연결한 view 페이지에 출력 -> ./member/memberList.jsp 
		forward.setPath("./notice/noticeList.jsp");
		forward.setRedirect(false);
		
		return forward;	
		
		
		
	}
}
