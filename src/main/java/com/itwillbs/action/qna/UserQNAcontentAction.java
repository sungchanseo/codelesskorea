package com.itwillbs.action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;
import com.itwillbs.db.MypageDAO;
import com.itwillbs.db.QnADTO;

public class UserQNAcontentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id == null ) {
			JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
			return forward;
		}
		
		// 차단 사용자 세션제어
		MemberDAO dao = new MemberDAO();
		MemberDTO mdto = dao.getMember(id);
		boolean blocked = mdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
			return forward;
		}
		
		request.setCharacterEncoding("UTF-8");
		// 1. 전달받은 데이터 저장(bno, pageNum)
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		//2. BoardDAO 객체 생성
		MypageDAO mdao = new MypageDAO();
		//3.조회수 1증가
//		mdao.updateReadCount(bno);
		
		//4.특정 번호에 해당하는 글 정보 가져오기
		QnADTO qdto = mdao.getBoard(bno);
		
		//5.리퀘스트영역에 정보저장
		request.setAttribute("qdto", qdto);
		request.setAttribute("mdto", mdto);
		//pageNum도 함께 전달해야한다
		request.setAttribute("pageNum", pageNum);
		

		
		//6. 화면출력하는 뷰페이지(.jsp)로 전달
//		ActionForward forward = new ActionForward();
		forward.setPath("./qna/qnaContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}