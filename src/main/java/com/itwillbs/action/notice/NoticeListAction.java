package com.itwillbs.action.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.NoticeDAO;
import com.itwillbs.db.NoticeDTO;

public class NoticeListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeListAction.execute() 메소드 호출");
		
		
		ActionForward forward = new ActionForward();
		
//		if(id == null || !id.equals("admin")) {
//			forward.setPath("./MemberLogin.me");
//			forward.setRedirect(false);
//			return forward;
//		}
		
		//////////////////////////////////////////////////////////
		//페이징처리1/
		NoticeDAO dao = new NoticeDAO();

		int count = dao.getBoardCount();
		System.out.println("noticeList의 getBoardCount()메소드 값 : "+count);
		int pageSize =5;
		int pageBlcok;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)	pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize+1;

		List<NoticeDTO> noticeList = dao.getNoticeList(startRow, pageSize);
		
		//////////////////////////////////////////////////////////

		
		//////////////////////////////////////////////////////////
		//페이징처리2/
		int pageCount;
		int pageBlock;
		int startPage;
		int endPage;
		
		if(count !=0) {
			pageCount = count/pageSize + (count%pageSize == 0?0:1);
			pageBlock = 5;
			
			startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			
			endPage = startPage+pageBlock-1;
			if(endPage>pageCount) endPage = pageCount;
			
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
		}
		
		//////////////////////////////////////////////////////////
		
		
		
		
//		공지 목록  -> getNoticeList()메소드 호출
//		MemberDAO dao = new MemberDAO();
		
//		List<NoticeDTO> noticeList = dao.getNoticeList();
		System.out.println("M : 공지수 : "+noticeList.size());
		//회원정보를 request 영역에 저장
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageNum", pageNum);
		
		
		
		//연결한 view 페이지에 출력 -> ./member/memberList.jsp 
		forward.setPath("./notice/noticeList.jsp");
		forward.setRedirect(false);
		
		return forward;	
		
		
		
	}
}
