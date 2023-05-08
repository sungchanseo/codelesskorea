package com.itwillbs.member.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.NoticeDAO;
import com.itwillbs.member.db.NoticeDTO;

public class NoticeWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeWriteAciton_execute() 호출!");
		
		//한글처리 
		request.setCharacterEncoding("UTF-8");
		
		//noticeDTO객체에 전달받은 공지사항 내용을 전달받아 초기화
		NoticeDTO dto = new NoticeDTO();
		
//		dto.setNotice_id(Integer.parseInt(request.getParameter("notice_id")));
		dto.setTitle(request.getParameter("title"));
		//글쓰기 날짜는 현재 날짜와 시간으로 지정
		dto.setDate(new Date(System.currentTimeMillis()));
		dto.setCount(0);
		dto.setNotice_image(request.getParameter("notice_image"));
		dto.setContent(request.getParameter("content"));
		
		//MemberDAO의 공지사항 쓰기 메소드 호출
		NoticeDAO dao = new NoticeDAO();
		dao.noticeWrite(dto);
		
		//디비처리를 완료하고 페이지 이동 -> 티켓 가지고서
		ActionForward forward = new ActionForward();
		forward.setPath("./NoticeList.me"); //공지사항 쓴 뒤에는 공지 보기 페이지로 이동한다. 
		forward.setRedirect(true);
		System.out.println("M : 공지사항 쓰기 완료=> 공지사항 보기 페이지로 이동합니다.");
		
		return forward;
	}

}
