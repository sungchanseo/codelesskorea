package com.itwillbs.action.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.FaqDAO;
import com.itwillbs.db.FaqDTO;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.NoticeDTO;

public class FaqListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : FaqListAction.execute() 메소드 호출");
		
		
		ActionForward forward = new ActionForward();
		
//		if(id == null || !id.equals("admin")) {
//			forward.setPath("./MemberLogin.me");
//			forward.setRedirect(false);
//			return forward;
//		}
		
		//////////////////////////////////////////////////////////
		//페이징처리1/
		FaqDAO dao = new FaqDAO();

		int count = dao.getFaqCount();
		System.out.println("faqList의 getFaqCount()메소드 값 : "+count);
		int pageSize =5;
		int pageBlcok;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)	pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize+1;

		List<FaqDTO> faqList = dao.getFaqList(startRow, pageSize);
		
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
		
		
		System.out.println("M : faq수 : "+faqList.size());
		//회원정보를 request 영역에 저장
		request.setAttribute("faqList", faqList);
		request.setAttribute("pageNum", pageNum);
		
		
		forward.setPath("./faq/faqList.jsp");
		forward.setRedirect(false);
		
		return forward;	
		
		
		
	}
}
