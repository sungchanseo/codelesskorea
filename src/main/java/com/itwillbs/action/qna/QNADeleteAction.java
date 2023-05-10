package com.itwillbs.action.qna;

import java.io.PrintWriter;

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

public class QNADeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = (String) request.getAttribute("pageNum");	
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		QnADTO qdto = new QnADTO();
		if(id == null || !id.equals("admin@gmail.com")) {
			JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
			return forward;
		}
		
		// 차단 사용자 세션제어
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(id);
		boolean blocked = dto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
			return forward;
		}
		
		
		//BoardDAO객체생성 deleteBoard
		MypageDAO mdao = new MypageDAO();
		int result = mdao.deleteQNA(bno);
		System.out.println("M: DB처리완료 ->"+result);
		
		//처리결과를 js사용하여 페이지 이동
		//인코딩
		response.setContentType("text/html; charset=UTF-8");
		//출력통로생성
		PrintWriter out = response.getWriter();
		System.out.println("result : "+result);
        if(result == 1){ // 글하나 작성완료
        	JSForward.alertAndMove(response, "글삭제 성공!", "./AdminQNAList.me");
//        	forward.setPath("./MypageQNAList.me");
//        	forward.setRedirect(true);
        }else if(result == 2){
        	//에러 상황( 자바스크립트 / 페이지 이동 )
        	JSForward.alertAndMove(response, "글삭제 성공!(관리자의 답변과 함께삭제 되었습니다)", "./AdminQNAList.me");
//        	forward.setPath("./Main.me");
//        	forward.setRedirect(true);
        }else {
        	JSForward.alertAndBack(response, "글삭제 실패!");
        } 
        
		
		return null;
		
	}
		
}