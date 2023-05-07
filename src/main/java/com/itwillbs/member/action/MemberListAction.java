package com.itwillbs.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.member.db.MypageDAO;
import com.itwillbs.member.db.QnADTO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(" M : MemberListAction_execute() ");
		
		// 세션정보 제어(로그인 + 관리자일때만 사용)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin@gmail.com")) {
			JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
			return forward;
		}
		
		
		
		MemberDAO qdao = new MemberDAO();
		MemberDTO qdto = qdao.getMember(id);
		boolean blocked = qdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
			return forward;
		}
		
		// 회원정보 목록 - MemberDAO : getMemberList()
		MemberDAO dao = new MemberDAO();
//		List<MemberDTO> memberList =  dao.getMemberList();
	
		// request 영역에 저장
		
		
		
		

		System.out.println("모델: MypageQNAListAction안의 execute() 실행됨");
		
		// 페이징 처리*****************************
		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 10;
		// 현 페이지의 페이지값을 확인

		// 글 개수 체크하는 메서드, 정보 가져오는 메서드
		int count = dao.getMemberCount();

		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)	pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize+1;

		List<MemberDTO> memberList = dao.getMemberList(startRow, pageSize);
		request.setAttribute("memberList", memberList);
		System.out.println(" M : 회원 수 " + memberList.size() + "명");
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
		
		//회원정보를 request 영역에 저장
		request.setAttribute("pageNum", pageNum);
		
		
		
		
		// 연결된 view에 출력(./member/memberList.jsp)
		forward.setPath("./member/memberList.jsp");
		forward.setRedirect(false);
		System.out.println(forward);
		return forward;
	}

}